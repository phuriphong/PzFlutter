import 'dart:ui';

import 'package:demo1/src/constants/asset.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {
    final Map<Object,Object> arguments = ModalRoute.of(context)?.settings?.arguments as Map<Object,Object> ;
    final models = Map<String,Object>.from(arguments);

    var name ="-";
    var age =0;
    if(models['name'] is String)
      {
        name =models['name'] as String ;
      }
    if(models['age'] is int)
    {
      age =models['age'] as int ;
    }

    return Scaffold(
      body: Column(
        children: [
          Text(name),
          Text(age.toString()),
          Image.asset(Asset.LOGO_IMAGE,alignment:Alignment.center ),
          ///Image.network('https://upload.wikimedia.org/wikipedia/commons/thumb/4/44/Google-flutter-logo.svg/120px-Google-flutter-logo.svg.png')
        ],
      ),
    );
}
}
