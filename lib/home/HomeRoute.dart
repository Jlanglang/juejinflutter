import 'package:flutter/material.dart';

import 'HomePage.dart';
import 'HomeTabSetPage.dart';

class HomeConstant {
  static const tabTitle = [
    '推荐',
    '前端',
    'android',
    'iOS',
    '人工智能',
    '大事件',
    'flutter',
  ];

  static final Map<String, WidgetBuilder> route = {
    'home': (context) => new HomePage(),
    'home/tabset': (context) => new HomeTabSetPage(),
  };
}
