import 'package:flutter/material.dart';

class LoginCentralizado extends StatefulWidget {
  const LoginCentralizado({Key? key}) : super(key: key);

  @override
  _LoginCentralizadoState createState() => _LoginCentralizadoState();
}

class _LoginCentralizadoState extends State<LoginCentralizado> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 309,
        height: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(left: 27, right: 220.0, top: 49, bottom: 0),
              child: Container(
                width: 62,
                height: 24,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),

          SizedBox(height: 21.44),

          Padding(
            padding: const EdgeInsets.only(left: 19.9, right: 28.0),
            child: Container(
              height: 41.89,
              width: 261.1,
              child: const TextField(
                  onChanged: null,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    labelText: 'Usuário',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                  )),
            ),
          ),
          const SizedBox(
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.9, right: 28.0),
            child: Container(
              height: 41.89,
              width: 261.1,
              child: const TextField(
                  onChanged: null,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                  )),
            ),
          ),
          const SizedBox(height: 14.67),
          Padding(
            padding: const EdgeInsets.only(left: 158, right: 31),
            child: Container(
              height: 16,
              width: 120,
              alignment: Alignment.topRight,
              child: GestureDetector(
                  child: const Text(
                    "Esqueceu a senha?",
                    style: TextStyle(
                        decoration: TextDecoration.underline,
                        fontSize: 13,
                        fontWeight: FontWeight.w900,
                        fontFamily: 'Roboto',
                        color: Color(0xFF434343),
                        fontStyle: FontStyle.normal),
                  ),
                  onTap: () {}),
            ),
          ),
          const SizedBox(
            height: 18,
          ),
          Container(
            width: 264,
            height: 54,
            child: ElevatedButton(
              onPressed: null,
              child: const Text(
                'Entrar',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFFF9B0D)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
          ),
        ]),
      ),
    );
  }
}
