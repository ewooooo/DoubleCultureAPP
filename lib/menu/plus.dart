import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:doublecultureapp/plus/notice.dart";
import 'package:doublecultureapp/museum/Museum_BusWeb.dart';
import "package:doublecultureapp/plus/community.dart";
import "package:doublecultureapp/plus/change_PW.dart";
import "package:doublecultureapp/plus/check.dart";

import '../main.dart';

class Plus extends StatefulWidget {
  @override
  _PlusState createState() => _PlusState();
}

class _PlusState extends State<Plus> {
  Future<bool> _logoutPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("로그아웃 하시겠습니까?"),
            actions: <Widget>[
              FlatButton(
                  child: Text("ok"),
                  onPressed: () {
                    Navigator.pop(context, true);
                    Navigator.pop(context, true);
                  }),
              FlatButton(
                child: Text("cancel"),
                onPressed: () => Navigator.pop(context, false),
              ),
            ],
          ),
        ) ??
        false;
  }

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
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Completion()),
                );
              },
            ),
            ListTile(
              title: Text('프로그램 설명'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Notice()),
                );
              },
            ),
            ListTile(
              title: Text('커뮤니티'),
              trailing: Icon(Icons.navigate_next),
              onTap: () async {
                if (!waitblock) {
                  waitblock = true;
                  items = await server.getCoumunity(1);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Community()),
                  );
                  waitblock = false;
                }
              },
            ),
            ListTile(
              title: Text('비밀번호 변경'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ChangePW()),
                );
              },
            ),
            ListTile(
              title: Text('로그아웃'),
              trailing: Icon(Icons.navigate_next),
              onTap: () {
                _logoutPressed();
              },
            ),
          ],
        ),
      ],
    );
  }
}
