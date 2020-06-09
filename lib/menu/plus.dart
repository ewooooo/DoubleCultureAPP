import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:doublecultureapp/plus/notice.dart";
import "package:doublecultureapp/plus/bus.dart";
import "package:doublecultureapp/plus/community.dart";

class Plus extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
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
          title: Text('인증키 받기'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notice()),
            );
          },
        ),
        ListTile(
          title: Text('교통 정보'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Suwonmuseumbelt()),
            );
          },
        ),
        ListTile(
          title: Text('커뮤니티'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Community()),
            );
          },
        ),
        ListTile(
          title: Text('로그아웃'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Notice()),
            );
          },
        ),
      ],
    );
  }
}
