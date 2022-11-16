import 'package:demo1/src/pages/home/home_page.dart';
import 'package:demo1/utils/RegexValidator.dart';
import 'package:another_flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:demo1/src/config/theme.dart' as custom_theme;
import 'package:demo1/src/config/route.dart' as custom_route;

class LoginForm extends StatefulWidget {
  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  TextEditingController? usernameController;
  TextEditingController? passwordController;
  String? _errorUsername;
  String? _errorPassword;
  @override
  void initState() {
    usernameController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    usernameController?.dispose();
    passwordController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        _buildForm(),
        _buildSubmitFormButton(),
      ],
      alignment: Alignment.bottomCenter,
    );
  }

  Card _buildForm() => Card(
        margin: EdgeInsets.only(bottom: 22.00, left: 22.00, right: 22.00),
        elevation: 2,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        child: Padding(
          padding: const EdgeInsets.only(
              top: 20.0, bottom: 58.0, left: 28.0, right: 28.0),
          child: FormInput(
            usernameController: usernameController,
            passwordController: passwordController,
            errorUsername: _errorUsername,
            errorPassword: _errorPassword,
          ),
        ),
      );
  void _onLogin() {
    String? username = usernameController?.text;
    String? password = passwordController?.text;
    _errorUsername = null;
    _errorPassword = null;
    print('object');
    if (!EmailSubmitRegexValidator().isValid(username ?? "")) {
      _errorUsername = 'The Email mute be a valid email.';
    }

    if ((password ?? "").length < 8) {
      _errorPassword = 'Mute be at least 8 characters.';
    }
    if (_errorUsername == null && _errorPassword == null) {
      showLoading();
      Future.delayed(Duration(seconds: 2)).then((value) async {
        Navigator.pop(context);
        if (username == 'iblurblur.dev@gmail.com' && password == '12345678') {
          /*    Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(),
            ),
          );*/
          Navigator.pushReplacementNamed(context, custom_route.Route.home,
              arguments: {
                'name': "pz",
                'age': 12,
              });
        }
      });
    } else {
      showAlertBar();
      setState(() {});
    }
  }

  Container _buildSubmitFormButton() => Container(
        width: 220,
        height: 50,
        decoration: _boxDecoration(),
        child: TextButton(
            onPressed: _onLogin,
            child: Text(
              'LOGIN',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.0,
                fontWeight: FontWeight.w700,
              ),
            )),
      );
  void showAlertBar() {
    Flushbar(
      title: 'Username or Password is incorrect',
      message: 'Please try again.',
      icon: Icon(
        Icons.error,
        size: 28.0,
        color: Colors.red,
      ),
      duration: Duration(seconds: 3),
      margin: EdgeInsets.all(8),
    )..show(context);
  }

  void showLoading() {
    Flushbar(
      message: 'Loading...',
      showProgressIndicator: true,
      flushbarPosition: FlushbarPosition.TOP,
      flushbarStyle: FlushbarStyle.GROUNDED,
    )..show(context);
  }

  BoxDecoration _boxDecoration() {
    final gradientStart = custom_theme.Theme.gradientStart;
    final gradientEnd = custom_theme.Theme.gradientEnd;
    final boxShadowItem = (Color color) =>
        BoxShadow(color: color, offset: Offset(1.0, 6.0), blurRadius: 20.0);
    return BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(5.0)),
        boxShadow: [
          boxShadowItem(gradientStart),
          boxShadowItem(gradientEnd),
        ],
        gradient: LinearGradient(
          colors: [gradientEnd, gradientStart],
          begin: const FractionalOffset(0.0, 0.0),
          end: const FractionalOffset(1.0, 1.0),
          stops: [0.0, 1.1],
        ));
  }
}

class FormInput extends StatefulWidget {
  final TextEditingController? usernameController;
  final TextEditingController? passwordController;
  final String? errorUsername;
  final String? errorPassword;
  const FormInput({
    Key? key,
    @required this.usernameController,
    @required this.passwordController,
    this.errorUsername,
    this.errorPassword,
  }) : super(key: key);

  @override
  State<FormInput> createState() => _FormInputState();
}

class _FormInputState extends State<FormInput> {
  final _color = Colors.black54;
  bool _obscureTextPassword = true;
  final _passwordFocusNode = FocusNode();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildUsername(),
        Divider(
          height: 22,
          thickness: 1,
          indent: 22,
          endIndent: 22,
        ),
        _buildPassword(),
      ],
    );
  }

  @override
  void initState() {
    _obscureTextPassword = true;
    // TODO: implement initState
    super.initState();
  }

  TextStyle _textStyle() =>
      TextStyle(fontWeight: FontWeight.w500, color: _color);

  TextField _buildUsername() => TextField(
        controller: widget.usernameController,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: "Email Address",
          labelStyle: _textStyle(),
          hintText: "ire@gmail.com",
          icon: FaIcon(
            FontAwesomeIcons.envelope,
            size: 22.0,
            color: _color,
          ),
          errorText: widget.errorUsername,
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        onSubmitted: (String value) {
          FocusScope.of(context).requestFocus(_passwordFocusNode);
        },
      );
  TextField _buildPassword() {
    return TextField(
      controller: widget.passwordController,
      decoration: InputDecoration(
        border: InputBorder.none,
        labelText: "Password",
        labelStyle: _textStyle(),
        icon: FaIcon(
          FontAwesomeIcons.lock,
          size: 22.0,
          color: _color,
        ),
        errorText: widget.errorPassword,
        suffixIcon: IconButton(
          icon: FaIcon(
            _obscureTextPassword
                ? FontAwesomeIcons.eye
                : FontAwesomeIcons.eyeSlash,
            color: _color,
            size: 15.0,
          ),
          onPressed: () {
            setState(() {
              _obscureTextPassword = !_obscureTextPassword;
            });
          },
        ),
      ),
      obscureText: _obscureTextPassword,
    );
  }
}
