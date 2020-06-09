import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class SGM extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('수원광교박물관'),
      ),
      body: PageView(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                        child: SizedBox(
                          width: 180,
                          height: 120,
                          child: Image.asset('assets/SS_SGM.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: <Widget>[
                            Text('관람시간',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green,
                                )),
                            Text('오전 9시 ~ 오후 6시'),
                            Text(
                              '휴관일',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            Text('매달 첫째 월요일'),
                            Text(
                              '전시해설 안내',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.green,
                              ),
                            ),
                            Text(
                                '오전 9시 / 10시 / 11시 / 12시\n오후 1시 / 2시 / 3시 / 4시'),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      '수원광교박물관은 광교신도시 개발지역에서 발굴된 선사시대부터 근현대 시기의 유물을 전시하여 다양한 역사와 문화를 살펴볼 수 있다. 뿐만 아니라 수원 출신의 역사학자 사운 이종학 선생과 학창시절을 수원에서 보내 각별한 인연을 맺은 소강 민관식 선생의 기증우물을 통해 근현대 유물을 전시하여 보다 다양한 역사와 문화를 체험할 수 있다.',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                      ),
                    ),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '※ 다음 질문 중 한 가지를 선택하여 작성해주세요. (최소 6줄 이상 / 자유형식)\n',
                  ),
                  Text(
                      '1. 광교 역사문화실에는 광교 신도시를 조성하며 출토된 발굴 유물들이 전시되어 있습니다. 전시장을 관람하고, 안동 김씨 문중이 살던 곳에서 출토된 유물들에 대해 적어보세요. .\n'),
                  Text(
                      '2. 2층은 기증자료실 (소강 민관식실, 사운 이종학실)로 구성되어 있습니다. 전시장을 관람한 뒤 가장 역사적 가치가 높다고 생각하는 사료 한 가지와 그것이 주는 의미를 기술해 보세요.\n'),
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
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '소감 작성\n',
                  ),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '여기에 입력하세요\n\n\n\n\n\n\n\n\n',
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
    );
  }
}
