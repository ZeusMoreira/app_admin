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
      LoginCentralizado(),
      Positioned(
        top: MediaQuery.of(context).size.width * 0.15,
        left: MediaQuery.of(context).size.width * 0.2,
        right: MediaQuery.of(context).size.width * 0.2,

        child: Container(
          width: MediaQuery.of(context).size.width * 0.6,
          height: MediaQuery.of(context).size.width * 0.6,
          child: Image.asset(
            'assets/images/logo_pato_burguer.png',
          ),
        ),
      ),
    ]);
  }
}
