import 'package:flutter/material.dart';
import 'dart:convert' show json;
import 'package:dio/dio.dart';
import 'package:ca_flutter_app1/model/Joke.dart';

class LibPage extends StatefulWidget {
  @override
  _LibPageState createState() => _LibPageState();
}

class _LibPageState extends State<LibPage> with AutomaticKeepAliveClientMixin {

  List<Joke> listA = [];

  ScrollController _scrollController = new ScrollController();

  var date = DateTime.now().millisecondsSinceEpoch/1000;
  
  int page = 1;

  @override
  void initState() {
    super.initState();
    getHttp(page);
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        page++;
        getHttp(page);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '笑话大全',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('笑话大全'),
        ),
        body:RefreshIndicator(
            child: ListView.builder(
                itemCount: listA.length,
                physics: BouncingScrollPhysics(),
                itemBuilder: (context,index)=>itemDividerRow(context, index),
                controller: _scrollController
            ),
            onRefresh: _onRefresh)
      ),
    );
  }

  itemDividerRow(context, int index) {
    if (index.isOdd) {//是奇数
      return new Divider( //返回分割线
        height: 2.0,
        color: Colors.black54,
      );
    } else {
      index = index ~/ 2;
      return ListTile(
          title: Text(listA[index].content),
          onTap:(){
           }
      );  //返回item 布局
    }
  }

  Future<Null> _onRefresh() async {

    page = 1;
    listA.clear();
    getHttp(page);
  }

  void getHttp(int page) async {

    //取整
    int time = date~/1;
    try {
      Response response = await Dio().get(
          "http://v.juhe.cn/joke/content/list.php?key=ecb844e43f5a0381671f74ac66f1c125&page=$page&pagesize=20&sort=desc&time=$time");
      print(response);
      List map = json.decode(response.toString())['result']['data'];
      List<Joke> list = [];
      list = map.map((v) => Joke.fromJson(v)).toList();
      setState(() {
        listA.addAll(list);
      });
    } catch (e) {
      print(e);
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
