import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Notice extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로그램 설명'),
        centerTitle: true,
      ),
      body: Stack(children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  '경기대학교소성박물관에서\nKGU+포인트도 쌓고 장학금도 받자!',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
                Text(
                  '\n비교과 프로그램이란?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Text(
                  '경기대학교 학생의 체계적인 경력관리와 개인역량 개발을 위해 정규 수업 이외에 운영되는 활동으로 학점 대신 KGU+포인트가 지급\n',
                ),
                Text(
                  '"학교 밖 수원?"같이 갈래?',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Text(
                  '경기대학교소성박물관에서 진행하는 비교과 프로그램 ＂학교 밖 수원을 보다＂는 수원지역 박물관과 연계하여 우리 대학 학생들이 스스로 지역 박물관을 관람할 수 있도록 기획\n지역 박물관 탐방을 통해 학생들이 경기대학교가 소재하고 있는 수원지역 역사와 문화에 대한 지식을 향상 할 수 있는 기회 제공\n',
                ),
                Text(
                  '활동방법',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Text(
                  '○ BARUN 시스템을 통해 신청\n○ 신청 후 경기대학교소성박물관에서 활동수첩 수령\n○ 수원광교·수원·수원화성박물관·수원화성행궁 모두 관람 후 활동수첩 작성\n○ 경기대학교소성박물관에 완료한 활동수첩 제출\n○ 참가 후 설문지 작성\n',
                ),
                Text(
                  '활동혜택',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
                Text(
                  'KGU+ 30포인트 지급',
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
