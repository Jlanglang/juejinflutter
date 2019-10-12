import 'dart:async';

import 'package:flutter/material.dart';
import 'package:juejinflutter/util/SpUtils.dart';

import '../home/HomeRoute.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    _initHomeTab();
    Timer(new Duration(seconds: 2), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil('main', (Route<dynamic> route) => false);
    });
    return Image.asset('lib/assets/splash.jpg', fit: BoxFit.fill);
  }

  void _initHomeTab() {
    SpUtils.setSpList('tabmenu', HomeConstant.tabTitle);
    SpUtils.getSpList('selectTabmenu').then((s) {
      if (s.isEmpty) {
        SpUtils.setSpList('selectTabmenu', HomeConstant.tabTitle);
      }
    });
  }
}
