import 'package:doublecultureapp/data/UserData.dart';
import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/data/UserData.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';


List<post_model> items;


class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {

  var _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  Widget _buildItemWidget(post_model todo) {

    return ListTile(
      onTap: () {},
      leading: Text(todo.author),
      title: Text(
        todo.text,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(todo),
      ),
    );
  }


  void _addTodo(String text) async {
    if(await server.postCoumunity(text)){
      printToast("등록");
    }else{
      Token to = await server.getToken(userData.username, userData.password);
      await server.postCoumunity(text);
    }

    items = await server.getCoumunity(1);
    if (items == null) {
      Token token = await server.getToken(
          userData.username, userData.password);
      items = await server.getCoumunity(1);
    }

    setState(() {
      _todoController.text = '';
    });
    }


  void _deleteTodo(post_model todo) async{
    if (userData.username == todo.author) {
      if(await server.delCoumunity(todo.id)){
        printToast("삭제");
      }else{
        Token to = await server.getToken(userData.username, userData.password);
        await server.delCoumunity(todo.id);
      }

      items = await server.getCoumunity(1);
      if (items == null) {
        Token token = await server.getToken(
            userData.username, userData.password);
        items = await server.getCoumunity(1);
      }
      setState(() {
      });
    } else {
      //setState(() {
      printToast('삭제할 수 없습니다');
      //});
    }
  }
@override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('커뮤니티'),
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
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Expanded(
                      child: TextField(
                        controller: _todoController,
                      ),
                    ),
                    RaisedButton(
                      child: Text('등록'),
                      onPressed: () => _addTodo(_todoController.text),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children:
                        items.map((todo) => _buildItemWidget(todo)).toList(),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
