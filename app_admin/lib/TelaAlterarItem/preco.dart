import 'package:flutter/material.dart';

class Preco extends StatefulWidget {

  @override
  _PrecoState createState() => _PrecoState();
}

class _PrecoState extends State<Preco> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: (MediaQuery.of(context).size.height)*0.0125,
        left: (MediaQuery.of(context).size.width)*0.0694,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Preço",
              style: TextStyle(
                  color: Color(0xFF434343),
                  fontSize: (MediaQuery.of(context).size.height)*0.028125,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.normal
              )
          ),
          Container(
            // height: (MediaQuery.of(context).size.height)*0.078125,
              width: (MediaQuery.of(context).size.width)*0.8555,
              child: TextField(
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 3,
                  obscureText: false,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  style: TextStyle(
                      color: Color.fromRGBO(67, 67, 67, 0.6),
                      fontSize: (MediaQuery.of(context).size.height)*0.021875,
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.normal
                  )
              )
          ),
        ],
      ),
    );
  }
}
