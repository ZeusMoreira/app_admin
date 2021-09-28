import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import '../authentication_service.dart';
import '../home_page.dart';

class LoginCentralizado extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 309,
        height: 340,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
        ),
        child: Column(children: [
          Padding(
              padding: const EdgeInsets.only(left: 27, right: 220.0, top: 49, bottom: 0),
              child: Container(
                width: 62,
                height: 24,
                child: const Text(
                  'Login',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'Roboto',
                    fontWeight: FontWeight.w700,
                    fontStyle: FontStyle.normal,
                  ),
                ),
              )
          ),

          SizedBox(height: 21.44),
          Padding(
            padding: const EdgeInsets.only(left: 19.9, right: 28.0),
            child: Container(
              height: 41.89,
              width: 261.1,
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

          const SizedBox(
            height: 18.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 19.9, right: 28.0),
            child: Container(
              height: 41.89,
              width: 261.1,
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
          const SizedBox(height: 14.67),
          Padding(
            padding: const EdgeInsets.only(left: 158, right: 31),
            child: Container(
              alignment: Alignment.topRight,
              child: GestureDetector(
                  child: const Text(
                    "Esqueceu a senha?",
                    softWrap: false,
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontSize: 13,
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
          const SizedBox(
            height: 18,
          ),
          Container(
            width: 264,
            height: 54,
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
              child: const Text(
                'Entrar',
                style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
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
