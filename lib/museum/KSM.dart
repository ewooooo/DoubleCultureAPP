import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:doublecultureapp/museum/Museum_BusWeb.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class KSM extends StatelessWidget {

  String museumName;
  String quiz1, quiz2, quiz3;
  bool stempState; //스템프 찍었는지 여부
  TextEditingController textController = new TextEditingController();
  String stp;
  String stampData="";
  stamp(stempSt){
    if(stempSt==true){
      stp='assets/STAMP_KSM.png';
    }else{
      stp = 'assets/STAMP_EMPTY.png';
    }
    return stp;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('경기대학교소성박물관'),
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.directions_bus, color: Colors.green),
            onPressed: (){
              Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => KSM_bus()),
            );},
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
                    Text('경기대학교소성박물관',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        )),

                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/SS_KSM.jpg',
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width / 2.5),
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
                              Text('오전 10시 ~ 오후 5시'),
                              Text('(방학기간은 2시까지)'),
                              Text(
                                '휴관일',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text('토요일, 일요일 및 공휴일'),
                              Text('11월 8일(개교기념일)'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '경기대학교소성박물관은 전국에서 수집한 농경민속품으로 국내 최초의 농경전시실을 개관하였고, 우리나라에서 가장 많은 민화를 수집하여 매년 특별전을 개최하고 있다. 또한 중요무형문화재 제 100호 옥장 장주원선생의 작품도 만나 볼 수 있다.',
                          style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                          )),
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
                        if (textController.text.length < 16){
                        printToast("글자수를 15 이상 넘겨주세요.");
                        }else {
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