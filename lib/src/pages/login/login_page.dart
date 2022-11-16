import 'package:demo1/src/config/theme.dart' as custom_theme;
import 'package:demo1/src/constants/asset.dart';
import 'package:demo1/src/pages/login/widgets/single_sign_on.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'widgets/header.dart';
import 'widgets/login_form.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: custom_theme.Theme.gradient,
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Header(),
                  LoginForm(),
                  SizedBox(height: 30),
                  _buildFlatButton(
                    'Forgot Password?',
                    onPressed: () {
                      //todo
                    },
                  ),
                 SingleSignOn(),
                  SizedBox(height: 28),
                  _buildFlatButton(
                    "Don't have an Account",
                    onPressed: () {
                      //todo
                    },
                  ),
                  SizedBox(height: 80),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  TextButton  _buildFlatButton(   String text, {
  required VoidCallback onPressed,
  double fontSize = 16 }) => TextButton(
    onPressed:onPressed,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
        fontSize: fontSize,
        fontWeight: FontWeight.normal,
      ),
    ),
  );
  
}
