import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/data/UserData.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class Todo {
  //String userId=userData.username;
  String userId='우현경';
  //String userId='편준장';
  String title;

  Todo(this.title);
}

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
/*
  List<post_model> items;
  var _todoController = TextEditingController();
  Future<_CommunityState> async ( {
    //this.items = await server.getCoumunity(1);
  }
  )
*/

  final _items = <Todo>[];
  var _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  Widget myScreen(Todo todo){
    if(todo.userId==userData.username){
      return ListTile(
        onTap: () {},
        leading: Text(todo.userId),
        title: Text(
          todo.title,
        ),
        trailing: IconButton(
          icon: Icon(Icons.delete_forever),
          onPressed: () => _deleteTodo(todo),
        ),
      );
    }else{
      return ListTile(
        onTap: () {},
        leading: Text(todo.userId),
        title: Text(
          todo.title,
        ),
      );
    }
  }


  Widget _buildItemWidget(Todo todo) {
    return ListTile(
      onTap: () {},
      leading: Text(todo.userId),
      title: Text(
        todo.title,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () => _deleteTodo(todo),
      ),
    );
  }

  void _addTodo(Todo todo) {
    if(_todoController.text==''){
      printToast('내용을 입력해주세요');
    }else{
      setState(() {
        _items.insert(0, todo);
        _todoController.text = '';
      });
    }
  }

  void _deleteTodo(Todo todo) {
    if (userData.username== todo.userId) {
      setState(() {
        _items.remove(todo);
      });
    } else {
      //setState(() {
      printToast('삭제할 수 없습니다');
      //});
    }
  }

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
                      onPressed: () => _addTodo(Todo(_todoController.text)),
                    ),
                  ],
                ),
                Expanded(
                  child: ListView(
                    children:
                    _items.map((todo) => myScreen(todo)).toList(),
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
