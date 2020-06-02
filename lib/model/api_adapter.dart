import 'package:geolocator/geolocator.dart';


import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

import 'package:doublecultureapp/model/model_user.dart';
const _API_PREFIX = "http://172.16.142.164:8000/"; //HTTP 주소

class Server{
  String token = "";

  Future<Token> getToken(String id, String pw) async{
    final http.Response response = await http.post(
      _API_PREFIX+"api/token/",
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          {
            'username' : id,
            'password' : pw
          }
      ),
    );
    print(response.body);
    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      Token t =Token.fromJson(j);
      this.token = t.token;
      return t;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }

  Future<Museum> getMuseum(String id) async{
    final http.Response response = await http.get(
      _API_PREFIX+"app/museum/$id/",
    );
    print(response.body);
    print(utf8.decode(response.bodyBytes));
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      print(j);
      Museum m =Museum.fromJson(j);
      print(m.quiz3);
      return m;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }

  Future<UserMuseum> getUser() async{
    final http.Response response = await http.get(
      _API_PREFIX+"app/usermuseum/소성박물관/",
      headers: <String, String>{'Authorization': "jwt "+token},
    );
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      print(j);
      UserMuseum um =UserMuseum.fromJson(j);
      print(um.stampStatus);
      return um;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }

  Future<UserMuseum> postUser() async{
    String test = "rerer18989r";
    final http.Response response = await http.put(
      _API_PREFIX+"app/usermuseum/소성박물관/",
      headers: <String, String>{
        'Authorization': "jwt "+token,
        'Content-Type': 'application/json'//'application/json; charset=UTF-8',
      },
      body: jsonEncode(
          {
            'quizNumber' : '3',
            'quizAnswer' : test
          }
      ),
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      // If the server did return a 200 OK response, then parse the JSON.
      String body = utf8.decode(response.bodyBytes);
      dynamic j = json.decode(body);
      print(j);
      UserMuseum um =UserMuseum.fromJson(j);
      print(um.stampStatus);
      return um;
    } else {
      // If the server did not return a 200 OK response, then throw an exception.
      throw Exception('Failed to load Museum');
    }
  }
  Future<UserMuseum> testDef() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
  }
}




Server server = Server();