import 'package:demo1/src/pages/login/login_page.dart';
import 'package:flutter/material.dart';

import 'pages/home/home_page.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Puechz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      home:   LoginPage()
    );
  }
}
