import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo {
  String userId = '201611500';
  String title;

  Todo(this.title);
}

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  String loginId = '201611500';
  final _items = <Todo>[];
  var _todoController = TextEditingController();

  @override
  void dispose() {
    _todoController.dispose();
    super.dispose();
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
    setState(() {
      _items.add(todo);
      _todoController.text = '';
    });
  }

  void _deleteTodo(Todo todo) {
    if (loginId == todo.userId) {
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
                        _items.map((todo) => _buildItemWidget(todo)).toList(),
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
