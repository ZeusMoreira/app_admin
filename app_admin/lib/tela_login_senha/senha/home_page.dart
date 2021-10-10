import 'package:app_admin/tela_altera_contato/altera_contato.dart';
import 'package:flutter/material.dart';
import 'alterar_senha.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Center(
            child: Column(
              children: [
                Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.01, top: MediaQuery.of(context).size.height*0.05),
                    width: MediaQuery.of(context).size.width*0.39,
                    height: MediaQuery.of(context).size.height*0.045,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Pato',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            fontSize: MediaQuery.of(context).size.height*0.035,
                            color: Color(0xFF333333)
                          ),
                        ),
                        Text(
                          ' Burguer',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontWeight: FontWeight.w900,
                              fontStyle: FontStyle.normal,
                              fontSize: MediaQuery.of(context).size.height*0.035,
                              color: Color(0xFFFF9B0D)
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                Container(
                    width: MediaQuery.of(context).size.width*0.8,
                    height: MediaQuery.of(context).size.height*0.09,
                    child: Column(
                      children:  [
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.40),
                          child: Text(
                            'Bem vindo a',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,
                                fontSize: MediaQuery.of(context).size.width*0.055,
                                color: Color(0xFF333333)
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.23),
                          child: Text(
                            'Área Administrativa',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontWeight: FontWeight.w900,
                                fontStyle: FontStyle.normal,
                                fontSize: MediaQuery.of(context).size.width*0.055,
                                color: Color(0xFF333333)
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                SizedBox(height: MediaQuery.of(context).size.height*0.09,),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.01,),
                    height: MediaQuery.of(context).size.height*0.085,
                    width: MediaQuery.of(context).size.width*0.65,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      boxShadow: [
                         BoxShadow(
                           color: Colors.grey.withOpacity(0.5),
                           spreadRadius: 0.75,
                           blurRadius: 4,
                           offset: Offset(0,4), // changes position of shadow
                          ),
                      ],
                    ),
                    child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Padding(
                          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.06),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width*0.4,
                            height:  MediaQuery.of(context).size.height*0.032,
                            child: Text('Alterar Cardápio',
                              style: TextStyle(
                                  fontFamily: 'Roboto',
                                  fontSize:  MediaQuery.of(context).size.width*0.05,
                                  fontStyle: FontStyle.normal,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF9B0D)
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03),
                          child: SizedBox(
                            child: Icon(
                              Icons.article,
                              color: Color(0xFFFF9B0D),
                              size:  MediaQuery.of(context).size.width*0.08,
                            ),
                          ),
                        ),
                    ]),
                ),
                  onTap: null, // TODO
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.01,),
                      height: MediaQuery.of(context).size.height*0.085,
                      width: MediaQuery.of(context).size.width*0.65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.75,
                            blurRadius: 4,
                            offset: Offset(0,4),
                            // changes position of shadow
                          ),
                        ],
                      ),
                    child: Row (
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.06),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width*0.4,
                              height:  MediaQuery.of(context).size.height*0.032,
                              child: Text('Alterar Contato',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    fontSize: MediaQuery.of(context).size.width*0.05,
                                    fontStyle: FontStyle.normal,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFFFF9B0D)
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03),
                            child: SizedBox(
                              child: Icon(
                                Icons.phone,
                                color: Color(0xFFFF9B0D),
                                size: MediaQuery.of(context).size.width*0.08,
                              ),
                            ),
                          ),
                        ]),

                  ),
                    onTap: (){
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => TelaContato())
                      );
                    }
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                GestureDetector(
                  child: Container(
                      margin: EdgeInsets.only(left: MediaQuery.of(context).size.height*0.01,),
                      height: MediaQuery.of(context).size.height*0.085,
                      width: MediaQuery.of(context).size.width*0.65,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 0.75,
                            blurRadius: 4,
                            offset: Offset(0,4), // changes position of shadow
                          ),
                        ],
                      ),

                     child: Row (
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                       children: [
                         Padding(
                           padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.06),
                           child: SizedBox(
                             width: MediaQuery.of(context).size.width*0.4,
                             height:  MediaQuery.of(context).size.height*0.032,
                             child: Text('Alterar Senha',
                              style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: MediaQuery.of(context).size.width*0.05,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF9B0D)
                              ),
                             ),
                           ),
                         ),
                         Padding(
                           padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.03),
                           child: SizedBox(
                             child: Icon(
                               Icons.lock,
                               color: Color(0xFFFF9B0D),
                               size: MediaQuery.of(context).size.width*0.08,
                             ),
                             ),
                           ),
                       ],
                     ),
                  ),
                  onTap: (){
                    Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AlteraSenha())
                    );
                  }, // Navegaremos para a página alterar senha
                ),
              ],
            ),
          ),
        ),


      ),
    );
  }
}
