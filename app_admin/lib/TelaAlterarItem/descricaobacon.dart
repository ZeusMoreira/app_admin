import 'package:app_admin/TelaAlterarCardapio/altcardapio.dart';
import 'package:app_admin/TelaAlterarItem/design.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {


  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFF9B0D),
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: (){},
                icon: Icon(Icons.delete_forever_sharp,
                  size: 32,
                ))
          ],
          leading: Builder(
            builder: (context) => IconButton(
              icon: Icon(Icons.arrow_back_ios_new_sharp,
                  size: 32),
              onPressed: () {
                Navigator.of(context)
                    .pop(MaterialPageRoute(builder: (context) => DesignAltCard()));
              },
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: Text(
            "Cardápio",
            style: new TextStyle(
                fontSize: MediaQuery.of(context).size.height * 0.0375,
                fontFamily: "Roboto",
                fontStyle: FontStyle.normal,
                color: Color(0xFFFFFFFF),
                fontWeight: FontWeight.w900),
          ),
        ),
        body: Design(),
      ),
    );
  }
}