import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

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
          child: Column(mainAxisAlignment: MainAxisAlignment.center,
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
                    if (!waitblock) {
                      waitblock = true;
                      User user = await server.getUser();
                      Map<String, dynamic> stateData =
                          await server.stampstatus();
                      if (user != null && stateData != null) {
                        Check_yes_or_no page = Check_yes_or_no();
                        page.stateData = stateData;
                        page.name = user.firstName;
                        page.studentID = user.username;

                        Navigator.push(
                          //관리자 서버와 이수여부 확인 연동하기!!!
                          context,
                          MaterialPageRoute(builder: (context) => page),
                        );
                      }
                      waitblock = false;
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
  Map<String, dynamic> stateData;

  String isooCheck(bool value) {
    if (value == true) {
      return '완료';
    } else {
      return '미완료';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('본인의 최종이수여부'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Column(children: <Widget>[
                    Text('\n최종이수여부',
                        style: TextStyle(color: Colors.black, fontSize: 26.0)),
                    Text('이름 : ' + name + '      학번 : ' + studentID + '\n'),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: <Widget>[
                            Text(
                              '소성박물관   ',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text('\n'),
                            Text(
                              '수원광교박물관   ',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text('\n'),
                            Text(
                              '수원박물관   ',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text('\n'),
                            Text(
                              '수원화성박물관   ',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text('\n'),
                            Text(
                              '수원화성행궁   ',
                              style: TextStyle(fontSize: 17),
                            ),
                            Text('\n'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                                '스탬프 : ' + isooCheck(stateData['소성박물관'].stamp)),
                            Text('퀴즈 : ' + isooCheck(stateData['소성박물관'].quiz)),
                            Text(' ', style: TextStyle(fontSize: 13)),
                            Text('스탬프 : ' +
                                isooCheck(stateData['수원광교박물관'].stamp)),
                            Text(
                                '퀴즈 : ' + isooCheck(stateData['수원광교박물관'].quiz)),
                            Text(' ', style: TextStyle(fontSize: 13)),
                            Text(
                                '스탬프 : ' + isooCheck(stateData['수원박물관'].stamp)),
                            Text('퀴즈 : ' + isooCheck(stateData['수원박물관'].quiz)),
                            Text(' ', style: TextStyle(fontSize: 13)),
                            Text('스탬프 : ' +
                                isooCheck(stateData['수원화성박물관'].stamp)),
                            Text(
                                '퀴즈 : ' + isooCheck(stateData['수원화성박물관'].quiz)),
                            Text(' ', style: TextStyle(fontSize: 13)),
                            Text('스탬프 : ' + isooCheck(stateData['수원화성'].stamp)),
                            Text('퀴즈 : ' + isooCheck(stateData['수원화성'].quiz)),
                            Text(' ', style: TextStyle(fontSize: 10)),

                            //Text(' ')
                          ],
                        ),
                      ],
                    ),
                    Text(''),
                    Text('소감문 : ' + isooCheck(stateData['feeling']),
                        style: TextStyle(color: Colors.black, fontSize: 20.0)),
                    Text('\n최종이수 : ' + isooCheck(stateData['CompleteState']),
                        style: TextStyle(color: Colors.black, fontSize: 20.0)),
                    //body
                  ]),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
