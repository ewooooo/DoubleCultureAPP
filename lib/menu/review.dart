import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class Review extends StatelessWidget {
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
            onPressed: () {
              },
          ),
        ],
      ),
    );
  }
}
