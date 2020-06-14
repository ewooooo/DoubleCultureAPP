import 'package:doublecultureapp/plus/bus.dart';
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
      body: Container(decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/background.jpg'),
          fit: BoxFit.cover,
        ),
      ),
        padding: const EdgeInsets.all(133.0),
        child: Column(children: <Widget>[
          Text(' 이수여부 확인\n',
              style: TextStyle(color: Colors.red, fontSize: 20.0)),
          //body
          Text('   모든 퀴즈와 소감문을\n    작성 후 눌러주세요.',),
          new Icon(Icons.arrow_downward, color: Colors.green, size: 30.0),
          RaisedButton(
            child: Text('관리자에게 요청', style: TextStyle(color: Colors.red)),
            color: Colors.white,
            onPressed: () {
              Navigator.push(//관리자 서버와 이수여부 확인 연동하기!!!
                context,
                MaterialPageRoute(builder: (context) => Check_yes_or_no()),
              );
            },
          ),
          Text('\n  문제발생시 연락주세요.\n        031-249-1483\n    (경기대 소성박물관)'),
        ]),
      ),
    );
  }
}

class Check_yes_or_no extends StatelessWidget {
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
      ),
    );
  }
}
