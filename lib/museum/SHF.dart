import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:doublecultureapp/museum/Museum_BusWeb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SHF extends StatelessWidget {
  String museumName;
  String quiz1, quiz2, quiz3;
  bool stempState; //스템프 찍었는지 여부
  TextEditingController textController = new TextEditingController();
  String stp;
  String stampData = "";

  stamp(stempSt) {
    if (stempSt == true) {
      stp = 'assets/STAMP_SHF.png';
    } else {
      stp = 'assets/STAMP_EMPTY.png';
    }
    return stp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수원화성'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.directions_bus, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SHF_bus()),
              );
            },
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: PageView(
          children: <Widget>[
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20,40,20,20),
                child: Column(
                  children: <Widget>[
                    Text('수원화성',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        )),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/SS_SHF.jpg',
                              width: MediaQuery.of(context).size.width / 2.5),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('관람시간',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green,
                                  )),
                              Text(
                                '동절기(3~10월) : \n오전 9시 ~ 오후 6시',
                              ),
                              Text('하절기(11~2월) : \n오전 9시 ~ 오후 5시'),
                              Text(
                                '휴관일',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text('매달 첫째 월요일'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '전시해설 안내',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.green,
                            ),
                          ),
                          Text('오전 9시 / 10시 / 11시 / 12시\n'),
                          Text(
                              '수원화성행궁은 사전 제478호로 1789년(정조 13) 수원 신읍치 건설 후 팔달산 동쪽 기슭에 건립되었다. 행궁은 왕이 전란, 휴양, 능원 참배 등의 이유로 지방에 머무를 때 임시 거처하는 곳을 말한다. 수원화성행궁은 왕이 지방의 능원에 참배할 때 머물던 행궁이었다. 총 567칸으로 국내 존재하는 행궁 중 가장 큰 규모를 자랑한다.',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    Stack(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Image.asset(stamp(stempState))),
                        Column(
                          children: <Widget>[
                            Container(
                                height: MediaQuery.of(context).size.width / 4),
                            Center(
                                child: Text(
                              stampData,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: const Color(0xFFbc2b2b),
                              ),
                            )),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(30,40,30,30),
                child: Column(
                  children: <Widget>[
                    Text(quiz1),
                    Text(quiz2),
                    Text(quiz3),
                    TextField(
                      style: TextStyle(),
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: '여기에 입력하세요\n\n\n\n\n\n\n\n\n\n',
                        hintMaxLines: 12,
                        fillColor: Colors.white,
                      ),
                    ),
                    RaisedButton(
                      child: Text('제출'),
                      color: Colors.white,
                      onPressed: () async {
                        if (!waitblock) {
                          waitblock = true;
                          if (textController.text.length < 16) {
                            printToast("글자수를 15 이상 넘겨주세요.");
                          } else {
                            UserMuseum testMuseum = await server.postUserMuseum(
                                museumName, textController.text);
                            if (testMuseum != null) {
                              if (testMuseum.stampStatus == this.stempState ||
                                  testMuseum.quiz_answer ==
                                      this.textController.text) {
                                printToast("성공적으로 등록되었습니다.");
                              } else {
                                printToast(
                                    "다시한번 시도해주세요. \n 안내메시지가 계속 나올시 연락부탁드립니다.");
                              }
                            }
                          }
                          waitblock = false;
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
