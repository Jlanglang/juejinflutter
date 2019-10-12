import 'package:flutter/material.dart';
import '../home/HomePage.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var _bottomIndex = 0;
  var list = [
    new HomePage(),
    Center(child: new Text('1')),
    Center(child: new Text('2')),
    Center(child: new Text('3')),
    Center(child: new Text('4')),
  ];
  PageController _pageController;
  
  @override
  Widget build(BuildContext context) {
    _pageController = new PageController(initialPage: _bottomIndex);
    return Scaffold(
      body: new PageView.builder(
          itemBuilder: (context, i) {
            return list[i];
          },
          itemCount: list.length,
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _bottomIndex = index;
            });
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        items: [
          new BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: new Container(),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.whatshot),
            title: new Container(),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.search),
            title: new Container(),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.book),
            title: new Container(),
          ),
          new BottomNavigationBarItem(
            icon: Icon(Icons.person),
            title: new Container(),
          ),
        ],
        currentIndex: _bottomIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: (i) {
          _pageController.jumpToPage(i);
        },
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
