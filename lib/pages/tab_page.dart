import 'package:flutter/material.dart';
import 'package:ca_flutter_app1/pages/home.dart';
import 'package:ca_flutter_app1/pages/rank.dart';
import 'package:ca_flutter_app1/pages/lib.dart';
import 'package:ca_flutter_app1/pages/dynamic.dart';

class TabPage extends StatefulWidget {
  @override
  TabPageState createState() {
    return new TabPageState();
  }
}

class TabPageState extends State<TabPage> with TickerProviderStateMixin {
  TabController controller;
  int selectedIndex = 0;
  @override
  void initState() {
    controller = TabController(length: 4, vsync: this);
    controller.addListener((){
      setState(() {
        selectedIndex = controller.index;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: TabBarView(
          controller: controller,
          physics: NeverScrollableScrollPhysics(),
          children: <Widget>[
            HomePage(),
            RankPage(),
            LibPage(),
            DynamicPage(),
          ],
      ),
      bottomNavigationBar: Material(
          color: Colors.grey[100],
          child: SafeArea(
            child: TabBar(
              isScrollable: false,
              indicatorColor: Colors.transparent,
              controller: controller,
              tabs: <Widget>[
                TabBarItem(
                  text: "历史",
                  icon: Icons.home,
                  selected: selectedIndex == 0,
                ),
                TabBarItem(
                  text: "推荐",
                  icon: Icons.ondemand_video,
                  selected: selectedIndex == 1,
                ),
                TabBarItem(
                  text: "笑话",
                  icon: Icons.local_play,
                  selected: selectedIndex == 2,
                ),
                TabBarItem(
                  text: "动态",
                  icon: Icons.camera,
                  selected: selectedIndex == 3,
                )
              ],
            ),
          )
      ),
    );
  }
}

class TabBarItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final bool selected;

  TabBarItem({this.text, this.icon, this.selected = false});

  @override
  Widget build(BuildContext context) {
    final Color selectedColor = Theme.of(context).primaryColor;
    final Color normalColor = Colors.grey[400];

    return Container(
      height: 48.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Icon(
            icon,
            color: selected ? selectedColor : normalColor,
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: 11.0,
              color: selected ? selectedColor : normalColor,
            ),
          )
        ],
      ),
    );
  }
}