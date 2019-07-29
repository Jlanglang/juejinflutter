import 'dart:async';

import 'package:flutter/material.dart';
import 'package:juejinflutter/util/SpUtils.dart';

import '../home/HomeRoute.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    initHomeTab();
    Timer(new Duration(seconds: 3), () {
      Navigator.of(context).popAndPushNamed('main');
    });
    return Image.asset('lib/assets/splash.jpg', fit: BoxFit.fill);
  }

  void initHomeTab() {
    SpUtils.setSpList('tabmenu',  HomeConstant.tabTitle);
    SpUtils.getSpList('selectTabmenu').then((s) {
      if (s.isEmpty) {
        SpUtils.setSpList('selectTabmenu', HomeConstant.tabTitle);
      }
    });
  }
}
