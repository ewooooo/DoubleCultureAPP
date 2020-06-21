import 'package:doublecultureapp/data/UserData.dart';
import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:doublecultureapp/screen/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextEditingController feelController = TextEditingController();

class ChangePW extends StatelessWidget {
  var nowController = TextEditingController();
  var newController = TextEditingController();
  var neewController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('비밀번호 변경'),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/background.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nowController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '현재 비밀번호',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: newController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '새 비밀번호',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: neewController,
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: '새 비밀번호 확인',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                RaisedButton(
                  child: Text('확인'),
                  color: Colors.white,
                  onPressed: () async {
                    if (nowController.text != userData.password) {
                      printToast("현재 비밀번호가 틀립니다.");
                    } else {
                      if (newController.text == neewController.text) {
                        printToast('변경되었습니다.');
                        //비밀번호변경코드추가
                      } else {
                        printToast("새 비밀번호가 일치하지 않습니다");
                      }
                    }
                    ;

                    if (await server.postPassword(nowController.text,
                        newController.text, neewController.text)) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthPage()),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
