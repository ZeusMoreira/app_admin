import 'package:app_admin/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'authentication_service.dart';
import 'login/login_page.dart';



class AlteraSenha extends StatefulWidget {
  const AlteraSenha({Key? key}) : super(key: key);

  @override
  _AlteraSenhaState createState() => _AlteraSenhaState();
}

class _AlteraSenhaState extends State<AlteraSenha> {

  final TextEditingController _passwordController = TextEditingController();
  TextEditingController _newPasswordController = TextEditingController();
  TextEditingController _repeatPasswordController = TextEditingController();

  bool _passwordVisible = false;
  bool _newPasswordVisible = false;
  bool _confirmPasswordVisible = false;

  @override
  void initState() {
    _passwordVisible = false;
    _newPasswordVisible = false;
    _confirmPasswordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Color(0xFFFF9B0D),
        body:
          Column(
            children: [
            Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 15, top: 39),
                child: SizedBox(
                  width: 16,
                  height: 22,
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage())
                      );
                    },
                    icon: const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 28,

                    ),
                  )
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 90,top: 62),
                child: SizedBox(
                  width: 171,
                  height: 27,
                  child: Text(
                    'Alterar Senha',
                    style: TextStyle(
                        fontFamily:'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                        fontSize: 24,
                        color: Colors.white
                    ),
                  ),
                ),
              ),

            ],
          ),

          SizedBox(height: 80,),

          Container(
            width: 318,
            height: 340,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),

            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 27, right: 190.0, top: 49, bottom: 0),
                    child: Container(
                      width: 200,
                      height: 19,
                      child: const Text(
                        'Senha atual',
                        softWrap: false,
                        style: TextStyle(
                          fontSize: 18,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFFFFB54B),
                        ),
                      ),
                    ),
                ),

                SizedBox(height: 6),

                Padding(
                  padding: const EdgeInsets.only(left: 27.0, right: 27.0),
                  child: Container(
                    height: 28.89,
                    width: 270.1,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible ? Icons.visibility: Icons.visibility_off,
                              color: Color(0xFFFF9B0D),
                              size: 18,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                        ),
                    ),
                  ),
                ),
                SizedBox(height: 6,),

                Padding(
                  padding: const EdgeInsets.only(left: 27, right: 190.0),
                  child: Container(
                    width: 200,
                    height: 19,
                    child: const Text(
                      'Nova senha',
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFB54B),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6,),

                Padding(
                  padding: const EdgeInsets.only(left: 27.0, right: 27.0),
                  child: Container(
                      height: 28.89,
                      width: 270.1,
                      child: TextFormField(
                        controller: _newPasswordController,
                        obscureText: !_newPasswordVisible,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                          suffixIcon: IconButton(
                            icon: Icon(_newPasswordVisible ? Icons.visibility: Icons.visibility_off,
                              color: Color(0xFFFF9B0D),
                              size: 18,
                            ),
                            onPressed: () {
                              setState(() {
                                _newPasswordVisible = !_newPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),

                  ),
                ),

                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.only(left: 27, right: 150.0),
                  child: Container(
                    width: 200,
                    height: 19,
                    child: const Text(
                      'Confirmar senha',
                      softWrap: false,
                      style: TextStyle(
                        fontSize: 18,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFB54B),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 6,),
                Padding(
                  padding: const EdgeInsets.only(left: 27.0, right: 27.0),
                  child: Container(
                      height: 28.89,
                      width: 270.1,
                      child: TextFormField(
                        controller: _repeatPasswordController,
                        obscureText: !_confirmPasswordVisible,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                          suffixIcon: IconButton(
                            icon: Icon(_confirmPasswordVisible ? Icons.visibility: Icons.visibility_off,
                              color: Color(0xFFFF9B0D),
                              size: 18,
                            ),
                            onPressed: () {
                              setState(() {
                                _confirmPasswordVisible = !_confirmPasswordVisible;
                              });
                            },
                          ),
                        ),
                      ),

                  ),
                ),

                SizedBox(height: 50),
                Container(
                  width: 245,
                  height: 39,
                  child: ElevatedButton(
                    onPressed: () async {
                      if((_newPasswordController.text ==  _repeatPasswordController.text) && (_newPasswordController.text.length >= 6)) {
                        dynamic result = await context.read<AuthenticationService>().ChangePassword(newPassword:  _newPasswordController.text, password: _passwordController.text);
                        if(result == null){
                          showDialog(
                            context: context,
                            barrierDismissible: true,
                            builder: (BuildContext context) => const AlertDialog(
                              title: Text('Dados inválidos'),
                              content: Text('Senha incorreta.'),
                            ),
                          );
                        }
                        else{
                          context.read<AuthenticationService>().signOut();
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => LoginPage())
                          );
                        }
                      }

                      else{
                        showDialog(
                          context: context,
                          barrierDismissible: true,
                          builder: (BuildContext context) => const AlertDialog(
                            title: Text('Dados inválidos'),
                            content: Text('As novas senhas não coincidem ou não possuem mais de seis dígitos.'),
                          ),
                        );
                      }

                    },

                    child: const Text(
                      'Salvar',
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
                                borderRadius: BorderRadius.circular(7)))),
                  ),
                ),

              ],

            ),
          ),

          ]),
        ),
    );
  }
}
