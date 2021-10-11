import 'package:app_admin/TelaAlterarCardapio/descricaobacon.dart';
import 'package:app_admin/tela_login_senha/senha/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class DesignAltCard extends StatefulWidget {
  const DesignAltCard({ Key? key }) : super(key: key);

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
              int length = snapshot.data.length;
              var arr = ['Pato-Frango', 'Pato-Bacon', 'Pato-Grelhado', 'PatoTata Pequena', 'PatoTata Media', 'PatoTata Grande', 'Pato Escaldante', 'Pato Combo', 'Sucos', 'Refrigerantes'];
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
                                  icon: const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                )
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery
                                  .of(context)
                                  .size
                                  .width * 0.12, top: MediaQuery
                                  .of(context)
                                  .size
                                  .height * 0.05),
                              child: Text(
                                'Alterar Cardápio',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.w900,
                                    fontSize: 24,
                                    color: Colors.white
                                ),
                              ),
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
                                  return InkWell(
                                    onTap: (){Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => Background(arr[index]),
                                    ));},
                                    child: Container(
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFFCB82),
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
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(top: 80),
                                              child: Container(
                                                width: double.infinity,
                                                decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius: BorderRadius.only(
                                                    bottomLeft: Radius.circular(16),
                                                    bottomRight: Radius.circular(16),
                                                  ),
                                                ),
                                                child: Column(
                                                  children: [
                                                    Padding(
                                                      padding: EdgeInsets.only(top: 60),
                                                      child: Text(
                                                        snapshot.data[arr[index]]['nome'],
                                                        style: TextStyle(
                                                          fontFamily: 'Roboto',
                                                          color: Color(0xFF434343),
                                                          fontSize: 16,
                                                          fontWeight: FontWeight.bold,
                                                        ),),
                                                    ),
                                                    Row(
                                                      mainAxisSize: MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(45, 0, 0, 0),
                                                          child: Text('R\$',
                                                            style: TextStyle(
                                                              fontFamily: 'Roboto',
                                                              color: Color(0xFFFF9B0D),
                                                              fontWeight: FontWeight.bold,
                                                            ),),),
                                                        Padding(
                                                          padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                          child: Text(snapshot.data[arr[index]]['preco'],
                                                            style: TextStyle(
                                                              fontFamily: 'Roboto',
                                                              color: Color(0xFF434343),
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold,
                                                            ),),)
                                                      ],)
                                                  ],
                                                )
                                              ),
                                            ),
                                            Positioned.fill(
                                                child: Align(
                                                  alignment: Alignment.topCenter,
                                                  child: Container(
                                                      padding: EdgeInsets.only(
                                                          top: 10.0
                                                      ),
                                                      height: 128,
                                                      child: Image.network(snapshot.data[arr[index]]['imagem'],
                                                        fit: BoxFit.fill,
                                                      )
                                                  ),
                                                )
                                            )
                                          ],
                                        )
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
