import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:doublecultureapp/museum/KSM.dart";
import "package:doublecultureapp/museum/SGM.dart";
import "package:doublecultureapp/museum/SHF.dart";
import "package:doublecultureapp/museum/SHM.dart";
import "package:doublecultureapp/museum/SMH.dart";

import "package:doublecultureapp/myHttp/AdapHttp.dart";
import "package:doublecultureapp/myHttp/model.dart";

import '../main.dart';



class Home extends StatelessWidget {
  KSM _ksm = KSM();
  SGM _sgm = SGM();
  SMH _smh = SMH();
  SHM _shm = SHM();
  SHF _shf = SHF();

  Future<bool> nextPage(String museumNmae, dynamic page) async {
    Museum museum = await server.getMuseum(museumNmae);
    if (museum == null) {
      printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
      return false;
    } else {
      UserMuseum userMuseum = await server.getUserMuseum(museumNmae);

      page.museumName = museum.museumName;
      if (museum.quiz1 != "")
        page.quiz1 = museum.quiz1 + "\n";
      else
        page.quiz1 = museum.quiz1;
      if (museum.quiz2 != "")
        page.quiz2 = museum.quiz2 + "\n";
      else
        page.quiz2 = museum.quiz2;

      if (museum.quiz3 != "")
        page.quiz3 = museum.quiz3 + "\n";
      else
        page.quiz3 = museum.quiz3;
      page.textController.text = userMuseum.quiz_answer;
      page.stempState = userMuseum.stampStatus;
      if (userMuseum.create_Stamp_date != 'False') {
        page.stampData = userMuseum.create_Stamp_date.substring(4, 8) +
            "년 " +
            userMuseum.create_Stamp_date.substring(9, 11) +
            "월 " +
            userMuseum.create_Stamp_date.substring(12, 14) +
            "일";
      }
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.fromLTRB(6, 18, 6, 6),
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 1,
                child: RaisedButton(
                  child: Image.asset('assets/logo_KSM_1.gif'),
                  padding: EdgeInsets.all(0.0),
                  color: Colors.white,
                  onPressed: () async {
                    if (!waitblock) {
                      waitblock = true;
                      if (await nextPage("소성박물관", _ksm)) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => _ksm),
                        );
                      }
                      waitblock = false;
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
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: MediaQuery.of(context).size.height / 4.2,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('assets/logo_SGM.gif'),
                      color: Colors.white,
                      onPressed: () async {
                        if (!waitblock) {
                          waitblock = true;
                          if (await nextPage("수원광교박물관", _sgm)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _sgm),
                            );
                          }
                          waitblock = false;
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: MediaQuery.of(context).size.height / 4.2,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('assets/logo_SMH.gif'),
                      color: Colors.white,
                      onPressed: () async {
                        if (!waitblock) {
                          waitblock = true;
                          if (await nextPage("수원박물관", _smh)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _smh),
                            );
                          }
                          waitblock = false;
                        }
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
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: MediaQuery.of(context).size.height / 4.2,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('assets/logo_SHM.gif'),
                      color: Colors.white,
                      onPressed: () async {
                        if (!waitblock) {
                          waitblock = true;
                          if (await nextPage("수원화성박물관", _shm)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _shm),
                            );
                          }
                          waitblock = false;
                        }
                      },
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                    height: MediaQuery.of(context).size.height / 4.2,
                    child: RaisedButton(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset('assets/logo_SHF.gif'),
                      color: Colors.white,
                      onPressed: () async {
                        if (!waitblock) {
                          waitblock = true;
                          if (await nextPage("수원화성", _shf)) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => _shf),
                            );
                          }
                          waitblock = false;
                        }
                      },
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
