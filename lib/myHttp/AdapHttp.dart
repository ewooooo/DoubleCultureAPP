import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:doublecultureapp/myHttp/model.dart';
const _API_PREFIX = "http://ec2-3-135-161-59.us-east-2.compute.amazonaws.com/"; //HTTP 주소

class Server {
  String token = "";

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
      throw Exception('Failed to load Museum');
    }
  }

  Future<int> singUp(String username, String password, String re_password,
      String email, String first_name, String last_name) async {
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
            'last_name': last_name
          }
      ),
    );
    if (response.statusCode == 201) {
      return 1; // 완료
    } else if (response.statusCode == 202) {
      return 3; // 중복아이디 체크
    } else if (response.statusCode == 400) {
      return 2; // 빈칸이나 비번 확인필요
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }


  Future<Token> getToken(String id, String pw) async {
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
      return t;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
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
      return false;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
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
    } else {
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
    } else {
      throw Exception('Failed to load Museum');
    }
  }

  Future<UserMuseum> postUserMuseum(String museumId, String quizNumber,
      String quizAnswer) async {
    final http.Response response = await http.put(
      _API_PREFIX + "app/usermuseum/$museumId/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
          {
            'quizNumber': quizNumber,
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
    } else {
      throw Exception('Failed to load Museum');
    }
  }

  Future<bool> updateStemp(String museumId, double latitude,
      double longitude) async {
    final http.Response response = await http.put(
      _API_PREFIX + "app/stemp/$museumId/",
      headers: <String, String>{
        'Authorization': "jwt " + token,
        'Content-Type': 'application/json'
      },
      body: jsonEncode(
          {
            'latitude': latitude,
            'longitude': longitude
          }
      ),
    );
    if (response.statusCode == 200) {
      return true;
    } else if (response.statusCode == 202) {
      return false;
    } else {
      throw Exception('Failed to load Museum');
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
      print(m.quiz3);
      return m;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }

  Future<bool> serverTest() async {
    final http.Response response = await http.get(
      _API_PREFIX + "app/test/",
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}

Server server = Server();