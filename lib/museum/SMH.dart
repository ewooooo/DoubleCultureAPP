import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SMH extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수원박물관'),
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
                    Text('수원박물관',
                        style: TextStyle(
                          fontSize: 34.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo,
                        )),
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset('assets/SS_SMH.jpg',
                              width: MediaQuery.of(context).size.width/2.5),
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
                              Text('오전 9시 ~ 오후 6시'),
                              Text('(오후 5시까지 입장)'),
                              Text('휴관일',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text('매달 첫째 월요일'),
                              Text('전시해설 안내',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                ),
                              ),
                              Text('박물관 안내 자원봉사자의\n상시 해설안내 가능\n(소요시간 약 20분)'),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          '수원박물관은 수원의 유구한 역사와 문화를 다양하게 보여주는 수원역사박물관과 한국서예사의 흐름을 한 눈에 볼 수 있는 한국서예박물관으로 구성되어있다.',
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
                      '※ 다음 질문 중 한 가지를 선택하여 작성해주세요. (최소 6줄 이상 / 자유형식)\n',
                    ),
                    Text(
                        '1. 박물관에서 소개하고 있는 ‘수원의 근대인물‘ 중 가장 인상 깊은 인물을 선택하고 그 이유를 서술하세요.\n'),
                    Text(
                        '2. 1960년대 수원의 모습을 재현한 전시장을 관람하고, 오늘날 수원의 모습과 비교해보세요.\n'),
                    TextField(
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
                      onPressed: () {},
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

