import 'package:flutter/material.dart';

class Ingredientes extends StatefulWidget {

  @override
  _IngredientesState createState() => _IngredientesState();
}

class _IngredientesState extends State<Ingredientes> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: EdgeInsets.only(
              top: (MediaQuery.of(context).size.height)*0.0125,
              left: (MediaQuery.of(context).size.width)*0.0694,
              right: (MediaQuery.of(context).size.width)*0.0694
          ),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.only(
                    top: 1.0,
                    bottom: 1.0,
                  ),
                  height: (MediaQuery.of(context).size.height)*0.073125,
                  width: (MediaQuery.of(context).size.width)*0.8555,
                  child: SingleChildScrollView(
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
                    ),
                  )
              )],
          ),
        ),
      ],
    );
  }
}
