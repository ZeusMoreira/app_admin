import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../senha/authentication_service.dart';
import '../../main_home/home_page.dart';


class LoginCentralizado extends StatefulWidget {
  const LoginCentralizado({Key? key}) : super(key: key);

  @override
  _LoginCentralizadoState createState() => _LoginCentralizadoState();
}

class _LoginCentralizadoState extends State<LoginCentralizado> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.85,
        height: MediaQuery.of(context).size.width * 0.9,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.5, top: MediaQuery.of(context).size.height * 0.08),
              child: Container(
                width: MediaQuery.of(context).size.width * 0.18,
                height: MediaQuery.of(context).size.height * 0.05,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.048,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),

          SizedBox(height: MediaQuery.of(context).size.height * 0.025),
          Padding(
            padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03, ),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.058,
              width: MediaQuery.of(context).size.width * 0.66,
              child: TextField(
                  controller: emailController,
                  keyboardType: TextInputType.text,
                  decoration: const InputDecoration(
                    labelText: 'Usuário',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                  )),
            ),
          ),

          SizedBox(
            height:MediaQuery.of(context).size.height * 0.025,
          ),
          Padding(
            padding:EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.03,),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.058,
              width: MediaQuery.of(context).size.width * 0.66,
              child: TextField(
                  controller: passwordController,
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: const InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(7))),
                  )),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.02,),
          Padding(
            padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.4, right: MediaQuery.of(context).size.width * 0.1,),
            child: Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  child: Text(
                    "Esqueceu a senha?",
                    softWrap: false,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize:  MediaQuery.of(context).size.width * 0.035,
                      fontWeight: FontWeight.w900,
                      fontFamily: 'Roboto',
                      color: Color(0xFF434343),
                      fontStyle: FontStyle.normal),
                  ),
                  onTap: () {
                    context.read<AuthenticationService>().ResetPassword();
                    showDialog(
                        context: context,
                        barrierDismissible: true,
                      builder: (BuildContext context) => const AlertDialog(
                          title: Text('Alteração de senha'),
                          content: Text('Verifique o email para a mudança de senha.'),
                        ),
                    );
                  }
                  ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.035,
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.069,
            width: MediaQuery.of(context).size.width * 0.6,
            child: ElevatedButton(
              onPressed: () async{
                if(emailController.text == 'pato.burguer.mob4@gmail.com') {
                   dynamic result = await context.read<AuthenticationService>().SignIn(
                      email: emailController.text.trim(),
                      password: passwordController.text.trim(),
                   );

                  if (result == null){
                      showDialog(
                           context: context,
                           barrierDismissible: true,
                           builder: (BuildContext context) => const AlertDialog(
                             title: Text('Dados inválidos'),
                             content: Text('Verifique a senha e tente novamente.'),
                           ),
                      );
                  }else{
                    Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage())
                      );
                  }
                }

                else{
                  showDialog(
                    context: context,
                    barrierDismissible: true,
                    builder: (BuildContext context) => const AlertDialog(
                      title: Text('Dados inválidos'),
                      content: Text('Verifique o email e tente novamente.'),
                    ),
                  );
                }

              },
              child: Text(
                'Entrar',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    color: Colors.white,
                    fontWeight: FontWeight.w700),
              ),
              style: ButtonStyle(
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Color(0xFFFF9B0D)),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)))),
            ),
          ),
        ]),
      ),
    );
  }
}
