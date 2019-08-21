import 'package:flutter/material.dart';

class RankPage extends StatefulWidget {
  @override
  _RankPageState createState() => _RankPageState();
}

class _RankPageState extends State<RankPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: '排行',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('排行'),
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}