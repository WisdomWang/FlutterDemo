import 'package:flutter/material.dart';
import 'package:ca_flutter_app1/model/User.dart';
import 'package:ca_flutter_app1/model/Content.dart';
import 'dart:convert' show json;
import 'package:dio/dio.dart';

class DetailPage extends StatefulWidget {
  final String e_id;
  const DetailPage({Key key, this.e_id})
      : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState(e_id: this.e_id);
}

class _DetailPageState extends State<DetailPage> {

  List<Content> listA = [];

  final String e_id;

  _DetailPageState({this.e_id});

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
            leading: IconButton(
                icon: Icon(Icons.arrow_back_ios),
                onPressed:(){
                  Navigator.pop(context);
                })
          ),
          body: ListView.builder(
              itemCount: listA.length,
              itemBuilder: (context, index) {
                Divider();
                return ListTile(
                  title: Text(listA[index].content ?? ''),
                );
              }
          )
      ),
    );
  }

  void getHttp() async {
    try {
      Response response = await Dio().get("http://v.juhe.cn/todayOnhistory/queryDetail.php?key=3955d71543be4871a52345def305b057&e_id=${e_id}");
      print(response);
      List map = json.decode(response.toString())['result'];
      List<Content> list = [];
      list = map.map((v) => Content.fromJson(v)).toList();
      setState(() {
        listA = list;
      });
    } catch (e) {
      print(e);
    }
  }

}
