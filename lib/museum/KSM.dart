import 'package:doublecultureapp/data/UserData.dart';
import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class KSM extends StatelessWidget {
  String museumName;
  String quiz;
  bool stempState; //스템프 찍었는지 여부
  TextEditingController textController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('경기대학교소성박물관'),
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
                              Text('학기중 : 오전 10시 ~ 오후 5시'),
                              Text('방학중 : 오전 10시 ~ 오후 2시'),
                              Text(
                                '휴관일',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text('토요일, 일요일 및 공휴일'),
                              Text('매년 11월8일(개교기념일)'),
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
                        child: Image.asset('assets/STAMP_EMPTY.png')),
                  ],
                ),
              ),
            ),
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(36.0),
                child: Column(
                  children: <Widget>[
                    Text(
                      quiz,
                    ),
                    Text(
                        '1. 광교 역사문화실에는 광교 신도시를 조성하며 출토된 발굴 유물들이 전시되어 있습니다. 전시장을 관람하고, 안동 김씨 문중이 살던 곳에서 출토된 유물들에 대해 적어보세요.\n'),
                    Text(
                        '2. 2층은 기증자료실 (소강 민관식실, 사운 이종학실)로 구성되어 있습니다. 전시장을 관람한 뒤 가장 역사적 가치가 높다고 생각하는 사료 한 가지와 그것이 주는 의미를 기술해 보세요.\n'),
                    TextField(
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
                        UserMuseum testMuseum = await server.postUserMuseum( museumName, textController.text);
                        if (testMuseum == null){
                          Token token = await server.getToken(userData.username,userData.password);
                          testMuseum = await server.postUserMuseum( museumName, textController.text);
                        }else{
                          if (testMuseum.stampStatus == this.stempState || testMuseum.quiz_answer == this.textController.text ){
                            printToast("성공적으로 등록되었습니다.");
                          }else{
                            printToast("다시한번 시도해주세요. \n 안내메시지가 계속 나올시 연락부탁드립니다.");
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