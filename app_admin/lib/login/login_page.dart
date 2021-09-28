import 'package:flutter/material.dart';
import 'pilha_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: const Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFF9B0D),
        body: PilhaLogin(),
      )
    );
  }
}
