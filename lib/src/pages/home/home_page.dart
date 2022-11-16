import 'dart:ui';

import 'package:demo1/src/constants/asset.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
    HomePage({Key? key,  this.name="-",this.age=0}):super(key:key);

  final String? name;
  final int? age;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text(widget.name??""),
          Text(widget.age.toString()),
          Image.asset(Asset.LOGO_IMAGE,alignment:Alignment.center ),
          ///Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/120px-Google-flutter-logo.svg.png')
        ],
      ),
    );
}
}
