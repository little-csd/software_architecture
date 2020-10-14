import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tickets/main/page.dart';

import 'basic/login/page.dart';

void main() {
  runApp(createApp());
}

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: {
      'main': MainPage(),
      'login': LoginPage(),
    },
  );

  return MaterialApp(
    title: 'Ticket sell system',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: routes.buildPage('login', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
