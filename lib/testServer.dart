////import 'package:dio/dio.dart';
////////import 'package:flutter/cupertino.dart';
//////
//////import 'dart:async';
//////import 'dart:convert';
//////import 'dart:io';
//////import 'package:http/http.dart' as http;
//////
//////const _API_PREFIX = "http://192.168.0.5:8000/"; //HTTP 주소
//////
////////class Server{
////////  Future<void> getReq() async{
////////    Response response;
////////    Dio dio = new Dio();
////////    response = await dio.get("$_API_PREFIX");
////////    print(response.data.toString());
////////  }
////////
////////  Future<void> postReq() async{
////////    Response response;
////////    Dio dio = new Dio();
////////    response = await dio.post(_API_PREFIX,data:{"id" : 12, "name": "vidtorianoch!!!"});
////////    print(response.data.toString());
////////  }
////////
////////  Future<void> getReqWzQuery() async{
////////    Response response;
////////    Dio dio = new Dio();
////////    response = await dio.get(_API_PREFIX, queryParameters: {
////////      "userId":1,
////////      "id":2,
////////    });
////////    print(response.data.toString());
////////  }
////////}
//////
//////class Museum {
//////  final String museumName;
//////  final String hoToGo;
//////  final String quiz1;
//////  final String quiz2;
//////  final String quiz3;
//////
//////  Museum({this.museumName, this.hoToGo,this.quiz1,this.quiz2,this.quiz3});
//////
//////  factory Museum.fromJson(Map<String, dynamic> json) {
//////    return Museum(
//////        museumName: json['institution_number'],
//////        hoToGo: json['howtogo'],
//////        quiz1: json['quiz1'],
//////        quiz2: json['quiz2'],
//////        quiz3: json['quiz3'],
//////    );
//////  }
//////}
//////
//////class Server{
//////  Future<Museum> getMuseum(String id) async{
//////    final http.Response response = await http.get(
//////        _API_PREFIX+"app/museum/$id/",
////////      headers: <String, String>{
////////        'Content-Type': 'application/json; charset=UTF-8',
////////      },
//////    );
//////    print(response.body);
//////    print(utf8.decode(response.bodyBytes));
//////    if (response.statusCode == 200) {
//////      // If the server did return a 200 OK response, then parse the JSON.
//////      String body = utf8.decode(response.bodyBytes);
//////      dynamic j = json.decode(body);
//////      print(j);
//////      Museum m =Museum.fromJson(j);
//////      print(m.quiz3);
//////    } else {
//////      // If the server did not return a 200 OK response, then throw an exception.
//////      print("test");
//////      //throw Exception('Failed to load Museum');
//////    }
//////  }
//////  Future<http.Response> getUser() async{
//////    final http.Response response = await http.get(
//////      _API_PREFIX+"app/usermuseum/소성박물관",
//////      headers: {HttpHeaders.authorizationHeader: "jwt eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ1c2VyX2lkIjoxOSwidXNlcm5hbWUiOiJ0ZXN0aWQxMjMxMjMiLCJleHAiOjE1OTE1MjgwNTMsImVtYWlsIjoiZWJuZUBuZWFhdC5jb20iLCJvcmlnX2lhdCI6MTU5MDkyMzI1M30.2QjWKAi_plKQdvJura4aLjPjh-ejyKwjgO5sIXuNt5g"},
////////      headers: <String, String>{
////////        'Content-Type': 'application/json; charset=UTF-8',
////////      },
//////    //
//////    );
//////    print(response.statusCode);
//////    return response;
//////  }
////////
////////  Future<void> postReq() async{
////////    Response response;
////////    Dio dio = new Dio();
////////    response = await dio.post(_API_PREFIX,data:{"id" : 12, "name": "vidtorianoch!!!"});
////////    print(response.data.toString());
////////  }
////////
////////  Future<void> getReqWzQuery() async{
////////    Response response;
////////    Dio dio = new Dio();
////////    response = await dio.get(_API_PREFIX, queryParameters: {
////////      "userId":1,
////////      "id":2,
////////    });
////////    print(response.data.toString());
////////  }
//////}
//////
//////Server server = Server();