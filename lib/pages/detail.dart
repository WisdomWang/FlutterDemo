import 'package:flutter/material.dart';
import 'package:ca_flutter_app1/model/User.dart';
import 'dart:convert' show json;
import 'package:dio/dio.dart';

class DetailPage extends StatefulWidget {
  final String e_id;

  const DetailPage({Key key, this.e_id})
      : super(key: key);
  @override
  _DetailPageState createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {

  List<User> listA = [];
  var today = DateTime.now();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: '详细',
      home: new Scaffold(
          appBar: new AppBar(
            title: new Text('详细'),
          ),
          body: ListView.builder(
              itemCount: listA.length,
              itemBuilder: (context, index) {
                Divider();
                return ListTile(
                  title: Text(listA[index].title ?? ''),
                  leading: new Icon(Icons.account_balance),
                );
              }
          )
      ),
    );
  }

  void getHttp() async {
    try {
      Response response = await Dio().get("http://v.juhe.cn/todayOnhistory/queryDetail.php?key=3955d71543be4871a52345def305b057&e_id=");
      print(response);
    } catch (e) {
      print(e);
    }
  }

}
