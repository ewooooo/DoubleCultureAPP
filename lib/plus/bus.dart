import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Suwonmuseumbelt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('버스정보 지도'),
      ),
      body: SingleChildScrollView(
        child: Image.asset('assets/bus_map.png'),
      ),
    );
  } // 6번, 400번, 400-4번, 700-2번 4가지 버스 정보 하단에 추가 예정
}