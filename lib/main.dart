// 경기대학교 소성박물관 1차 UI
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doublecultureapp/screen/login.dart';
import "package:doublecultureapp/menu/home.dart";
import "package:doublecultureapp/menu/QR.dart";
import "package:doublecultureapp/menu/review.dart";
import "package:doublecultureapp/menu/plus.dart";

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.orange,
          primaryColor: const Color(0xFF1a2d74),
          accentColor: const Color(0xFF1a2d74),
          canvasColor: const Color(0xFFaabdf5),
        ),
        debugShowCheckedModeBanner: false, // Debug 배너 제거
        home: AuthPage());
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

  Future<bool> _onBackPressed() {
    return showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("exit?"),
            actions: <Widget>[
              FlatButton(
                child: Text("ok"),
                onPressed: () => Navigator.pop(context, true),
              ),
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
    return WillPopScope(
        onWillPop: _onBackPressed,
        child: Scaffold(
          appBar: AppBar(
            title: Text('학교 밖 수원을 보다'),
            centerTitle: true,
          ),
          body: _menu[_index],
          bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              setState(
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
                  backgroundColor: Color(0xFF1a2d74)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.photo_camera),
                  title: Text('QR코드'),
                  backgroundColor: Color(0xFF1a2d74)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.pages),
                  title: Text('소감작성'),
                  backgroundColor: Color(0xFF1a2d74)),
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_circle),
                  title: Text('더보기'),
                  backgroundColor: Color(0xFF1a2d74)),
            ],
            selectedItemColor: Color(0xFFf5fd9b),
          ),
        ));
  }
}
