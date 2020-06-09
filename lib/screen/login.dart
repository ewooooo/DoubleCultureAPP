import 'package:flutter/material.dart';
import 'package:doublecultureapp/data/join_or_login.dart';
import 'package:doublecultureapp/helper/login_background.dart';
import "package:provider/provider.dart";
import 'package:doublecultureapp/main.dart';
import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:doublecultureapp/data/UserData.dart';

class AuthPage extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  //globalkey를 이용해서 Form에다가 Formkey를 지정해주고 --> Unique한 ID가 되는 것!
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final Size size =
        MediaQuery.of(context).size; //App이 가지고 있는 size을 가지고와서 size를 넣어줌!

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          CustomPaint(
            size: size,
            painter: LoginBackground(
                isJoin: Provider.of<JoinOrLogin>(context).isJoin),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              _logoImage,
              Stack(
                children: <Widget>[
                  //inputform & 버튼
                  _inputForm(size),
                  _authButton(size),
                ],
              ),
              Container(
                height: size.height * 0.1,
              ), // gap
              Consumer<JoinOrLogin>(
                builder: (context, joinOrLogin, child) => GestureDetector(
                    onTap: () {
                      joinOrLogin.toggle(); //UI클릭시 toggle이 실행이 되고, 그렇게 되면 isJoin이 true로 바뀌고 notifilistener를 통해 사용중인 위젯들에게 모두 알림
                    },
                    child: Text(
                      joinOrLogin.isJoin ? "계정이 이미 존재한다면 로그인 해주세요." : "계정이 없다면 회원가입하세요.",
                      style: TextStyle(
                          color: joinOrLogin.isJoin ? Colors.red : Colors.blue),
                    )),
              ),
              Container(
                height: size.height * 0.05,
              ) // gap
            ],
          ),
        ],
      ),
    );
  }

  Widget get _logoImage => Expanded(
    child: Padding(
      padding: const EdgeInsets.only(top: 40, left: 24, right: 24),
      child: FittedBox(
        fit: BoxFit.contain,
        child: CircleAvatar(
          backgroundImage: AssetImage('assets/loading.gif'),
          //Image.asset('assets/loading.gif')
          //backgroundImage: NetworkImage(
          //  "http://blogfiles.naver.net/20131017_114/g_nesa_1382021296363UTQa7_JPEG/%B0%E6%B1%E2%B4%EB%C7%D0%B1%B3.jpg/200"),
        ),
      ),
    ),
  );

  Widget _authButton(Size size) => Positioned(
    left: size.width * 0.15,
    right: size.width * 0.15,
    bottom: 0,
    child: SizedBox(
      height: 50,
      child: Consumer<JoinOrLogin>(
        builder: (context, joinOrLogin, child) => RaisedButton(
            child: Text(
              joinOrLogin.isJoin?"Join":"Login",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            color: joinOrLogin.isJoin?Colors.red:Colors.blue,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25)),
            onPressed: () async{
              if (_formKey.currentState.validate()) { //formkey를 가져와서 currentstate를 확인하고 validate를 실행해서 이 안의 Text가 우리가 원하는 건지 확인해서 아니면 에러를 내보내고 맞으면
                String id = _emailController.text;
                String pw = _passwordController.text;
                Token token = await server.getToken(id, pw);
                if (token == null){
                  printToast("아이디 or 비밀번호를 확인하세요.");
                }else{
                  userData = UserData(id,pw);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyHomePage()),
                  );
                }
              }


            },),
      ),
    ),
  );


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
                    controller: _emailController,
                    decoration: InputDecoration(
                        icon: Icon(Icons.account_circle),
                        labelText: "ID : 학번"),
                    validator: (String value) {
                      // validator : 유저가 작성 뒤 로그인 버튼 누를 때 이메일필드에 작성한 내용을 가져와서 옳은지 체크
                      if (value.isEmpty) {
                        return "올바른 학번 ID를 기입하세요.";
                      }
                      return null;
                    },
                  ),
                  Container(
                    height: 8,
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
                      }
                      return null;
                    },
                  ),
                  Consumer<JoinOrLogin>(
                    builder: (context, value, child) => Opacity(
                        opacity: value.isJoin? 0 : 1, //opacity = 투명함
                        child: Text("비밀번호를 잊어버렸습니다.")),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}