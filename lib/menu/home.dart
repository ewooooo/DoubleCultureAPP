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
                      String museumNmae = "소성박물관";
                      Museum museum = await server.getMuseum(museumNmae);
                      if (museum == null) {
                        printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
                      } else {
                        UserMuseum userMuseum =
                            await server.getUserMuseum(museumNmae);
                        KSM page = KSM();

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
                      width: MediaQuery.of(context).size.width / 2.2,
                      height: MediaQuery.of(context).size.height / 4.2,
                      child: RaisedButton(
                        padding: const EdgeInsets.all(20.0),
                        child: Image.asset('assets/logo_SGM.gif'),
                        color: Colors.white,
                        onPressed: () async {
                          String museumNmae = "수원광교박물관";
                          Museum museum = await server.getMuseum(museumNmae);
                          if (museum == null) {
                            printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
                          } else {
                            UserMuseum userMuseum =
                                await server.getUserMuseum(museumNmae);
                            SGM page = SGM();

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

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page),
                            );
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
                          String museumNmae = "수원박물관";
                          Museum museum = await server.getMuseum(museumNmae);
                          if (museum == null) {
                            printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
                          } else {
                            UserMuseum userMuseum =
                                await server.getUserMuseum(museumNmae);
                            SMH page = SMH();

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

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page),
                            );
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
                          String museumNmae = "수원화성박물관";
                          Museum museum = await server.getMuseum(museumNmae);
                          if (museum == null) {
                            printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
                          } else {
                            UserMuseum userMuseum =
                                await server.getUserMuseum(museumNmae);
                            SHM page = SHM();

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

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page),
                            );
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
                          String museumNmae = "수원화성";
                          Museum museum = await server.getMuseum(museumNmae);
                          if (museum == null) {
                            printToast("서버와 연결이 원활하지 않습니다. \n 관리자에게 문의해주세요.");
                          } else {
                            UserMuseum userMuseum =
                                await server.getUserMuseum(museumNmae);

                            SHF page = SHF();

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

                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => page),
                            );
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
