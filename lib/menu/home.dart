import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import "package:doublecultureapp/museum/KSM.dart";
import "package:doublecultureapp/museum/SGM.dart";
import "package:doublecultureapp/museum/SHF.dart";
import "package:doublecultureapp/museum/SHM.dart";
import "package:doublecultureapp/museum/SMH.dart";

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
                  MaterialPageRoute(builder: (context) => KSM()),
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
                      MaterialPageRoute(builder: (context) => SGM()),
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
                height: 160,
                width: 190,
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
                height: 160,
                width: 190,
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
