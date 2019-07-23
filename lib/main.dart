import 'package:flutter/material.dart';

import 'home/SplashPage.dart';
import 'util/SpUtils.dart';
import 'home/HomeRoute.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var route = Map<String, WidgetBuilder>();
    route.addAll(HomeConstant.route);
    return MaterialApp(
      title: '仿掘金Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: route,
      home: SplashPage(),
    );
  }
}