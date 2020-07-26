import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:doublecultureapp/museum/Museum_BusWeb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SHM extends StatelessWidget {
  String museumName;
  String quiz1, quiz2, quiz3;
  bool stempState; //스템프 찍었는지 여부
  TextEditingController textController = new TextEditingController();
  String stp;
  String stampData = "";

  stamp(stempSt) {
    if (stempSt == true) {
      stp = 'assets/STAMP_SHM.png';
    } else {
      stp = 'assets/STAMP_EMPTY.png';
    }
    return stp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수원화성박물관'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.directions_bus, color: Colors.green),
            onPressed: (){
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SHM_bus()),
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
                    Text('수원화성박물관',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        )),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/SS_SHM.jpg',
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
                              '오전 10시 / 11시 / 12시,   오후 1시 / 2시 / 3시  \n(소요시간 30 ~ 50분)\n'),
                          Text(
                              ' 수원박물관은 수원의 유구한 역사와 문화를 다양하게 보여주는 수원역사박물관과 한국서예사의 흐름을 한 눈에 볼 수 있는 한국서예박물관으로 구성되어있다.',
                              style: TextStyle(
                                fontSize: 15.0,
                                color: Colors.black,
                              )),
                        ],
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.asset(stamp(stempState))),
                    Text(stampData),
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
