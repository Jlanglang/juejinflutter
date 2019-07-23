import 'package:flutter/material.dart';
import '../util/SpUtils.dart';

class HomeTabSetPage extends StatefulWidget {
  @override
  _HomeTabSetPageState createState() => _HomeTabSetPageState();
}

class _HomeTabSetPageState extends State<HomeTabSetPage> {
  var spList = [];
  var selectMenu = [];

  @override
  Widget build(BuildContext context) {
    SpUtils.getSpLists(['tabmenu', 'selectTabmenu']).then((s) {
      setState(() {
        spList = s['tabmenu'];
        selectMenu = s['selectTabmenu'];
      });
    });
    return new Scaffold(
        backgroundColor: Color(0xffefefef),
        appBar: new AppBar(
          title: new Text('话题特别展示'),
        ),
        body: ListView(
          children: spList.map((s) {
            return Container(
              margin: EdgeInsets.only(bottom: 1),
              color: Colors.white,
              child: new SwitchListTile(
                  value: selectMenu.contains(s),
                  title: new Text(s),
                  onChanged: (b) {
                    setState(() {
                      if (selectMenu.contains(s)&&!b) {
                        selectMenu.remove(s);
                      }
                      if (!selectMenu.contains(s) && b) {
                        selectMenu.add(s);
                      }
                      SpUtils.setSpList('selectMenu', selectMenu);
                    });
                  }),
            );
          }).toList(),
        ));
  }
}
