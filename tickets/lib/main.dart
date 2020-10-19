import 'package:fish_redux/fish_redux.dart';
import 'package:flutter/material.dart';
import 'package:tickets/basic/add_passenger/page.dart';
import 'package:tickets/basic/city_picker/page.dart';
import 'package:tickets/basic/payment_ok/page.dart';
import 'package:tickets/basic/train_picker/page.dart';
import 'package:tickets/data/database.dart';
import 'package:tickets/main/page.dart';

import 'basic/choose_passenger/page.dart';
import 'basic/login/page.dart';
import 'basic/train_confirm/page.dart';

void main() {
  runApp(createApp());
  db.init();
}

Widget createApp() {
  final AbstractRoutes routes = PageRoutes(
    pages: {
      'main': MainPage(),
      'login': LoginPage(),
      'city_picker': CityPickerPage(),
      'train_picker': TrainPickerPage(),
      'train_confirm': TrainConfirmPage(),
      'passenger_choose': ChoosePassengerPage(),
      'passenger_add': AddPassengerPage(),
      'payment_ok': PaymentOKPage(),
    },
  );

  return MaterialApp(
    title: 'Ticket sell system',
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
    home: routes.buildPage('main', null),
    onGenerateRoute: (RouteSettings settings) {
      return MaterialPageRoute<Object>(builder: (BuildContext context) {
        return routes.buildPage(settings.name, settings.arguments);
      });
    },
  );
}
