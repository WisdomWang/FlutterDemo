import 'package:flutter/material.dart';
import 'package:ca_flutter_app1/pages/tab_page.dart';
import 'package:ca_flutter_app1/pages/home.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TabPage(),
    );
  }
}
