import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Todo{
  bool isDone = false;
  String title;
  
  Todo(this.title);
}

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  final _items = <Todo>[];
  var _todoController = TextEditingController();

  @override

  void dispose(){
    _todoController.dispose();
    super.dispose();
  }

  Widget _buildItemWidget(Todo todo){
    return ListTile(
      onTap:(){},
      title: Text(
        todo.title,
        style: todo.isDone
          ? TextStyle(
          decoration: TextDecoration.lineThrough,
          fontStyle: FontStyle.italic,
        )
            :null,
      ),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed:(){},
      ),
    );
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('커뮤니티'),
      ),
      body: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                child:TextField(
                  controller: _todoController,
                ),
              ),
              RaisedButton(
                child:Text('등록'),
                onPressed: (){},
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: <Widget>[],
            ),
          )
        ],
      )
    );
  }
}
