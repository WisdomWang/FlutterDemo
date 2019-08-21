import 'package:flutter/material.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: '动态',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('动态'),
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}