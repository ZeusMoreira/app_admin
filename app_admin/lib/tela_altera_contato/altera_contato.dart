import 'package:app_admin/main_home/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';


class TelaContato extends StatefulWidget  {
  late final String endereco;
  late final String segSext;
  late final String sab;
  late final String domFer;
  late final String whats;
  late final String fac;
  late final String inst;
  TelaContato(this.endereco,this.segSext,this.sab,this.domFer,this.whats,this.fac,this.inst);

  @override
  _TelaContatoState createState() => _TelaContatoState();
}

class _TelaContatoState extends State<TelaContato> {
  late Future userFuture;

  TextEditingController _newEndereco = TextEditingController();
  TextEditingController _hr1 = TextEditingController();
  TextEditingController _hr2 = TextEditingController();
  TextEditingController _hr3 = TextEditingController();
  TextEditingController _whats = TextEditingController();
  TextEditingController _face = TextEditingController();
  TextEditingController _insta = TextEditingController();


  @override
  void initState(){
    super.initState();
    _newEndereco = TextEditingController(text: widget.endereco);
    _hr1 = TextEditingController(text: widget.domFer);
    _hr2 = TextEditingController(text: widget.sab);
    _hr3 = TextEditingController(text: widget.segSext);
    _whats = TextEditingController(text: widget.whats);
    _face = TextEditingController(text: widget.fac);
    _insta = TextEditingController(text: widget.inst);
    userFuture = getData();
  }


  List<bool> _isEnabled = [false,false,false,false,false,false,false];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        resizeToAvoidBottomInset: true,
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
                        child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Padding(
                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.06, top: MediaQuery.of(context).size.height*0.05),
                                      child: IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(builder: (context) => HomePage())
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
                                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.12, top: MediaQuery.of(context).size.height*0.05),
                                    child: Text(
                                      'Alterar Contato',
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

                                        child: SingleChildScrollView(
                                          child: Column(
                                            children: [
                                              Column(
                                                  children:[
                                                    Padding(
                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07, top: MediaQuery.of(context).size.height*0.01),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Endereço:',
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(context).size.height*0.026,
                                                                  fontWeight: FontWeight.w900,
                                                                  fontStyle: FontStyle.normal,
                                                                  fontFamily: 'Roboto',
                                                                  color: Color(0xFFFF9B0D)
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(height: MediaQuery.of(context).size.height*0.01),

                                                    Padding(
                                                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07),
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

                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                    Divider(
                                                      color: Color(0xFFC4C4C4),
                                                      thickness: 2,
                                                    ),

                                                    Padding(
                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Horários de Funcionamento:',
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(context).size.height*0.026,
                                                                  fontWeight: FontWeight.w900,
                                                                  fontStyle: FontStyle.normal,
                                                                  fontFamily: 'Roboto',
                                                                  color: Color(0xFFFF9B0D)
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height*0.01),
                                                    Padding(
                                                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07),
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
                                                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07),
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
                                                        padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07),
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
                                                    Padding(
                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                             Text(
                                                              'Faça seu pedido em:',
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(context).size.height*0.026,
                                                                  fontWeight: FontWeight.w900,
                                                                  fontStyle: FontStyle.normal,
                                                                  fontFamily: 'Roboto',
                                                                  color: Color(0xFFFF9B0D)
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),

                                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                    Padding(
                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07),
                                                      child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
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
                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                    Padding(
                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07, top: MediaQuery.of(context).size.height*0.01),
                                                      child: Center(
                                                        child: Row(
                                                          children: [
                                                            Text(
                                                              'Redes sociais:',
                                                              style: TextStyle(
                                                                  fontSize: MediaQuery.of(context).size.height*0.026,
                                                                  fontWeight: FontWeight.w900,
                                                                  fontStyle: FontStyle.normal,
                                                                  fontFamily: 'Roboto',
                                                                  color: Color(0xFFFF9B0D)
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                                    Padding(
                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07),
                                                      child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
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
                                                    ),
                                                    Padding(
                                                      padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.07,),
                                                      child: Row(
                                                          crossAxisAlignment: CrossAxisAlignment.start,
                                                          mainAxisAlignment: MainAxisAlignment.start,
                                                          children: [
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
                                                    ),
                                                    SizedBox(height: MediaQuery.of(context).size.height*0.025,),
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
                                                                content: Text('Todos os campos devem estar preenchidos.'),
                                                              ),
                                                            );
                                                          }else {
                                                            DocumentReference ref = FirebaseFirestore.instance.collection('PatoBurguer').doc('config');
                                                            ref.update({
                                                              'localizacao.endereco': _newEndereco.text,
                                                              'horario.segSexta': _hr1.text,
                                                              'horario.sabado': _hr2.text,
                                                              'horario.domFer': _hr3.text,
                                                              'redeSoc.face': _face.text,
                                                              'redeSoc.insta': _insta.text,
                                                              'whats': _whats.text,
                                                            });
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(builder: (context) => HomePage())
                                                            );
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
                                      ),
                                    )
                                  ]),
                            ])
                    ),
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