import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:qrscan/qrscan.dart' as scanner;
import 'package:geolocator/geolocator.dart';
import 'package:doublecultureapp/myHttp/AdapHttp.dart';
class QR extends StatefulWidget{
  @override
  QR_state createState() => QR_state();
}

class QR_state extends State<QR> {
  var _output = '좌측 버튼을 누른 뒤\n박물관의 QR코드를 인식해주세요';

  @override
  initState() {
    super.initState();
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Builder(
          builder: (BuildContext context) {
            return Center(
              //정 가운데에 QR 스켄값 표시
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  //플로팅 액션 버튼으로 qr 스캔 함수 실행
                  FloatingActionButton(
                    onPressed: () => _scan(),
                    tooltip: 'scan',
                    child: const Icon(Icons.camera_alt),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(_output, style: TextStyle(color: Colors.black)),
                  ),
                ],
              ),);
          },
        ),

      ),
    );
  }

  //비동기 함수
  Future _scan() async {
    //스캔 시작 - 이때 스캔 될때까지 blocking
    String barcode = await scanner.scan();
    //스캔 완료하면 _output 에 문자열 저장하면서 상태 변경 요청.


    Position position = await getGPS();

    setState(() => _output = barcode);
    printToast("QR: " + barcode);
    printToast("lat: "+ position.latitude.toString() +" long: " + position.longitude.toString());

    await server.updateStemp(barcode,position.latitude,position.longitude);
  }

  Future<Position> getGPS() async{
    Position position = await Geolocator().getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    print(position);
    return position;
  }
}
