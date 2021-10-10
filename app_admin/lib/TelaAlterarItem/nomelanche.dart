import 'package:flutter/material.dart';

class NomeLanche extends StatefulWidget {

  @override
  _NomeLancheState createState() => _NomeLancheState();
}

class _NomeLancheState extends State<NomeLanche> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.only(
          left: (MediaQuery.of(context).size.width)*0.06944,
          right: (MediaQuery.of(context).size.width)*0.06944,
          top: (MediaQuery.of(context).size.height)*0.0563,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
                "Nome",
                style: TextStyle(
                    color: Color(0xFF434343),
                    fontSize: (MediaQuery.of(context).size.height)*0.028125,
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal
                )
            ),
            Container(
              height: (MediaQuery.of(context).size.height)*0.0578125,

              child: TextField(
                obscureText: false,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
                style: TextStyle(
                    color: Color.fromRGBO(67, 67, 67, 0.6),
                    fontSize: (MediaQuery.of(context).size.height)*0.028125,
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal
                ),
              ),
            ),
          ],
        )
        ,),
    );
  }
}