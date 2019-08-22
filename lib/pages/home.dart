import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ca_flutter_app1/model/User.dart';
import 'dart:convert' show json;
import 'package:ca_flutter_app1/pages/detail.dart';

class HomePage extends StatefulWidget {
   @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {

  List<User> listA = [];
  var today = DateTime.now();

  @override
  void initState() {
    super.initState();
    getHttp();
  }
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: '历史上的今天',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('历史上的今天'),
        ),
        body: ListView.builder(
            itemCount: listA.length,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context,index)=>itemDividerRow(context, index)
        )
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
          title: Text('${listA[index].date}\n${listA[index].title}'),
          trailing :new Icon(Icons.arrow_forward_ios,color: Colors.black54),
          onTap:(){
            Navigator.of(context,rootNavigator: true).push(
                MaterialPageRoute(
                    builder:(context)=> DetailPage(e_id:listA[index].e_id,)
                )
            );}
      );  //返回item 布局
    }
  }
  void getHttp() async {
    try {
      print('${today.month}/${today.day}');
      Response response = await Dio().get("http://v.juhe.cn/todayOnhistory/queryEvent.php?key=3955d71543be4871a52345def305b057&date=${today.month}/${today.day}");
      print(response);
      List map = json.decode(response.toString())['result'];
      List<User> list = [];
      list = map.map((v) => User.fromJson(v)).toList();
      setState(() {
        listA = list;
      });

    } catch (e) {
      print(e);
    }
  }

  @override
  bool get wantKeepAlive => true;

}
