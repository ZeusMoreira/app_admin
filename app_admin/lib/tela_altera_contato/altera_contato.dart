import 'package:app_admin/services/firestore_service.dart';
import 'package:app_admin/tela_login_senha/senha/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:app_admin/model/config.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class TelaContato extends StatefulWidget  {

  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  late Future userFuture;

  @override
  void initState(){
    super.initState();
    userFuture = getData();
  }

  TextEditingController _newEndereco = TextEditingController();
  TextEditingController _hr1 = TextEditingController();
  TextEditingController _hr2 = TextEditingController();
  TextEditingController _hr3 = TextEditingController();
  TextEditingController _whats = TextEditingController();
  TextEditingController _face = TextEditingController();
  TextEditingController _insta = TextEditingController();


  List<bool> _isEnabled = [false,false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                return Container(
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
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.12, top: MediaQuery.of(context).size.height*0.05),
                                  child: Text(
                                    'Alterar Contato',
                                    style: TextStyle(
                                        fontFamily:'Roboto',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 24,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.15, top: MediaQuery.of(context).size.height*0.05),
                                  child: IconButton(
                                    onPressed: (){
                                      _newEndereco.text = snapshot.data['localizacao']['endereco'];
                                      _hr1.text = snapshot.data['horario']['segSexta'];
                                      _hr2.text = snapshot.data['horario']['sabado'];
                                      _hr3.text = snapshot.data['horario']['domFer'];
                                      _whats.text = snapshot.data['whats'];
                                      _face.text = snapshot.data['redeSoc']['face'];
                                      _insta.text = snapshot.data['redeSoc']['insta'];
                                    },
                                    icon: Icon(
                                      Icons.restore,
                                      color: Colors.white,
                                    ),
                                  )
                                ),
                              ],
                            ),

                            Stack(
                                children: [
                                  Positioned(
                                    bottom: 0.0,
                                    child: Container(
                                      height: (MediaQuery.of(context).size.height)/1.2,
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.white,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                              topRight: Radius.circular(15.0),
                                              topLeft: Radius.circular(15.0)
                                          )
                                      ),

                                      child: Column(
                                        children: [
                                          Column(
                                              children:[
                                                Padding(
                                                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.67, top: MediaQuery.of(context).size.height*0.01),
                                                  child: const Text(
                                                    'Endereço:',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w900,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: 'Roboto',
                                                        color: Color(0xFFFF9B0D)
                                                    ),
                                                  ),
                                                ),

                                                SizedBox(height: MediaQuery.of(context).size.height*0.01),

                                                Padding(
                                                    padding: const EdgeInsets.only(left: 25,right: 25),
                                                    child: Center(
                                                      child: Row(
                                                          children: [
                                                            Container(
                                                              width: MediaQuery.of(context).size.width*0.71,
                                                              child: TextFormField(
                                                                controller: _newEndereco,
                                                                maxLines: 2,
                                                                enabled: _isEnabled[0],
                                                                style: TextStyle(color: Color(0xFFFFB54B)),
                                                                textInputAction: TextInputAction.newline,
                                                                decoration: const InputDecoration(
                                                                  isDense: true,
                                                                  hintText: "Para saber os dados atuais, basta apertar o botão recarregar...",
                                                                  hintStyle: TextStyle(color: Color(0xFFFFB54B)),
                                                                  contentPadding: EdgeInsets.only(top: 12, left: 12, right: 12),
                                                                  border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                                ),
                                                              ),
                                                            ),

                                                            IconButton(
                                                              icon: Icon(
                                                                Icons.drive_file_rename_outline,
                                                                color: Color(0xFFFF9B0D),
                                                              ),
                                                              onPressed: () {
                                                                setState(() {
                                                                  _isEnabled[0] = true;
                                                                });
                                                              },
                                                            ),
                                                          ]
                                                      ),
                                                    )
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                Divider(
                                                  color: Color(0xFFC4C4C4),
                                                  thickness: 2,
                                                ),

                                                Padding(
                                                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.29),
                                                  child: const Text(
                                                    'Horários de Funcionamento:',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w900,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: 'Roboto',
                                                        color: Color(0xFFFF9B0D)
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                                Padding(
                                                    padding: const EdgeInsets.only(left: 25,right: 35),
                                                    child: Row(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(context).size.width*0.71,
                                                            child: TextFormField(
                                                              controller: _hr1,
                                                              style: TextStyle(color: Color(0xFFFFB54B)),
                                                              maxLines: 1,
                                                              enabled: _isEnabled[1],
                                                              textInputAction: TextInputAction.newline,
                                                              decoration: const InputDecoration(
                                                                isDense: true,
                                                                hintText: "Para saber os dados atuais, basta apertar o botão recarregar...",
                                                                hintStyle: TextStyle(color: Color(0xFFFFB54B)),
                                                                contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.drive_file_rename_outline,
                                                              color: Color(0xFFFF9B0D),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                _isEnabled[1] = true;
                                                              });
                                                            },
                                                          ),
                                                        ]
                                                    )
                                                ),

                                                Padding(
                                                    padding: const EdgeInsets.only(left: 25,right: 35),
                                                    child: Row(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(context).size.width*0.71,
                                                            child: TextFormField(
                                                              controller: _hr2,
                                                              style: TextStyle(color: Color(0xFFFFB54B)),
                                                              maxLines: 1,
                                                              enabled: _isEnabled[2],
                                                              textInputAction: TextInputAction.newline,
                                                              decoration:  InputDecoration(
                                                                isDense: true,
                                                                hintText: "Para saber os dados atuais, basta apertar o botão recarregar...",
                                                                hintStyle: TextStyle(color: Color(0xFFFFB54B)),
                                                                contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                                                border: OutlineInputBorder(borderRadius: BorderRadius.all(
                                                                    Radius.circular(5))),
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.drive_file_rename_outline,
                                                              color: Color(0xFFFF9B0D),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                _isEnabled[2] = true;
                                                              });
                                                            },
                                                          ),
                                                        ]
                                                    )
                                                ),
                                                Padding(
                                                    padding: const EdgeInsets.only(left: 25,right: 35),
                                                    child: Row(
                                                        children: [
                                                          Container(
                                                            width: MediaQuery.of(context).size.width*0.71,
                                                            child: TextFormField(
                                                              controller: _hr3,
                                                              style: TextStyle(color: Color(0xFFFFB54B)),
                                                              maxLines: 1,
                                                              enabled: _isEnabled[3],
                                                              textInputAction: TextInputAction.newline,
                                                              decoration: const InputDecoration(
                                                                isDense: true,
                                                                hintText: "Para saber os dados atuais, basta apertar o botão recarregar...",
                                                                hintStyle: TextStyle(color: Color(0xFFFFB54B)),
                                                                contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                                                border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                              ),
                                                            ),
                                                          ),
                                                          IconButton(
                                                            icon: Icon(
                                                              Icons.drive_file_rename_outline,
                                                              color: Color(0xFFFF9B0D),
                                                            ),
                                                            onPressed: () {
                                                              setState(() {
                                                                _isEnabled[3] = true;
                                                              });
                                                            },
                                                          ),
                                                        ]
                                                    )
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                Divider(
                                                  color: Color(0xFFC4C4C4),
                                                  thickness: 2,
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height*0.01,),

                                                Padding(
                                                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.43),
                                                  child: const Text(
                                                    'Faça seu pedido em:',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w900,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: 'Roboto',
                                                        color: Color(0xFFFF9B0D)
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 25.0,
                                                      ),
                                                      Icon(
                                                        MdiIcons.whatsapp,
                                                        color: Color(0xFFFFB54B),
                                                        size: 32,
                                                      ),
                                                      Container(
                                                        width: 3.0,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(context).size.width*0.5,
                                                        child: TextFormField(
                                                          controller: _whats,
                                                          style: TextStyle(color: Color(0xFFFFB54B)),
                                                          maxLines: 1,
                                                          enabled: _isEnabled[4],
                                                          textInputAction: TextInputAction.newline,
                                                          decoration: const InputDecoration(
                                                            isDense: true,
                                                            hintText: "Para saber os dados atuais, basta apertar o botão recarregar...",
                                                            hintStyle: TextStyle(color: Color(0xFFFFB54B)),
                                                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                          ),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.drive_file_rename_outline,
                                                          color: Color(0xFFFF9B0D),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            _isEnabled[4] = true;
                                                          });
                                                        },
                                                      ),
                                                    ]),
                                                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                Padding(
                                                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width*0.55),
                                                  child: const Text(
                                                    'Redes Sociais:',
                                                    style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: FontWeight.w900,
                                                        fontStyle: FontStyle.normal,
                                                        fontFamily: 'Roboto',
                                                        color: Color(0xFFFF9B0D)
                                                    ),
                                                  ),
                                                ),
                                                SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 25.0,
                                                      ),
                                                      Icon(
                                                        MdiIcons.facebook,
                                                        color: Color(0xFFFFB54B),
                                                        size: 32,
                                                      ),
                                                      Container(
                                                        width: 3.0,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(context).size.width*0.5,
                                                        child: TextFormField(
                                                          controller: _face,
                                                          style: TextStyle(color: Color(0xFFFFB54B)),
                                                          maxLines: 1,
                                                          enabled: _isEnabled[5],
                                                          textInputAction: TextInputAction.newline,
                                                          decoration: const InputDecoration(
                                                            isDense: true,
                                                            hintText: "Para saber os dados atuais, basta apertar o botão recarregar...",
                                                            hintStyle: TextStyle(color: Color(0xFFFFB54B)),
                                                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                          ),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.drive_file_rename_outline,
                                                          color: Color(0xFFFF9B0D),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            _isEnabled[5] = true;
                                                          });
                                                        },
                                                      ),
                                                    ]),
                                                Row(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        width: 25.0,
                                                      ),
                                                      Icon(
                                                        MdiIcons.instagram,
                                                        color: Color(0xFFFFB54B),
                                                        size: 32,
                                                      ),
                                                      Container(
                                                        width: 3.0,
                                                      ),
                                                      Container(
                                                        width: MediaQuery.of(context).size.width*0.5,
                                                        child: TextFormField(
                                                          controller: _insta,
                                                          style: TextStyle(color: Color(0xFFFFB54B)),
                                                          maxLines: 1,
                                                          enabled: _isEnabled[6],
                                                          textInputAction: TextInputAction.newline,
                                                          decoration: const InputDecoration(
                                                            isDense: true,
                                                            hintText: "Para saber os dados atuais, basta apertar o botão recarregar...",
                                                            hintStyle: TextStyle(color: Color(0xFFFFB54B)),
                                                            contentPadding: EdgeInsets.symmetric(vertical: 8,horizontal: 12),
                                                            border: OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(5))),
                                                          ),
                                                        ),
                                                      ),
                                                      IconButton(
                                                        icon: Icon(
                                                          Icons.drive_file_rename_outline,
                                                          color: Color(0xFFFF9B0D),
                                                        ),
                                                        onPressed: () {
                                                          setState(() {
                                                            _isEnabled[6] = true;
                                                          });
                                                        },
                                                      ),
                                                    ]),
                                                SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                                Container(
                                                  height: MediaQuery.of(context).size.height * 0.069,
                                                  width: MediaQuery.of(context).size.width * 0.8,
                                                  child: ElevatedButton(
                                                    onPressed: () async{
                                                      if(_newEndereco.text == "" || _hr1.text == "" ||
                                                          _hr2.text == "" || _hr3.text == "" || _face.text == "" || _insta.text == "" || _whats.text == ""){
                                                        showDialog(
                                                          context: context,
                                                          barrierDismissible: true,
                                                          builder: (BuildContext context) => const AlertDialog(
                                                            title: Text('Dados incompletos'),
                                                            content: Text('Você está no modo edição total.\nPara alterar dados avulsos, aperte o botão recarregar e edite o que for necessário.'),
                                                          ),
                                                        );
                                                      }else {
                                                        Local local = Local(
                                                            endereco: _newEndereco
                                                                .text);
                                                        Horario horarios = Horario(
                                                            segSexta: _hr1.text,
                                                            sabado: _hr2.text,
                                                            domFer: _hr3.text);
                                                        RedeSoc redeSoc = RedeSoc(
                                                            face: _face.text,
                                                            insta: _insta.text);

                                                        Config config = Config(
                                                            hra: horarios,
                                                            localizacao: local,
                                                            whats: _whats.text,
                                                            redeSoc: redeSoc);

                                                        try {
                                                          await FirestoreService()
                                                              .setConfig(
                                                              config);
                                                        } catch (e) {
                                                          print(e);
                                                        }
                                                      }

                                                    },
                                                    child: Text(
                                                      'Salvar',
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
                                                                borderRadius: BorderRadius.circular(8)))),
                                                  ),
                                                ),


                                              ]),
                                        ],
                                      ),
                                    ),
                                  )
                                ]),
                          ])
                  );

              default:
                return Text('default');

            }
          }),
        )
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