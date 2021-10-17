import 'package:app_admin/TelaAlterarCardapio/altcardapio.dart';
import 'package:app_admin/tela_altera_contato/altera_contato.dart';
import 'package:app_admin/tela_login_senha/login/login_page.dart';
import 'package:app_admin/tela_login_senha/senha/authentication_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../tela_login_senha/senha/alterar_senha.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future userFuture;

  @override
  void initState(){
    super.initState();
    userFuture = getData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                     child: Center(
                       child: Column(
                         children: [
                           Container(
                             margin: EdgeInsets.only(left: MediaQuery
                                 .of(context)
                                 .size
                                 .width * 0.01, top: MediaQuery
                                 .of(context)
                                 .size
                                 .height * 0.05),
                             width: MediaQuery
                                 .of(context)
                                 .size
                                 .width * 0.39,
                             height: MediaQuery
                                 .of(context)
                                 .size
                                 .height * 0.045,
                             child: Row(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   'Pato',
                                   style: TextStyle(
                                       fontFamily: 'Roboto',
                                       fontWeight: FontWeight.w900,
                                       fontStyle: FontStyle.normal,
                                       fontSize: MediaQuery
                                           .of(context)
                                           .size
                                           .height * 0.035,
                                       color: Color(0xFF333333)
                                   ),
                                 ),
                                 Text(
                                   ' Burguer',
                                   style: TextStyle(
                                       fontFamily: 'Roboto',
                                       fontWeight: FontWeight.w900,
                                       fontStyle: FontStyle.normal,
                                       fontSize: MediaQuery
                                           .of(context)
                                           .size
                                           .height * 0.035,
                                       color: Color(0xFFFF9B0D)
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           SizedBox(height: MediaQuery
                               .of(context)
                               .size
                               .height * 0.08,),
                           Container(
                             width: MediaQuery
                                 .of(context)
                                 .size
                                 .width * 0.8,
                             height: MediaQuery
                                 .of(context)
                                 .size
                                 .height * 0.09,
                             child: Column(
                               children: [
                                 Padding(
                                   padding: EdgeInsets.only(right: MediaQuery
                                       .of(context)
                                       .size
                                       .width * 0.40),
                                   child: Text(
                                     'Bem vindo a',
                                     style: TextStyle(
                                         fontFamily: 'Roboto',
                                         fontWeight: FontWeight.w900,
                                         fontStyle: FontStyle.normal,
                                         fontSize: MediaQuery
                                             .of(context)
                                             .size
                                             .width * 0.055,
                                         color: Color(0xFF333333)
                                     ),
                                   ),
                                 ),
                                 Padding(
                                   padding: EdgeInsets.only(right: MediaQuery
                                       .of(context)
                                       .size
                                       .width * 0.23),
                                   child: Text(
                                     'Área Administrativa',
                                     style: TextStyle(
                                         fontFamily: 'Roboto',
                                         fontWeight: FontWeight.w900,
                                         fontStyle: FontStyle.normal,
                                         fontSize: MediaQuery
                                             .of(context)
                                             .size
                                             .width * 0.055,
                                         color: Color(0xFF333333)
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ),
                           SizedBox(height: MediaQuery
                               .of(context)
                               .size
                               .height * 0.09,),
                           GestureDetector(
                             child: Container(
                               margin: EdgeInsets.only(left: MediaQuery
                                   .of(context)
                                   .size
                                   .height * 0.01,),
                               height: MediaQuery
                                   .of(context)
                                   .size
                                   .height * 0.085,
                               width: MediaQuery
                                   .of(context)
                                   .size
                                   .width * 0.65,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10)),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 0.75,
                                     blurRadius: 4,
                                     offset: Offset(
                                         0, 4), // changes position of shadow
                                   ),
                                 ],
                               ),
                               child: Row(
                                   mainAxisAlignment: MainAxisAlignment
                                       .spaceBetween,
                                   children: [
                                     Padding(
                                       padding: EdgeInsets.only(left: MediaQuery
                                           .of(context)
                                           .size
                                           .width * 0.06),
                                       child: SizedBox(
                                         width: MediaQuery
                                             .of(context)
                                             .size
                                             .width * 0.4,
                                         height: MediaQuery
                                             .of(context)
                                             .size
                                             .height * 0.032,
                                         child: Text('Alterar Cardápio',
                                           style: TextStyle(
                                               fontFamily: 'Roboto',
                                               fontSize: MediaQuery
                                                   .of(context)
                                                   .size
                                                   .width * 0.05,
                                               fontStyle: FontStyle.normal,
                                               fontWeight: FontWeight.bold,
                                               color: Color(0xFFFF9B0D)
                                           ),
                                         ),
                                       ),
                                     ),
                                     Padding(
                                       padding: EdgeInsets.only(
                                           right: MediaQuery
                                               .of(context)
                                               .size
                                               .width * 0.03),
                                       child: SizedBox(
                                         child: Icon(
                                           Icons.article,
                                           color: Color(0xFFFF9B0D),
                                           size: MediaQuery
                                               .of(context)
                                               .size
                                               .width * 0.08,
                                         ),
                                       ),
                                     ),
                                   ]),
                             ),
                             onTap: () {
                               Navigator.of(context).push(
                                   MaterialPageRoute(
                                       builder: (context) => DesignAltCard()));
                             },
                           ),
                           SizedBox(height: MediaQuery
                               .of(context)
                               .size
                               .height * 0.08,),
                           GestureDetector(
                               child: Container(
                                 margin: EdgeInsets.only(left: MediaQuery
                                     .of(context)
                                     .size
                                     .height * 0.01,),
                                 height: MediaQuery
                                     .of(context)
                                     .size
                                     .height * 0.085,
                                 width: MediaQuery
                                     .of(context)
                                     .size
                                     .width * 0.65,
                                 decoration: BoxDecoration(
                                   color: Colors.white,
                                   borderRadius: BorderRadius.all(
                                       Radius.circular(10)),
                                   boxShadow: [
                                     BoxShadow(
                                       color: Colors.grey.withOpacity(0.5),
                                       spreadRadius: 0.75,
                                       blurRadius: 4,
                                       offset: Offset(0, 4),
                                       // changes position of shadow
                                     ),
                                   ],
                                 ),
                                 child: Row(
                                     mainAxisAlignment: MainAxisAlignment
                                         .spaceBetween,
                                     children: [
                                       Padding(
                                         padding: EdgeInsets.only(
                                             left: MediaQuery
                                                 .of(context)
                                                 .size
                                                 .width * 0.06),
                                         child: SizedBox(
                                           width: MediaQuery
                                               .of(context)
                                               .size
                                               .width * 0.4,
                                           height: MediaQuery
                                               .of(context)
                                               .size
                                               .height * 0.032,
                                           child: Text('Alterar Contato',
                                             style: TextStyle(
                                                 fontFamily: 'Roboto',
                                                 fontSize: MediaQuery
                                                     .of(context)
                                                     .size
                                                     .width * 0.05,
                                                 fontStyle: FontStyle.normal,
                                                 fontWeight: FontWeight.bold,
                                                 color: Color(0xFFFF9B0D)
                                             ),
                                           ),
                                         ),
                                       ),
                                       Padding(
                                         padding: EdgeInsets.only(
                                             right: MediaQuery
                                                 .of(context)
                                                 .size
                                                 .width * 0.03),
                                         child: SizedBox(
                                           child: Icon(
                                             Icons.phone,
                                             color: Color(0xFFFF9B0D),
                                             size: MediaQuery
                                                 .of(context)
                                                 .size
                                                 .width * 0.08,
                                           ),
                                         ),
                                       ),
                                     ]),

                               ),
                               onTap: () {
                                 Navigator.of(context).push(
                                     MaterialPageRoute(
                                         builder: (context) => TelaContato(
                                           snapshot.data['localizacao']['endereco'],
                                           snapshot.data['horario']['segSexta'],
                                           snapshot.data['horario']['sabado'],
                                           snapshot.data['horario']['domFer'],
                                           snapshot.data['whats'],
                                           snapshot.data['redeSoc']['face'],
                                           snapshot.data['redeSoc']['insta'],
                                         )
                                     )
                                 );
                               }
                           ),
                           SizedBox(height: MediaQuery
                               .of(context)
                               .size
                               .height * 0.08,),
                           GestureDetector(
                             child: Container(
                               margin: EdgeInsets.only(left: MediaQuery
                                   .of(context)
                                   .size
                                   .height * 0.01,),
                               height: MediaQuery
                                   .of(context)
                                   .size
                                   .height * 0.085,
                               width: MediaQuery
                                   .of(context)
                                   .size
                                   .width * 0.65,
                               decoration: BoxDecoration(
                                 color: Colors.white,
                                 borderRadius: BorderRadius.all(
                                     Radius.circular(10)),
                                 boxShadow: [
                                   BoxShadow(
                                     color: Colors.grey.withOpacity(0.5),
                                     spreadRadius: 0.75,
                                     blurRadius: 4,
                                     offset: Offset(
                                         0, 4), // changes position of shadow
                                   ),
                                 ],
                               ),

                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment
                                     .spaceBetween,
                                 children: [
                                   Padding(
                                     padding: EdgeInsets.only(left: MediaQuery
                                         .of(context)
                                         .size
                                         .width * 0.06),
                                     child: SizedBox(
                                       width: MediaQuery
                                           .of(context)
                                           .size
                                           .width * 0.4,
                                       height: MediaQuery
                                           .of(context)
                                           .size
                                           .height * 0.032,
                                       child: Text('Alterar Senha',
                                         style: TextStyle(
                                             fontFamily: 'Roboto',
                                             fontSize: MediaQuery
                                                 .of(context)
                                                 .size
                                                 .width * 0.05,
                                             fontStyle: FontStyle.normal,
                                             fontWeight: FontWeight.bold,
                                             color: Color(0xFFFF9B0D)
                                         ),
                                       ),
                                     ),
                                   ),
                                   Padding(
                                     padding: EdgeInsets.only(right: MediaQuery
                                         .of(context)
                                         .size
                                         .width * 0.03),
                                     child: SizedBox(
                                       child: Icon(
                                         Icons.lock,
                                         color: Color(0xFFFF9B0D),
                                         size: MediaQuery
                                             .of(context)
                                             .size
                                             .width * 0.08,
                                       ),
                                     ),
                                   ),
                                 ],
                               ),
                             ),
                             onTap: () {
                               Navigator.of(context).push(
                                   MaterialPageRoute(
                                       builder: (context) => AlteraSenha())
                               );
                             }, // Navegaremos para a página alterar senha
                           ),
                           SizedBox(height: MediaQuery
                               .of(context)
                               .size
                               .height * 0.10,),
                          ElevatedButton(
                            onPressed: (){
                              context.read<AuthenticationService>().signOut();
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => LoginPage(),
                                  ));
                            },
                            child: Text(
                              'Sair',
                              style: TextStyle(
                                  fontFamily: 'Poppins',
                                  fontSize: MediaQuery.of(context).size.height*0.03,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                              style: ButtonStyle(
                                  backgroundColor:
                                  MaterialStateProperty.all<Color>(Color(0xFFFF9B0D)),
                                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(7)))),
                          )


                         ],
                       ),
                     ),
                   ),
                 );
               default:
                 return Text('default');
             }}),
    );
  }
}

getData() async{
  var a = await FirebaseFirestore.instance
      .collection('PatoBurguer')
      .doc('config')
      .get();
  return a.data();
}
