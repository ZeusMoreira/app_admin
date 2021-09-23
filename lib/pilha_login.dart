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
    return Stack(children: [
      const LoginCentralizado(),
      Positioned(
        top: 90,
        left: 76,
        right: 78,

        child: Container(
          width: 206,
          height: 189,
          child: Image.asset(
            'assets/images/logo_pato_burguer.png',
          ),
        ),
      ),
    ]);
  }
}
