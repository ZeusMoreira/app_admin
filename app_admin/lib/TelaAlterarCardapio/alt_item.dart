import 'package:app_admin/TelaAlterarCardapio/altcardapio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class Background extends StatefulWidget {
  late final String id;
  late final String nm;
  late final String dtls;
  late final String ingrd;
  late final String prc;
  late final String num;
  Background(this.id,this.nm,this.dtls,this.ingrd,this.prc,this.num);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  late Future userFuture;

  TextEditingController _nome = TextEditingController();
  TextEditingController _details = TextEditingController();
  TextEditingController _ingredients = TextEditingController();
  TextEditingController _price = TextEditingController();

  @override
  void initState(){
    super.initState();
    _nome = TextEditingController(text: widget.nm);
    _details = TextEditingController(text: widget.dtls);
    _ingredients = TextEditingController(text: widget.ingrd);
    _price = TextEditingController(text: widget.prc);
    userFuture = getData();
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Color(0xFFFF9B0D),
        body: FutureBuilder(
    future: userFuture,
    builder: (context,AsyncSnapshot snapshot) {
        switch (snapshot.connectionState){
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              }
              return SingleChildScrollView(
                child: Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
          child: Stack(
            children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, top: MediaQuery.of(context).size.height*0.05),
                        child: IconButton(
                          onPressed: () {
                            Navigator.of(context).push(
                                MaterialPageRoute(builder: (context) => DesignAltCard())
                            );
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 28,
                          ),
                        )
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2, top: MediaQuery.of(context).size.height*0.05),
                      child: Text(
                        'Cardápio',
                        style: TextStyle(
                            fontFamily:'Roboto',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w900,
                            fontSize: 24,
                            color: Colors.white
                        ),
                      ),
                    ),
                  ],
                ),

                Padding(
                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.88, top: MediaQuery.of(context).size.height*0.05),
                    child: Column(
                      children: [
                        IconButton(
                          onPressed: (){
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.0)
                                      ),
                                      child: Stack(
                                          children:  [Container(
                                              height: (MediaQuery.of(context).size.height)*0.3203,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(16.0)
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: (MediaQuery.of(context).size.height)*0.09375,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFFFF9B0D),
                                                        borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(16.0),
                                                            topRight: Radius.circular(16.0)
                                                        )
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            "Deletar Item",
                                                            style: TextStyle(
                                                                fontSize: (MediaQuery.of(context).size.height)*0.0375,
                                                                fontWeight: FontWeight.w900,
                                                                color: Color(0xFFFFFFFF)
                                                            )
                                                        )
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: (MediaQuery.of(context).size.height)*0.0375,
                                                        right: (MediaQuery.of(context).size.width)*0.025,
                                                        left: (MediaQuery.of(context).size.width)*0.025
                                                    ),
                                                    child: Text("Tem certeza que deseja deletar esse item?",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize:(MediaQuery.of(context).size.height)*0.028125,
                                                          fontWeight: FontWeight.w700,
                                                        )
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: (MediaQuery.of(context).size.width)*0.044,
                                                        left: (MediaQuery.of(context).size.width)*0.044,
                                                        top: (MediaQuery.of(context).size.height)*0.0375
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: (){
                                                            Navigator.of(context).pop();
                                                          },
                                                          child: Container(
                                                              height: (MediaQuery.of(context).size.height)*0.0609375,
                                                              width: (MediaQuery.of(context).size.width)*0.3333,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  color: Color(0xFFFF9B0D)
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Text(
                                                                      "Voltar",
                                                                      style: TextStyle(
                                                                          color: Color(0xFFFFFFFF),
                                                                          fontSize: MediaQuery.of(context).size.height*0.03125,
                                                                          fontWeight: FontWeight.w700
                                                                      )

                                                                  )
                                                              )
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: (){
                                                            DocumentReference ref = FirebaseFirestore.instance.collection('PatoBurguer').doc('lanches');
                                                            ref.update({
                                                              'lunch': FieldValue.arrayRemove([widget.id]),
                                                              widget.id : FieldValue.delete(),
                                                            });
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(builder: (context) => DesignAltCard(),
                                                                ));
                                                          },
                                                          child: Container(
                                                              height: (MediaQuery.of(context).size.height)*0.0609375,
                                                              width: (MediaQuery.of(context).size.width)*0.3333,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  color: Color(0xFFFF0000)
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Text(
                                                                      "Deletar",
                                                                      style: TextStyle(
                                                                          color: Color(0xFFFFFFFF),
                                                                          fontSize: MediaQuery.of(context).size.height*0.03125,
                                                                          fontWeight: FontWeight.w700
                                                                      )

                                                                  )
                                                              )
                                                          ),
                                                        )
                                                      ],),
                                                  )
                                                ],
                                              )
                                          ),
                                          ])

                                  );
                                }
                            );
                          },
                          icon: Icon(
                            Icons.delete_forever_sharp,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: () async{
                             if(_nome.text == "" || _ingredients.text == "" || _details.text == "" || _price.text == ""){
                               showDialog(
                                 context: context,
                                 barrierDismissible: true,
                                 builder: (BuildContext context) => const AlertDialog(
                                   title: Text('Dados incompletos'),
                                   content: Text('Edite apenas o que for necessário.'),
                                 ),
                               );
                             }else{
                               DocumentReference ref = FirebaseFirestore.instance.collection('PatoBurguer').doc('lanches');
                              ref.update({
                                widget.id+'.nome': _nome.text,
                                widget.id+'.detalhes': _details.text,
                                widget.id+'.ingredientes': _ingredients.text,
                                widget.id+'.preco': _price.text
                              });
                               Navigator.of(context).push(
                                   MaterialPageRoute(builder: (context) => DesignAltCard(),
                                   ));
                             }
                          },
                          icon: Icon(
                            Icons.save,
                            color: Colors.white,
                          ),
                        ),
                        IconButton(
                          onPressed: (){
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return Dialog(
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(16.0)
                                      ),
                                      child: Stack(
                                          children:  [Container(
                                              height: (MediaQuery.of(context).size.height)*0.3203,
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.circular(16.0)
                                              ),
                                              child: Column(
                                                children: [
                                                  Container(
                                                    height: (MediaQuery.of(context).size.height)*0.09375,
                                                    width: double.infinity,
                                                    decoration: BoxDecoration(
                                                        color: Color(0xFFFF9B0D),
                                                        borderRadius: BorderRadius.only(
                                                            topLeft: Radius.circular(16.0),
                                                            topRight: Radius.circular(16.0)
                                                        )
                                                    ),
                                                    child: Center(
                                                        child: Text(
                                                            "Promoção",
                                                            style: TextStyle(
                                                                fontSize: (MediaQuery.of(context).size.height)*0.0375,
                                                                fontWeight: FontWeight.w900,
                                                                color: Color(0xFFFFFFFF)
                                                            )
                                                        )
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        top: (MediaQuery.of(context).size.height)*0.0375,
                                                        right: (MediaQuery.of(context).size.width)*0.025,
                                                        left: (MediaQuery.of(context).size.width)*0.025
                                                    ),
                                                    child: Text("Deseja deixar esse item em promoção?",
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize:(MediaQuery.of(context).size.height)*0.028125,
                                                          fontWeight: FontWeight.w700,
                                                        )
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: (MediaQuery.of(context).size.width)*0.044,
                                                        left: (MediaQuery.of(context).size.width)*0.044,
                                                        top: (MediaQuery.of(context).size.height)*0.0375
                                                    ),
                                                    child: Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      children: [
                                                        InkWell(
                                                          onTap: (){
                                                            DocumentReference ref = FirebaseFirestore.instance.collection('PatoBurguer').doc('lanches');
                                                            ref.update({
                                                              widget.id+'.promo': false,
                                                            });
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(builder: (context) => DesignAltCard(),
                                                                ));
                                                          },
                                                          child: Container(
                                                              height: (MediaQuery.of(context).size.height)*0.0609375,
                                                              width: (MediaQuery.of(context).size.width)*0.3333,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  color: Color(0xFFFF9B0D)
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Text(
                                                                      "Não",
                                                                      style: TextStyle(
                                                                          color: Color(0xFFFFFFFF),
                                                                          fontSize: MediaQuery.of(context).size.height*0.03125,
                                                                          fontWeight: FontWeight.w700
                                                                      )

                                                                  )
                                                              )
                                                          ),
                                                        ),
                                                        InkWell(
                                                          onTap: (){
                                                            DocumentReference ref = FirebaseFirestore.instance.collection('PatoBurguer').doc('lanches');
                                                            ref.update({
                                                              widget.id+'.promo': true,
                                                            });
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(builder: (context) => DesignAltCard(),
                                                                ));
                                                          },
                                                          child: Container(
                                                              height: (MediaQuery.of(context).size.height)*0.0609375,
                                                              width: (MediaQuery.of(context).size.width)*0.3333,
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(8.0),
                                                                  color: Color(0xFFFF0000)
                                                              ),
                                                              child:
                                                              Center(
                                                                  child: Text(
                                                                      "Sim",
                                                                      style: TextStyle(
                                                                          color: Color(0xFFFFFFFF),
                                                                          fontSize: MediaQuery.of(context).size.height*0.03125,
                                                                          fontWeight: FontWeight.w700
                                                                      )

                                                                  )
                                                              )
                                                          ),
                                                        )
                                                      ],),
                                                  )
                                                ],
                                              )
                                          ),
                                          ])

                                  );
                                }
                            );
                          },
                          icon: Icon(
                            MdiIcons.accountCashOutline,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    )
                ),
                Stack(
                    children: [
                      Positioned(
                        bottom: 0.0,
                        child: Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFF3F3F3),
                                border: Border.all(
                                  color: Colors.white,
                                ),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(20.0),
                                    topLeft: Radius.circular(20.0)
                                )
                            ),
                            height: (MediaQuery.of(context).size.height)/1.7,
                            width: (MediaQuery.of(context).size.width),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
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
                                        width: MediaQuery.of(context).size.width*0.85,
                                        child: TextField(
                                          maxLines: 1,
                                          controller: _nome,
                                          decoration: InputDecoration(
                                            filled: true,
                                            fillColor: Colors.white,
                                            border: OutlineInputBorder(),
                                            contentPadding: EdgeInsets.only(left: 10),
                                          ),
                                          style: TextStyle(
                                              color: Color(0xFF898989),
                                              fontSize: (MediaQuery.of(context).size.height)*0.04,
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.normal,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                        top: (MediaQuery.of(context).size.height)*0.0125,
                                        left: (MediaQuery.of(context).size.width)*0.0694,
                                      ),
                                      child: Text(
                                          "Detalhes",
                                          style: TextStyle(
                                          color: Color(0xFF434343),
                                              fontSize: (MediaQuery.of(context).size.height)*0.028125,
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.normal
                                          )
                                        ),
                                      ),
                                  ],
                                ),
                                Row(
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
                                            width: (MediaQuery.of(context).size.width)*0.85,
                                              child: TextField(
                                                maxLines: 3,
                                                controller: _details,
                                                decoration: InputDecoration(
                                                  filled: true,
                                                  fillColor: Colors.white,
                                                  contentPadding: EdgeInsets.only(left: 5, top: 5),
                                                  border: OutlineInputBorder(),
                                                ),
                                                style: TextStyle(
                                                    color: Color(0xFF434343),
                                                    fontSize: (MediaQuery.of(context).size.height)*0.021875,
                                                    fontWeight: FontWeight.w500,
                                                    fontStyle: FontStyle.normal
                                                ),
                                              ),

                                          )

                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        top: (MediaQuery.of(context).size.height)*0.0125,
                                        left: (MediaQuery.of(context).size.width)*0.0694,
                                      ),
                                      child: Text(
                                          "Ingredientes",
                                          style: TextStyle(
                                              color: Color(0xFF434343),
                                              fontSize: (MediaQuery.of(context).size.height)*0.028125,
                                              fontWeight: FontWeight.w900,
                                              fontStyle: FontStyle.normal
                                          )
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
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
                                              width: (MediaQuery.of(context).size.width)*0.85,
                                                child: TextField(
                                                    maxLines: 3,
                                                    controller: _ingredients,
                                                    decoration: InputDecoration(
                                                      filled: true,
                                                      fillColor: Colors.white,
                                                      contentPadding: EdgeInsets.only(left: 5, top: 5),
                                                      border: OutlineInputBorder(),
                                                    ),
                                                    style: TextStyle(
                                                        color: Color(0xFF434343),
                                                        fontSize: (MediaQuery.of(context).size.height)*0.021875,
                                                        fontWeight: FontWeight.w500,
                                                        fontStyle: FontStyle.normal
                                                    )
                                                ),

                                          )],
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
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
                                          width: (MediaQuery.of(context).size.width)*0.85,
                                          child: TextField(
                                              maxLines: 1,
                                              controller: _price,
                                              decoration: InputDecoration(
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.only(left: 12,right: 12,top: 12,bottom: 12),
                                                  child: Text('R\$',
                                                    style: TextStyle(
                                                      fontSize: (MediaQuery.of(context).size.height)*0.023,
                                                      fontFamily: 'Roboto',
                                                      color: Color(0xFFFF9B0D),
                                                      fontWeight: FontWeight.bold,
                                                    ),),),
                                                filled: true,
                                                fillColor: Colors.white,
                                                contentPadding: EdgeInsets.only(top: 0),
                                                border: OutlineInputBorder(),
                                              ),
                                              style: TextStyle(
                                                  color: Color(0xFF898989),
                                                  fontSize: (MediaQuery.of(context).size.height)*0.04,
                                                  fontWeight: FontWeight.w900,
                                                  fontStyle: FontStyle.normal
                                              )
                                          )
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            )
                        ),
                      ),
                      Positioned(
                        right: (MediaQuery.of(context).size.width)*0.1105,
                        left: (MediaQuery.of(context).size.width)*0.115,
                        top: (MediaQuery.of(context).size.height)*0.1625,
                        child:
                        Image.network(
                          snapshot.data[widget.id]['imagem'],
                          fit: BoxFit.fill,
                            height: (MediaQuery.of(context).size.height)*0.31,
                            width: (MediaQuery.of(context).size.width)*0.8388
                        ),
                      )
                    ]
                ),
            ],
          ),
        ),
              );
        default:
          return Text('default');

    }})
      ),
    );
  }
}

getData() async{
  var a = await FirebaseFirestore.instance
      .collection('PatoBurguer')
      .doc('lanches')
      .get();
  return a.data();
}

