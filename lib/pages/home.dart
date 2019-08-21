import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:ca_flutter_app1/model/User.dart';
import 'dart:convert' show json;
import 'package:ca_flutter_app1/pages/detail.dart';

class HomePage extends StatefulWidget {
   @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

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
      title: '首页',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('首页'),
        ),
        body: ListView.builder(
            itemCount: listA.length,
            itemBuilder: (context,index){
              Divider();
          return ListTile(
              title: Text(listA[index].title??''),
              leading: new Icon(Icons.account_balance),
               onTap:(){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder:(context)=> DetailPage(e_id:listA[index].e_id,)
                      )
                  );}
          );

        }
        )
      ),
    );
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
}
