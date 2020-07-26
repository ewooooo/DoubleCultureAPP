import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:doublecultureapp/plus/notice.dart";
import 'package:doublecultureapp/museum/Museum_BusWeb.dart';
import "package:doublecultureapp/plus/community.dart";
import "package:doublecultureapp/screen/login.dart";
import "package:doublecultureapp/plus/change_PW.dart";
import "package:doublecultureapp/plus/check.dart";
//import "package:doublecultureapp/plus/example.dart";
import 'package:doublecultureapp/data/UserData.dart';
import 'package:doublecultureapp/data/UserData.dart';
class Plus extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Stack(
        children: <Widget>[
    Container(
    decoration: BoxDecoration(
        image: DecorationImage(
        image: AssetImage('assets/background.jpg'),
    fit: BoxFit.cover,
    ),
    ),
    ),
    ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListTile(
          title: Text('프로그램 이수 충족여부 확인'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Completion()),
            );
          },
        ),
        ListTile(
          title: Text('프로그램 설명'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notice()),
            );
          },
        ),
        ListTile(
          title: Text('커뮤니티'),
          trailing: Icon(Icons.navigate_next),
          onTap:() async{

            items = await server.getCoumunity(1);
            if (items == null) {
              Token token = await server.getToken(
                  userData.username, userData.password);
              if (token == null) {
                Navigator.pop(context);
              }
              items = await server.getCoumunity(1);
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Community()),
            );
          },
        ),
        ListTile(
          title: Text('비밀번호 변경'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => ChangePW()),
            );
          },
        ),
        ListTile(
          title: Text('로그아웃'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.pop(
              context,
              MaterialPageRoute(builder: (context) => AuthPage()),
            );
          },
        ),
        /*ListTile(
          title: Text('테스트'),
          trailing: Icon(Icons.navigate_next),
          onTap:() async{

            items = await server.getCoumunity(1);
            if (items == null) {
              Token token = await server.getToken(
                  userData.username, userData.password);
              items = await server.getCoumunity(1);
            }
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Community2()),
            );
          },
        ),*/
      ],
    ),
    ],
    );
  }
}
