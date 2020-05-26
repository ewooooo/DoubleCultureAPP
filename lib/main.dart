// 경기대학교 소성박물관 1차 UI
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:doublecultureapp/screen/login.dart';
import 'package:doublecultureapp/data/join_or_login.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        primaryColor: const Color(0xFF3f51b5),
        accentColor: const Color(0xFF3f51b5),
        canvasColor: const Color(0xFFaabdf5),
      ),
      home: ChangeNotifierProvider<JoinOrLogin>.value(
          value: JoinOrLogin(),
          child: AuthPage()
      ),
    );
  }
}
//남은우바보
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var _index = 0; //페이지 인덱스 0,1,2
  var _menu = [
    Home(),
    QR(),
    Bus(),
    Plus(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HOME'),
        centerTitle: true,
      ),
      body: _menu[_index],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          setState(
                () {
              _index = index;
            },
          );
        },
        currentIndex: _index,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('홈 화면'),
              backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.photo_camera),
              title: Text('QR코드'),
              backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.pages),
              title: Text('소감작성'),
              backgroundColor: Colors.indigo),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle),
              title: Text('더보기'),
              backgroundColor: Colors.indigo),
        ],
        selectedItemColor: Colors.lightGreenAccent,
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(6, 18, 6, 6),
          child: SizedBox(
            width: 400,
            height: 160,
            child: RaisedButton(
              child: Image.asset('assets/logo_KSM_1.gif'),
              padding: EdgeInsets.all(0.0),
              color: Colors.white,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Museum1()),
                );
              },
            ),
          ),
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 160,
                width: 190,
                child: RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/logo_SGM.gif'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Museum2()),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 160,
                width: 190,
                child: RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/logo_SMH.gif'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Museum3()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 160,
                width: 190,
                child: RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/logo_SHM.gif'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Museum4()),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                height: 160,
                width: 190,
                child: RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/logo_SHF.gif'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Museum5()),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class QR extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      '카메라나올곳',
      style: TextStyle(fontSize: 50),
    );
  }
}

class Bus extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
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
    );
  }
}

class Plus extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ListView(
      scrollDirection: Axis.vertical,
      children: <Widget>[
        ListTile(
          title: Text('프로그램 설명'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => List1()),
            );
          },
        ),
        ListTile(
          title: Text('인증키 받기'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => List1()),
            );
          },
        ),
        ListTile(
          title: Text('교통 정보'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => List1()),
            );
          },
        ),
        ListTile(
          title: Text('커뮤니티'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => List1()),
            );
          },
        ),
        ListTile(
          title: Text('로그아웃'),
          trailing: Icon(Icons.navigate_next),
          onTap:(){
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => List1()),
            );
          },
        ),
      ],
    );
  }
}

class List1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('프로그램 설명'),
      ),
      body: SingleChildScrollView(
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
    );
  }
}

class Museum1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('경기대학교소성박물관'),
      ),
      body: PageView(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                        child: SizedBox(
                          width: 180,
                          height: 120,
                          child: Image.asset('assets/SS_KSM.jpg'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('관람시간',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.teal,
                                )),
                            Text('학기중 : 오전 10시 ~ 오후 5시'),
                            Text('방학중 : 오전 10시 ~ 오후 2시'),
                            Text(
                              '휴관일',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.teal,
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '※ 다음 질문 중 한 가지를 선택하여 작성해주세요. (최소 6줄 이상 / 자유형식)\n',
                  ),
                  Text(
                      '1. 광교 역사문화실에는 광교 신도시를 조성하며 출토된 발굴 유물들이 전시되어 있습니다. 전시장을 관람하고, 안동 김씨 문중이 살던 곳에서 출토된 유물들에 대해 적어보세요.\n'),
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

class Museum2 extends StatelessWidget {
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

class Museum3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('경기대학교소성박물관'),
      ),
      body: PageView(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                        child: SizedBox(
                          width: 180,
                          height: 120,
                          child: Image.asset('assets/SS_KSM.jpg'),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '※ 다음 질문 중 한 가지를 선택하여 작성해주세요. (최소 6줄 이상 / 자유형식)\n',
                  ),
                  Text(
                      '1. 광교 역사문화실에는 광교 신도시를 조성하며 출토된 발굴 유물들이 전시되어 있습니다. 전시장을 관람하고, 안동 김씨 문중이 살던 곳에서 출토된 유물들에 대해 적어보세요.\n'),
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

class Museum4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('경기대학교소성박물관'),
      ),
      body: PageView(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                        child: SizedBox(
                          width: 180,
                          height: 120,
                          child: Image.asset('assets/SS_KSM.jpg'),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '※ 다음 질문 중 한 가지를 선택하여 작성해주세요. (최소 6줄 이상 / 자유형식)\n',
                  ),
                  Text(
                      '1. 광교 역사문화실에는 광교 신도시를 조성하며 출토된 발굴 유물들이 전시되어 있습니다. 전시장을 관람하고, 안동 김씨 문중이 살던 곳에서 출토된 유물들에 대해 적어보세요.\n'),
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

class Museum5 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('경기대학교소성박물관'),
      ),
      body: PageView(
        children: <Widget>[
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
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
                        child: SizedBox(
                          width: 180,
                          height: 120,
                          child: Image.asset('assets/SS_KSM.jpg'),
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
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Text(
                    '※ 다음 질문 중 한 가지를 선택하여 작성해주세요. (최소 6줄 이상 / 자유형식)\n',
                  ),
                  Text(
                      '1. 광교 역사문화실에는 광교 신도시를 조성하며 출토된 발굴 유물들이 전시되어 있습니다. 전시장을 관람하고, 안동 김씨 문중이 살던 곳에서 출토된 유물들에 대해 적어보세요.\n'),
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
