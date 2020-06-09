import 'package:doublecultureapp/data/UserData.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:doublecultureapp/museum/KSM.dart";
import "package:doublecultureapp/museum/SGM.dart";
import "package:doublecultureapp/museum/SHF.dart";
import "package:doublecultureapp/museum/SHM.dart";
import "package:doublecultureapp/museum/SMH.dart";

import "package:doublecultureapp/myHttp/AdapHttp.dart";
import "package:doublecultureapp/myHttp/model.dart";


class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(6, 18, 6, 6),
          child: SizedBox(
            width: MediaQuery.of(context).size.width/1,
            child: RaisedButton(
              child: Image.asset('assets/logo_KSM_1.gif'),
              padding: EdgeInsets.all(0.0),
              color: Colors.white,
              onPressed: () async{

                String museumNmae = "소성박물관";

                Museum museum = await server.getMuseum(museumNmae);
                if (museum == null){
                  printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");

                }else {
                  UserMuseum userMuseum = await server.getUserMuseum(museumNmae);
                  if (userMuseum == null) {
                    Token token = await server.getToken(userData.username, userData.password);
                    userMuseum = await server.getUserMuseum(museumNmae);
                  }
                  KSM page = KSM();

                  page.museumName = museum.museumName;
                  page.quiz = museum.quiz;
                  page.textController.text = userMuseum.quiz_answer;
                  page.stempState = userMuseum.stampStatus;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => page),
                  );
                }
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
                width: MediaQuery.of(context).size.width/2.2,

                child: RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/logo_SGM.gif'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SGM()),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width/2.2,
                child: RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/logo_SMH.gif'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SMH()),
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
                width: MediaQuery.of(context).size.width/2.2,
                child: RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/logo_SHM.gif'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SHM()),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: SizedBox(
                width: MediaQuery.of(context).size.width/2.2,
                child: RaisedButton(
                  padding: const EdgeInsets.all(20.0),
                  child: Image.asset('assets/logo_SHF.gif'),
                  color: Colors.white,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SHF()),
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
