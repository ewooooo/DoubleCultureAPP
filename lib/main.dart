// 경기대학교 소성박물관 1차 UI
import 'package:doublecultureapp/data/UserData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doublecultureapp/screen/login.dart';
import 'package:doublecultureapp/data/join_or_login.dart';
import 'package:provider/provider.dart';
import "package:doublecultureapp/menu/home.dart";
import "package:doublecultureapp/menu/QR.dart";
import "package:doublecultureapp/menu/review.dart";
import "package:doublecultureapp/menu/plus.dart";

import 'myHttp/AdapHttp.dart';
import 'myHttp/model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF3f51b5),
        accentColor: const Color(0xFF3f51b5),
        canvasColor: const Color(0xFFaabdf5),
      ),
      home: ChangeNotifierProvider<JoinOrLogin>.value(
          value: JoinOrLogin(),
          child: AuthPage()
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Review reviewPage;
  var _index = 0; //페이지 인덱스 0,1,2
  var _menu = [
    Home(),
    QR(),
    Review(),
    Plus(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
      ),
      body: _menu[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState (
                () {
              _index = index;

            },
          );
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('홈 화면'),
              backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera),
              title: Text('QR코드'),
              backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              title: Text('소감작성'),
              backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              title: Text('더보기'),
              backgroundColor: Colors.indigo),
        ],
        selectedItemColor: Colors.lightGreenAccent,
      ),
    );
  }
}

