import 'package:doublecultureapp/data/UserData.dart';
import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Completion extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로그램 최종이수여부 확인'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        //padding: const EdgeInsets.fromLTRB(100, 133, 100, 133),
        child: Center(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              //crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
            Text(' 이수여부 확인\n',
                style: TextStyle(color: Colors.red, fontSize: 20.0)),
            //body
            Text(
              '   모든 퀴즈와 소감문을\n    작성 후 눌러주세요.',
            ),
            new Icon(Icons.arrow_downward, color: Colors.green, size: 30.0),
            RaisedButton(
              child: Text('관리자에게 요청', style: TextStyle(color: Colors.red)),
              color: Colors.white,
              onPressed: () async {
                User user = await server.getUser();
                if (user == null) {
                  Token token =
                      await server.getToken(userData.username, userData.password);
                  User user = await server.getUser();
                } else {
                  Check_yes_or_no page = Check_yes_or_no();
                  page.name = user.firstName;
                  page.studentID = user.username;
                  if (user.status) {
                    page.isoo = "정상 수료 되었습니다.";
                  } else {
                    page.isoo = "수료가 되지 않았습니다.";
                  }
                  Navigator.push(
                    //관리자 서버와 이수여부 확인 연동하기!!!
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                }
              },
            ),
            Text('\n  문제발생시 연락주세요.\n        031-249-1483\n    (경기대 소성박물관)'),
          ]),
        ),
      ),
    );
  }
}

class Check_yes_or_no extends StatelessWidget {
  String studentID = "";
  String name = "";
  String isoo = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('본인의 최종이수여부'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        padding: const EdgeInsets.all(120.0),
        child: Column(
          children: <Widget>[
            Column(children: <Widget>[
              Text('최종이수여부\n',
                  style: TextStyle(color: Colors.black, fontSize: 20.0)),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('이름 :   '),
                  Text(name),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('학번 :    '),
                  Text(studentID),
                ],
              ),
              Container(
                height: 10,
              ), // gat
              Icon(Icons.local_airport),
              Column(
                children: <Widget>[
                  Text("\n" + isoo,
                      style: TextStyle(color: Colors.black, fontSize: 12.0)),
                ],
              ),
              //body
            ]),
          ],
        ),
      ),
    );
  }
}
