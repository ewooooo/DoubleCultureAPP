import 'package:flutter/material.dart';
import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';



import 'login.dart';

class SingUp extends StatelessWidget {
  final validAlphabet = RegExp(r'[a-zA-Z]');
  final  validNumbers = RegExp(r'(\d+)');
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _repasswordController = TextEditingController();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _securityKeyController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size =
        MediaQuery.of(context).size; //App이 가지고 있는 size을 가지고와서 size를 넣어줌!

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Stack(
              children: <Widget>[
                //inputform & 버튼
                _inputForm(size),
              ],
            ),

            SizedBox(
              height: 50,
              width: size.width * 0.6,
              child: RaisedButton(
                child: Text(
                  "회원가입",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    int result = await server.singUp(_usernameController.text, _passwordController.text, _repasswordController.text, _emailController.text,
                        _firstNameController.text,  _securityKeyController.text);
                    if (result == 1){
                      printToast("회원가입이 성공적으로 가입되었습니다.");
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AuthPage()),
                      );
                    }else if(result == 2){
                      printToast("입력정보가 잘못되었습니다. 반복시 문의바랍니다.");
                    }else if(result == 4){
                      printToast("인증키가 잘못되었습니다. \n 공지사항을 확인해주세요.");
                    }else if(result == 3){
                      printToast("아이디가 중복되어습니다.");
                    }
                    
                  }
                },
              ),
            ),
            Container(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: 50,
              width: size.width * 0.6,
              child: RaisedButton(
                child: Text(
                  "뒤로가기",
                  style: TextStyle(fontSize: 20, color: Colors.white),
                ),
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AuthPage()),
                  );
                },
              ),
            ),
            Container(
              height: size.height * 0.05,
            ), // gat
          ],
        ),
      ),
    );
  }

  Widget _inputForm(Size size) {
    //Size를 사용하지 못하기에 여기에 던져줌
    return Padding(
      padding: EdgeInsets.all(size.width * 0.05),
      child: Card(
        // new widget으로 감싸기 커서 놓고 Alt+enter
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.0)),
        elevation: 6,
        child: Padding(
          padding:
              const EdgeInsets.only(left: 12.0, right: 16, top: 12, bottom: 32),
          child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  TextFormField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "ID : 학번"),
                    validator: (String value) {
                      // validator : 유저가 작성 뒤 로그인 버튼 누를 때 이메일필드에 작성한 내용을 가져와서 옳은지 체크
                      if (value.isEmpty) {
                        return "올바른 학번 ID를 기입하세요.";
                      } else if (validAlphabet.hasMatch(value)) {
                        return "숫자만 입력하세요.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 3,
                  ),
                  TextFormField(
                    obscureText: true, // password ****표시
                    controller: _passwordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "비밀번호"),
                    validator: (String value) {
                      // validator : 유저가 작성 뒤 로그인 버튼 누를 때 이메일필드에 작성한 내용을 가져와서 옳은지 체크
                      if (value.isEmpty) {
                        return "올바른 비밀번호를 입력하세요.";
                      } else if (value != _repasswordController.text) {
                        return "비밀번호가 다릅니다. 다시입력해주세요.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 3,
                  ),
                  TextFormField(
                    obscureText: true, // password ****표시
                    controller: _repasswordController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.vpn_key), labelText: "비밀번호 확인"),
                    validator: (String value) {
                      // validator : 유저가 작성 뒤 로그인 버튼 누를 때 이메일필드에 작성한 내용을 가져와서 옳은지 체크
                      if (value.isEmpty) {
                        return "올바른 비밀번호를 입력하세요.";
                      } else if (value != _passwordController.text) {
                        return "비밀번호가 다릅니다. 다시입력해주세요.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 3,
                  ),
                  TextFormField(
                    controller: _firstNameController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle),
                        labelText: "이름"),
                    validator: (String value) {
                      // validator : 유저가 작성 뒤 로그인 버튼 누를 때 이메일필드에 작성한 내용을 가져와서 옳은지 체크
                      if (value.isEmpty) {
                        return "firstName를 기입하세요.";
                      }else if(validNumbers.hasMatch(value)) {
                        return "이름만 입력하세요.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 3,
                  ),
                  TextFormField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle),
                        labelText: "email"),
                    validator: (String value) {
                      // validator : 유저가 작성 뒤 로그인 버튼 누를 때 이메일필드에 작성한 내용을 가져와서 옳은지 체크
                      if (value.isEmpty) {
                        return "email을 기입하세요.";
                      }else if (!(value.contains('@') && value.contains('.'))) {
                        return "email을 입력하세요";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height:3,
                  ),
                  TextFormField(
                    controller: _securityKeyController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle), labelText: "인증키"),
                    validator: (String value) {
                      // validator : 유저가 작성 뒤 로그인 버튼 누를 때 이메일필드에 작성한 내용을 가져와서 옳은지 체크
                      if (value.isEmpty) {
                        return "인증키를 기입하세요.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 3,
                  ),
                  Text("인증키는 공지사항에 있습니다."),
                ],
              )),
        ),
      ),
    );
  }
}
