import 'package:flutter/material.dart';
import '../util/SpUtils.dart';
import 'HomeRoute.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var _spList = [];
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(length: _spList.length, vsync: this);
  }

  Widget body() {
    return TabBarView(
      controller: _tabController,
      children: _spList.isEmpty
          ? []
          : _spList.map((f) {
              return Center(
                child: new RaisedButton(
                  onPressed: () {},
                  child: new GestureDetector(
                    onTap: () {},
                    child: new Text("123"),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30)),
                  ),
                ),
              );
            }).toList(),
    );
  }

  Widget tabBar() {
    return new TabBar(
      controller: _tabController,
      isScrollable: true,
      labelColor: Colors.white,
      tabs: _spList.map((f) {
        return Center(
          child: new Text(f),
        );
      }).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    SpUtils.getSpList('selectTabmenu').then((s) {
      if (_spList.length == s.length) {
        return;
      }
      setState(() {
        _spList = HomeConstant.tabTitle.where((f) => s.contains(f)).toList();
        _tabController = new TabController(length: _spList.length, vsync: this);
      });
    });
    return Scaffold(
      appBar: new AppBar(
        automaticallyImplyLeading: false,
        titleSpacing: 0,
        title: Center(
          child: tabBar(),
        ),
        actions: <Widget>[
          new GestureDetector(
            child: new Container(
              child: new Icon(Icons.arrow_drop_down),
              width: 48,
              decoration: new BoxDecoration(),
            ),
            onTap: () {
              Navigator.of(context).pushNamed('home/tabset');
            },
          )
        ],
      ),
      body: body(),
    );
  }
}
