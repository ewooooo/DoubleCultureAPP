import 'package:doublecultureapp/data/UserData.dart';
import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

final TextEditingController feelController = TextEditingController();

class Review extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
      Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
      ),
      PageView(
      children: <Widget>[
      SingleChildScrollView(
      child:
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Text(
              '소감 작성\n',
            ),
            TextField(
              style: TextStyle(),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: feelController,
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
              onPressed: () async {
                if (feelController.text.length < 30) {
                  printToast("글자수를 30 이상 넘겨주세요.");
                } else {
                  UserFeel result = await server.postFeel(feelController.text);
                  if (result == null) {
                    Token token = await server.getToken(
                        userData.username, userData.password);
                    if (token == null) {
                      Navigator.pop(context);
                    }
                    result = await server.postFeel(feelController.text);
                  } else {
                    if (result.feel == feelController.text) {
                      printToast("성공적으로 등록되었습니다.");
                    } else {
                      printToast("다시한번 시도해주세요. \n 안내메시지가 계속 나올시 연락부탁드립니다.");
                    }
                  }
                }
              },
            ),
          ],
        ),
      ),
      )],
    ),
    ]);
  }
}
