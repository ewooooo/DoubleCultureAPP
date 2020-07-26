import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'package:doublecultureapp/myHttp/model.dart';
import 'package:fluttertoast/fluttertoast.dart';


void printToast(String mesg){
  Fluttertoast.showToast(
      msg: mesg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.grey,
      textColor: Colors.white,
      fontSize: 16.0
  );
}

const _API_PREFIX = "http://ec2-18-216-189-42.us-east-2.compute.amazonaws.com/"; //HTTP 주소

class Server {
  String token = "";
  String username;
  String password;

  Future<bool> ckeckID(String id) async {
    final http.Response response = await http.put(
      _API_PREFIX + "app/singUp/",
      headers: <String, String>{
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
          {
            'username': id
          }
      ),
    );
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 202) {
      return false;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }

  Future<int> singUp(String username, String password, String re_password,
      String email, String first_name, String joinkey) async {
    final http.Response response = await http.post(
      _API_PREFIX + "app/singUp/",
      headers: <String, String>{
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
          {
            'username': username,
            'password': password,
            're_password': re_password,
            'email': email,
            'first_name': first_name,
            'joinkey' : joinkey,
            'appkey' : '940109'
          }
      ),
    );
    if (response.statusCode == 201) {
      return 1; // 완료
    } else if (response.statusCode == 202) {
      return 3; // 중복아이디 체크
    } else if (response.statusCode == 400) {
      return 2; // 빈칸이나 비번 확인필요
    } else if (response.statusCode == 401) {
      return 4; // 빈칸이나 비번 확인필요
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }

  Future<bool> getToken(String id, String pw) async {
    final http.Response response = await http.post(
      _API_PREFIX + "api/token/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          {
            'username': id,
            'password': pw
          }
      ),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      Token t = Token.fromJson(j);
      this.token = t.token;
      this.username = id;
      this.password = pw;
      return true;
    } else if(response.statusCode == 400){
      printToast("로그인 정보가 옳바르지 않습니다.");
      return false;
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }

  Future<bool> regetToken() async {
    final http.Response response = await http.post(
      _API_PREFIX + "api/token/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          {
            'username': this.username,
            'password': this.password
          }
      ),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      Token t = Token.fromJson(j);
      this.token = t.token;
      return true;
    } else if(response.statusCode == 400){
      return false;
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }

  Future<bool> checkToken() async {
    final http.Response response = await http.post(
      _API_PREFIX + "api/token/verify/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          {
            'token': token
          }
      ),
    );
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 400) {
      printToast("Server와 로그인 정보가 동일하지 않습니다.");
      SystemNavigator.pop();
      return false;
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }

  Future<User> getUser() async {
    final http.Response response = await http.get(
      _API_PREFIX + "app/login/",
      headers: <String, String>{'Authorization': "jwt " + token},
    );
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      User u = User.fromJson(j);
      return u;
    } else if(response.statusCode == 401){
      if(await this.regetToken()) {
        return this.getUser();
      }
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }


  Future<bool> postPassword(String password, String newPassword, String newPasswoedRe ) async {
    final http.Response response = await http.put(
      _API_PREFIX + "app/login/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
          {
            'password' : password,
            'new_password': newPassword,
            'new_password_re': newPasswoedRe
          }
      ),
    );

    if (response.statusCode == 200) {
      printToast("비밀번호가 성공적으로 변경되었습니다.");
      return true;
    } else if(response.statusCode == 402){
      printToast("두 비밀번호가 다름니다.");
      return false;
    } else if(response.statusCode == 400){
      printToast("현재 비밀번호가 다릅니다.");
      return false;
    } else if(response.statusCode == 401){
      if(await this.regetToken()) {
        return this.postPassword(password, newPassword,newPasswoedRe);
      }
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }

  Future<UserMuseum> getUserMuseum(String museumId) async {
    final http.Response response = await http.get(
      _API_PREFIX + "app/usermuseum/$museumId/",
      headers: <String, String>{'Authorization': "jwt " + token},
    );
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      UserMuseum um = UserMuseum.fromJson(j);
      return um;
    } else if(response.statusCode ==401){
      if(await this.regetToken()) {
        return this.getUserMuseum(museumId);
      }

    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }

  Future<UserMuseum> postUserMuseum(String museumId, String quizAnswer) async {
    final http.Response response = await http.put(
      _API_PREFIX + "app/usermuseum/$museumId/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
          {
            'quizAnswer': quizAnswer
          }
      ),
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      UserMuseum um = UserMuseum.fromJson(j);
      return um;
    } else if(response.statusCode == 401){
      if(await this.regetToken()) {
        return this.postUserMuseum(museumId,quizAnswer);
      }
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }

  Future<bool> updateStemp(String QR, double latitude,
      double longitude) async {
    final http.Response response = await http.put(
      _API_PREFIX + "app/stemp/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
          {
            'QR' : QR,
            'latitude': latitude,
            'longitude': longitude
          }
      ),
    );
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 202) {
      printToast("현재 위치가 올바르지 않습니다.");
      return false;
    } else if (response.statusCode == 202) {
      printToast("올바른 QR코드를 찍어주세요.");
      return false;
    } else if(response.statusCode == 401){
      if(await this.regetToken()) {
        return this.updateStemp(QR,latitude,longitude);
      }
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }

  Future<UserFeel> postFeel(String feelData) async {
    final http.Response response = await http.put(
      _API_PREFIX + "app/feel/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
          {
            'feel' : feelData
          }
      ),
    );
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      UserFeel uf = UserFeel.fromJson(j);
      return uf;
    } else if(response.statusCode == 401){
      if(await this.regetToken()) {
        return this.postFeel(feelData);
      }
    } else {
      return null;
    }
  }

  Future<UserFeel> getFeel() async {
    final http.Response response = await http.get(
      _API_PREFIX + "app/feel/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      UserFeel uf = UserFeel.fromJson(j);
      return uf;
    } else if (response.statusCode == 401) {
      if(await this.regetToken()) {
        return this.getFeel();
      }
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }

  Future<Museum> getMuseum(String id) async {
    final http.Response response = await http.get(
      _API_PREFIX + "app/museum/$id/",
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      Museum m = Museum.fromJson(j);
      return m;
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }

  Future<bool> serverTest() async {
    final http.Response response = await http.get(
      _API_PREFIX + "app/test/",
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }






  Future<List<post_model>> getCoumunity(int pageNum) async {
    final http.Response response = await http.get(
      _API_PREFIX + "/app/community_gd/$pageNum/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);

      List<post_model> list_post = [];
      for(var i in j){
        post_model pm = post_model.fromJson(i);
        list_post.add(pm);
      }
      return list_post;
    } else if (response.statusCode == 401) {
      if(await this.regetToken()) {
        return this.getCoumunity(pageNum);
      }
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }

  Future<bool> postCoumunity(String text) async {
    final http.Response response = await http.post(
      _API_PREFIX + "/app/community/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
          {
            'text' : text
          }
      ),
    );
    if (response.statusCode == 201) {
      return true;
    } else if (response.statusCode == 401) {
      if(await this.regetToken()) {
        return this.postCoumunity(text);
      }
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }

  Future<bool> delCoumunity(int pageNum) async {
    final http.Response response = await http.delete(
      _API_PREFIX + "/app/community_gd/$pageNum/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 204) {
      return true;
    } else if (response.statusCode == 401) {
      if(await this.regetToken()) {
        return this.delCoumunity(pageNum);
      }
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }

  Future<Map<String, dynamic>> stampstatus() async {
    final http.Response response = await http.get(
      _API_PREFIX + "/app/final/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
    );
    if (response.statusCode == 200) {
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);

      Map<String, dynamic> statusMap = Map();
      for(var i in j){
        Map<String, dynamic> jsonvalue = i;
        if(jsonvalue.containsKey('museum')){
          museumstatus_model pm = museumstatus_model.fromJson(jsonvalue);
          statusMap[pm.museum] = pm;

        }else if(jsonvalue.containsKey('feeling')){
          statusMap.addAll(i);
        }else{
          throw Exception('Failed to connection');
        }
      }
      return statusMap;
    } else if (response.statusCode == 401) {
      if(await this.regetToken()) {
        return this.stampstatus();
      }
    } else {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to connection');
    }
  }
}

Server server = Server();
