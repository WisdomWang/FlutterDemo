import 'package:flutter/material.dart';

class DynamicPage extends StatefulWidget {
  @override
  _DynamicPageState createState() => _DynamicPageState();
}

class _DynamicPageState extends State<DynamicPage> with AutomaticKeepAliveClientMixin {

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
          child: new Text('这是一个简单的flutterDemo\n大家一起学习进步～～'),
        ),
      ),
    );
  }

  @override
  bool get wantKeepAlive => true;

}