import 'package:doublecultureapp/myHttp/AdapHttp.dart';
import 'package:doublecultureapp/myHttp/model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:pull_to_refresh/pull_to_refresh.dart';

List<post_model> items;

class Community extends StatefulWidget {
  @override
  _CommunityState createState() => _CommunityState();
}

class _CommunityState extends State<Community> {
  bool _isButtonDisabled = true;
  var _todoController = TextEditingController();

  RefreshController _refreshController =
  RefreshController(initialRefresh: false);

  String dateManager(String dateText){
    return dateText.substring(2,4)+"/"+dateText.substring(5,7)+"/"+dateText.substring(8,10)+"   "+dateText.substring(11,16);
  }

  void dispose() {
    _todoController.dispose();
    super.dispose();
  }

  void _addTodo(String text) async {
    if(text==''){
      printToast('내용을 입력해주세요');
    }else {
      if (await server.postCoumunity(text)) {
        printToast("등록");
      }
      items = await server.getCoumunity(1);

    }
    setState(() {
        _todoController.text = '';
    });
  }

  void _deleteTodo(post_model todo) async {
    if (server.username == todo.author) {
      if (await server.delCoumunity(todo.id)) {
        printToast("삭제");
      }
      items = await server.getCoumunity(1);
      setState(() {});
    } else {
      //setState(() {
      printToast('삭제할 수 없습니다');
      //});
    }
  }


  void _onRefresh() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    items = await server.getCoumunity(1);
    // if failed,use refreshFailed()
    _refreshController.refreshCompleted();
  }

  int currentPage = 1;

  void _onLoading() async {
    // monitor network fetch
    await Future.delayed(Duration(milliseconds: 1000));
    items += await server.getCoumunity(currentPage+1);
    currentPage+=1;
    // if failed,use loadFailed(),if no data return,use LoadNodata()
    //items.add((items.length + 1).toString());
    if (mounted) setState(() {});
    _refreshController.loadComplete();
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
                Padding(
                  padding: const EdgeInsets.fromLTRB(6, 0, 0, 8),
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        child: TextField(
                          controller: _todoController,
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.border_color),
                        color: Colors.indigo,
                        onPressed: () => _addTodo(_todoController.text),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    child: SmartRefresher(
                      enablePullDown: true,
                      enablePullUp: true,
                      header: WaterDropHeader(),
                      footer: CustomFooter(
                        builder: (BuildContext context, LoadStatus mode) {
                          Widget body;
                          if (mode == LoadStatus.idle) {
                            body = Text("pull up load");
                          } else if (mode == LoadStatus.loading) {
                            body = CupertinoActivityIndicator();
                          } else if (mode == LoadStatus.failed) {
                            body = Text("Load Failed!Click retry!");
                          } else if (mode == LoadStatus.canLoading) {
                            body = Text("release to load more");
                          } else {
                            body = Text("No more Data");
                          }
                          return Container(
                            height: 55.0,
                            child: Center(child: body),
                          );
                        },
                      ),
                      controller: _refreshController,
                      onRefresh: _onRefresh,
                      onLoading: _onLoading,
                      child: ListView.builder(
                        itemBuilder: (c, i) => Card(
                          elevation: 3,
                          child: SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(12,6,12,6),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Text("ID: "+items[i].author),
                                      Text(dateManager(items[i].created)),
                                      IconButton(
                                        icon: Icon(items[i].author == server.username  ? Icons.delete_forever : null),
                                        color: Colors.blueGrey,
                                        onPressed: () => items[i].author == server.username ? _deleteTodo(items[i]): null,
                                      ),
                                    ],
                                  ),
                                  Text(items[i].text,),
                                ],
                              ),
                            ),
                          ),
                        ),
                        //itemBuilder: items.map((todo) => _buildItemWidget(todo)),
                        itemExtent: 100.0,
                        itemCount:items.length,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
