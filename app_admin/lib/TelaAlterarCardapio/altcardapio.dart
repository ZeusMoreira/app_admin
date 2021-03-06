import 'package:app_admin/TelaAlterarCardapio/alt_item.dart';
import 'package:app_admin/main_home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'add_item.dart';

class DesignAltCard extends StatefulWidget {

  @override
  _DesignAltCardState createState() => _DesignAltCardState();
}

class _DesignAltCardState extends State<DesignAltCard> {

  late Future userFuture;

  @override
  void initState(){
    super.initState();
    userFuture = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFF9B0D),
        body: FutureBuilder(
          future: userFuture,
        builder: (context,AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Text('none');
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(child: CircularProgressIndicator());
              }
              int length = snapshot.data.length-1;
              return Container(
                  child: Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                                padding: EdgeInsets.only(left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.05, top: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => HomePage())
                                    );
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.height*0.035,
                                  ),
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.1, top: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.05),
                              child: Text(
                                'Alterar Card??pio',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w900,
                                    fontSize: MediaQuery.of(context).size.height*0.032,
                                    color: Colors.white
                                ),
                              ),
                            ),
                            Padding(
                                padding: EdgeInsets.only(left: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.1, top: MediaQuery
                                    .of(context)
                                    .size
                                    .height * 0.05,right: MediaQuery
                                    .of(context)
                                    .size
                                    .width * 0.05),
                                child: IconButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) => AddItem())
                                    );
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.white,
                                    size: MediaQuery.of(context).size.height*0.035,
                                  ),
                                )
                            ),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                    color: Colors.white,
                                  ),
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(15.0),
                                      topLeft: Radius.circular(15.0))),
                              height: (MediaQuery
                                  .of(context)
                                  .size
                                  .height) / 1.2,
                              width: MediaQuery
                                  .of(context)
                                  .size
                                  .width,
                              child: GridView.count(
                                primary: false,
                                padding: EdgeInsets.all(30),
                                crossAxisSpacing: 26,
                                mainAxisSpacing: 32,
                                crossAxisCount: 2,
                                childAspectRatio: 0.8,
                                children: List.generate(length, (index){
                                  String id = snapshot.data['lunch'][index];
                                  return InkWell(
                                    onTap: (){Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => Background(
                                          snapshot.data['lunch'][index],
                                          snapshot.data[id]['nome'],
                                          snapshot.data[id]['detalhes'],
                                          snapshot.data[id]['ingredientes'],
                                          snapshot.data[id]['preco'],
                                          index.toString()
                                        ),
                                    ));},
                                    child: Stack(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              gradient: LinearGradient(
                                                begin: Alignment.topCenter,
                                                end: Alignment.bottomCenter,
                                                colors: [
                                                  Color(0xFFFFCB82),
                                                  Colors.white,
                                                  Colors.white,
                                                ],
                                              ),
                                              borderRadius: BorderRadius.circular(16),
                                              boxShadow: [
                                                BoxShadow(
                                                  blurRadius: 4,
                                                  color: Color(0x3F000000),
                                                  offset: Offset(0, 4),
                                                  spreadRadius: 0,
                                                )
                                              ],
                                            ),
                                        ),
                                                Column(
                                                      children: [
                                                        Align(
                                                          alignment: Alignment.topCenter,
                                                          child: Container(
                                                              height: MediaQuery.of(context).size.height*0.18,
                                                              child: Image.network(snapshot.data[id]['imagem'],
                                                                fit: BoxFit.fill,
                                                              )

                                                          ),
                                                        ),
                                                        Text(
                                                            snapshot.data[id]['nome'],
                                                            style: TextStyle(
                                                              fontFamily: 'Roboto',
                                                              color: Color(0xFF434343),
                                                              fontSize: MediaQuery.of(context).size.height*0.02,
                                                              fontWeight: FontWeight.bold,
                                                            ),),

                                                        Row(
                                                          children: [
                                                            Padding(
                                                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.1),
                                                              child: Text('R\$',
                                                                style: TextStyle(
                                                                  fontFamily: 'Roboto',
                                                                  color: Color(0xFFFF9B0D),
                                                                  fontWeight: FontWeight.bold,
                                                                ),),),
                                                            Text(snapshot.data[id]['preco'],
                                                                style: TextStyle(
                                                                  fontFamily: 'Roboto',
                                                                  color: Color(0xFF434343),
                                                                  fontSize: MediaQuery.of(context).size.height*0.025,
                                                                  fontWeight: FontWeight.bold,
                                                                ),)
                                                          ],)
                                                      ],
                                                    ),

                                      ],
                                    ),
                                  );
                                }),
                              ),

                            ),
                          ],
                        )
                      ]
                  )
              );
            default:
              return Text('default');
          }
        })
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
