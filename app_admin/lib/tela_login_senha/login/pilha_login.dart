import 'package:flutter/material.dart';
import 'login_centralizado.dart';

class PilhaLogin extends StatefulWidget {
  const PilhaLogin({Key? key}) : super(key: key);

  @override
  _PilhaLoginState createState() => _PilhaLoginState();
}

class _PilhaLoginState extends State<PilhaLogin> {
  @override
  Widget build(BuildContext context) {
    return LoginCentralizado();
  }
}
