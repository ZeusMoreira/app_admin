import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'alterar_senha.dart';
import 'authentication_service.dart';
import 'login/login_page.dart';


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
        child: Column(
          children: [
            Container(
                margin: const EdgeInsets.only(left: 114, top: 54, right: 104),
                width: 152,
                height: 27,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'Pato',
                      style: TextStyle(
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        fontSize: 24,
                        color: Color(0xFF333333)
                      ),
                    ),
                    Text(
                      ' Burguer',
                      style: TextStyle(
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          fontSize: 24,
                          color: Color(0xFFFF9B0D)
                      ),
                    ),
                  ],
                ),
              ),
            const SizedBox(height: 50,),
            Container(
                width: 300,
                height: 56,
                child: Column(
                  children: const [
                    Padding(
                      padding: EdgeInsets.only(right: 154),
                      child: Text(
                        'Bem vindo a',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            fontSize: 22,
                            color: Color(0xFF333333)
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 84),
                      child: Text(
                        'Área Administrativa',
                        style: TextStyle(
                            fontFamily: 'Roboto',
                            fontWeight: FontWeight.w900,
                            fontStyle: FontStyle.normal,
                            fontSize: 22,
                            color: Color(0xFF333333)
                        ),
                      ),
                    )
                  ],
                ),
              ),
            const SizedBox(height: 79,),
            GestureDetector(
              child: Container(
                margin: EdgeInsets.only(left: 63, right: 40),
                height: 67,
                width: 257,
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
                    children: const [
                    Padding(
                      padding: EdgeInsets.only(left: 22),
                      child: SizedBox(
                        width: 150,
                        height: 25,
                        child: Text('Alterar Cardápio',
                          style: TextStyle(
                              fontFamily: 'Roboto',
                              fontSize: 20,
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF9B0D)
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 17),
                      child: SizedBox(
                        child: Icon(
                          Icons.article,
                          color: Color(0xFFFF9B0D),
                          size: 30,
                        ),
                      ),
                    ),
                ]),
            ),
              onTap: null,
            ),
            const SizedBox(height: 58,),
            GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(left: 63, right: 40),
                  height: 67,
                  width: 257,
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
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(left: 22),
                        child: SizedBox(
                          width: 150,
                          height: 25,
                          child: Text('Alterar Contato',
                            style: TextStyle(
                                fontFamily: 'Roboto',
                                fontSize: 20,
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFFF9B0D)
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 17),
                        child: SizedBox(
                          child: Icon(
                            Icons.phone,
                            color: Color(0xFFFF9B0D),
                            size: 30,
                          ),
                        ),
                      ),
                    ]),

              ),
              onTap: null,
            ),
            const SizedBox(height: 58,),
            GestureDetector(
              child: Container(
                  margin: EdgeInsets.only(left: 63, right: 40),
                  height: 67,
                  width: 257,
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
                   children: const [
                     Padding(
                       padding: EdgeInsets.only(left: 22),
                       child: SizedBox(
                         width: 122,
                         height: 25,
                         child: Text('Alterar Senha',
                          style: TextStyle(
                            fontFamily: 'Roboto',
                            fontSize: 20,
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFFF9B0D)
                          ),
                         ),
                       ),
                     ),
                     Padding(
                       padding: EdgeInsets.only(right: 17),
                       child: SizedBox(
                         child: Icon(
                           Icons.lock,
                           color: Color(0xFFFF9B0D),
                           size: 30,
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
    );
  }
}
