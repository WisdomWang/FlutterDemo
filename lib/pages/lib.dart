import 'package:flutter/material.dart';

class LibPage extends StatefulWidget {
  @override
  _LibPageState createState() => _LibPageState();
}

class _LibPageState extends State<LibPage> {

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return new MaterialApp(
      title: '片库',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('片库'),
        ),
        body: new Center(
          child: new Text('Hello World'),
        ),
      ),
    );
  }
}