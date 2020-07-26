import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:doublecultureapp/museum/Museum_BusWeb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class SGM extends StatelessWidget {
  String museumName;
  String quiz1, quiz2, quiz3;
  bool stempState; //스템프 찍었는지 여부
  TextEditingController textController = new TextEditingController();
  String stp;
  String stampData = "";

  stamp(stempSt) {
    if (stempSt == true) {
      stp = 'assets/STAMP_SGM.png';
    } else {
      stp = 'assets/STAMP_EMPTY.png';
    }
    return stp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수원광교박물관'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.directions_bus, color: Colors.green),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SGM_bus()),
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
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: <Widget>[
                    Text('수원광교박물관',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        )),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/SS_SGM.jpg',
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
                                '오전 9시 ~ 오후 6시',
                              ),
                              Text('(오후 5시까지 입장)'),
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
                          Text(
                              '오전 9시 / 10시 / 11시 / 12시, 오후 1시 / 2시 / 3시 / 4시\n(소요시간 약 50분)'),
                          Text(
                              ' 수원광교박물관은 광교신도시 개발지역에서 발굴된 선사시대부터 근현대 시기의 유물을 전시하여 다양한 역사와 문화를 살펴볼 수 있다. 뿐만 아니라 수원 출신의 역사학자 사운 이종학 선생과 학창시절을 수원에서 보내 각별한 인연을 맺은 소강 민관식 선생의 기증우물을 통해 근현대 유물을 전시하여 보다 다양한 역사와 문화를 체험할 수 있다.',
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
                                height:
                                    MediaQuery.of(context).size.width / 3.5),
                            Center(
                                child: Text(
                              stampData,
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.teal),
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
                padding: const EdgeInsets.all(36.0),
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
