import 'package:app_admin/tela_login_senha/senha/home_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/src/provider.dart';
import 'authentication_service.dart';
import '../login/login_page.dart';



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
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, top: MediaQuery.of(context).size.height*0.05),
                child: IconButton(
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => HomePage())
                      );
                    },
                    icon:  Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: MediaQuery.of(context).size.height*0.04,

                    ),
                  )
              ),
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.12, top: MediaQuery.of(context).size.height*0.05),
                child: Text(
                    'Alterar Senha',
                    style: TextStyle(
                        fontFamily:'Roboto',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w900,
                        fontSize: MediaQuery.of(context).size.height*0.035,
                        color: Colors.white
                    ),
                  ),

              ),

            ],
          ),

              SizedBox(height: MediaQuery.of(context).size.height*0.08,),
          Container(
            height: (MediaQuery.of(context).size.height)/2,
            width: MediaQuery.of(context).size.width*0.9,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.white,
            ),

            child: Column(
              children: [
                Padding(
                    padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.49, top:MediaQuery.of(context).size.height*0.07 ),
                    child: Container(
                      width: MediaQuery.of(context).size.width*0.25,
                      height: MediaQuery.of(context).size.height*0.025,
                      child: Text(
                        'Senha atual',
                        softWrap: false,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.height*0.025,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.w900,
                          fontStyle: FontStyle.normal,
                          color: Color(0xFFFFB54B),
                        ),
                      ),
                    ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01,),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.04,
                    width: MediaQuery.of(context).size.width*0.73,
                    child: TextFormField(
                      controller: _passwordController,
                      obscureText: !_passwordVisible,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                          suffixIcon: IconButton(
                            icon: Icon(_passwordVisible ? Icons.visibility: Icons.visibility_off,
                              color: Color(0xFFFF9B0D),
                              size: MediaQuery.of(context).size.height*0.025,
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
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.49,),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.25,
                    height: MediaQuery.of(context).size.height*0.025,
                    child: Text(
                      'Nova senha',
                      softWrap: false,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height*0.025,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFB54B),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01,),
                  child: Container(
                     height: MediaQuery.of(context).size.height*0.04,
                     width: MediaQuery.of(context).size.width*0.73,
                     child: TextFormField(
                        controller: _newPasswordController,
                        obscureText: !_newPasswordVisible,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                          suffixIcon: IconButton(
                            icon: Icon(_newPasswordVisible ? Icons.visibility: Icons.visibility_off,
                              color: Color(0xFFFF9B0D),
                              size: MediaQuery.of(context).size.height*0.025,
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

                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.39),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.35,
                    height: MediaQuery.of(context).size.height*0.025,
                    child: Text(
                      'Confirmar senha',
                      softWrap: false,
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.025,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w900,
                        fontStyle: FontStyle.normal,
                        color: Color(0xFFFFB54B),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.01,),
                  child: Container(
                    height: MediaQuery.of(context).size.height*0.04,
                    width: MediaQuery.of(context).size.width*0.73,
                      child: TextFormField(
                        controller: _repeatPasswordController,
                        obscureText: !_confirmPasswordVisible,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(7))),
                          suffixIcon: IconButton(
                            icon: Icon(_confirmPasswordVisible ? Icons.visibility: Icons.visibility_off,
                              color: Color(0xFFFF9B0D),
                              size: MediaQuery.of(context).size.height*0.025,
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

                SizedBox(height: MediaQuery.of(context).size.height*0.08,),
                Padding(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.02),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.6,
                    height: MediaQuery.of(context).size.height*0.055,
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

                      child: Text(
                        'Salvar',
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
                    ),
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
