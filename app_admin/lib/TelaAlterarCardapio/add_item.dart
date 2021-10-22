import 'dart:io';
import 'dart:io' as io;
import 'package:app_admin/TelaAlterarCardapio/altcardapio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:path/path.dart';

class AddItem extends StatefulWidget {

  @override
  _AddItemState createState() => _AddItemState();
}

class _AddItemState extends State<AddItem> {
  late Future userFuture;

  TextEditingController _nome = TextEditingController();
  TextEditingController _details = TextEditingController();
  TextEditingController _ingredients = TextEditingController();
  var _price =  MoneyMaskedTextController(decimalSeparator: ',', thousandSeparator: ',');
  TextEditingController _tipo = TextEditingController();

  File? imageFile;

  final picker = ImagePicker();

  Future pickImage() async {
    final pickedFile = await picker.pickImage(
        source: ImageSource.gallery
    );
    setState(() {
      imageFile = File(pickedFile!.path);
    });
  }

  Future uploadImageToFirebase(BuildContext context) async {
    String fileName = basename(imageFile!.path);
    firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child('/$fileName');
    final metadata = firebase_storage.SettableMetadata(
        contentType: 'image/jpeg',
        customMetadata: {'picked-file-path': fileName});
    firebase_storage.UploadTask uploadTask;
    uploadTask = ref.putFile(io.File(imageFile!.path), metadata);
    Future.value(uploadTask).then((value) => {
      print("Upload file path ${value.ref.fullPath}")
    }).onError((error, stackTrace) => {
      print("Upload file path error ${error.toString()} ")
    });
  }

  Future<void> _showChoiceDialog(BuildContext context){
    return showDialog(context: context,
        builder: (BuildContext context){
            return AlertDialog(
              title: Text("Selecione uma opção!"),
              titleTextStyle: TextStyle(
                color: Color(0xFFFF9B0D),
                  fontFamily: 'Poppins',
                  fontSize: MediaQuery.of(context).size.width * 0.055,
                  fontWeight: FontWeight.w700
              ),
              content: SingleChildScrollView(
                child: ListBody(
                  children: [
                    GestureDetector(
                      child: Text("Galeria"),
                      onTap: (){
                        pickImage();
                      },
                    ),
                    SizedBox(height: 20,),
                    uploadImageButton(context),
                  ],
                ),
              ),
            );
    });
  }

  @override
  void initState(){
    super.initState();
    userFuture = getData();
  }


  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                                    padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.05, top: MediaQuery.of(context).size.height*0.05),
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => DesignAltCard())
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
                                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.2, top: MediaQuery.of(context).size.height*0.05),
                                  child: Text(
                                    'Cardápio',
                                    style: TextStyle(
                                        fontFamily:'Roboto',
                                        fontStyle: FontStyle.normal,
                                        fontWeight: FontWeight.w900,
                                        fontSize: 24,
                                        color: Colors.white
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.85, top: MediaQuery.of(context).size.height*0.05),
                              child: Column(
                                children: [
                                  IconButton(
                                    onPressed: () async{
                                      _tipo.text = _tipo.text.toLowerCase();
                                      if(_nome.text == "" || _ingredients.text == "" || _details.text == "" || _price.text == "" || _tipo.text == "" ||
                                              _tipo.text != "lanche" && _tipo.text != "bebida"
                                              && _tipo.text != "acompanhamento" && _tipo.text != "combo"
                                      ){
                                        showDialog(
                                          context: context,
                                          barrierDismissible: true,
                                          builder: (BuildContext context) => const AlertDialog(
                                            title: Text('Dados incompletos'),
                                            content: Text('Todos os campos devem ser preenchidos corretamente.'
                                                ' Caso contrário verifique se a imagem foi enviada ou se o tipo do produto existe.'),
                                          ),
                                        );
                                      }else{
                                        DocumentReference ref = FirebaseFirestore.instance.collection('PatoBurguer').doc('lanches');
                                        String fileName = basename(imageFile!.path);
                                        Reference refi = FirebaseStorage.instance.ref().child('/$fileName');
                                        String lnk =  await refi.getDownloadURL();
                                        ref.set({
                                          _nome.text: {
                                            "detalhes": _details.text,
                                            "nome": _nome.text,
                                            "preco": _price.text,
                                            "ingredientes": _ingredients.text,
                                            "tipo": _tipo.text,
                                            "imagem": lnk,
                                            "promo": false
                                          }},SetOptions(merge: true)).then((_){
                                          print("success!");
                                        });
                                        ref.update({
                                          'lunch': FieldValue.arrayUnion([_nome.text])
                                        });
                                        Navigator.of(context).push(
                                            MaterialPageRoute(builder: (context) => DesignAltCard(),
                                            ));
                                      }
                                    },
                                    icon: Icon(
                                      Icons.save,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Stack(
                                children: [
                                  Positioned(
                                    bottom: 0.0,
                                    child: Container(
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            border: Border.all(
                                              color: Colors.white,
                                            ),
                                            borderRadius: BorderRadius.only(
                                                topRight: Radius.circular(20.0),
                                                topLeft: Radius.circular(20.0)
                                            )
                                        ),
                                        height: (MediaQuery.of(context).size.height)/1.2,
                                        width: (MediaQuery.of(context).size.width),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsets.only(
                                                left: (MediaQuery.of(context).size.width)*0.06944,
                                                right: (MediaQuery.of(context).size.width)*0.06944,
                                                top: (MediaQuery.of(context).size.height)*0.0363,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Nome",
                                                      style: TextStyle(
                                                          color: Color(0xFF434343),
                                                          fontSize: (MediaQuery.of(context).size.height)*0.028125,
                                                          fontWeight: FontWeight.bold,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                  Container(
                                                    width: MediaQuery.of(context).size.width*0.85,
                                                    child: TextField(
                                                      maxLines: 1,
                                                      controller: _nome,
                                                      decoration: InputDecoration(
                                                        filled: true,
                                                        hintText: "Insira o nome do produto.",
                                                        hintStyle: TextStyle(
                                                          color: Color(0xFF898989),
                                                          fontSize: (MediaQuery.of(context).size.height)*0.025,
                                                          fontWeight: FontWeight.w900,
                                                          fontStyle: FontStyle.normal,
                                                        ),
                                                        fillColor: Colors.white,
                                                        border: OutlineInputBorder(),
                                                        contentPadding: EdgeInsets.only(left: 10),
                                                      ),
                                                      style: TextStyle(
                                                        color: Color(0xFF898989),
                                                        fontSize: (MediaQuery.of(context).size.height)*0.04,
                                                        fontWeight: FontWeight.w900,
                                                        fontStyle: FontStyle.normal,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: (MediaQuery.of(context).size.height)*0.0125,
                                                    left: (MediaQuery.of(context).size.width)*0.0694,
                                                  ),
                                                  child: Text(
                                                      "Detalhes",
                                                      style: TextStyle(
                                                          color: Color(0xFF434343),
                                                          fontSize: (MediaQuery.of(context).size.height)*0.028125,
                                                          fontWeight: FontWeight.w900,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: (MediaQuery.of(context).size.height)*0.0125,
                                                      left: (MediaQuery.of(context).size.width)*0.0694,
                                                      right: (MediaQuery.of(context).size.width)*0.0694
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        width: (MediaQuery.of(context).size.width)*0.85,
                                                        child: TextField(
                                                          maxLines: 3,
                                                          controller: _details,
                                                          decoration: InputDecoration(
                                                            hintText: "Insira os detalhes do produto.",
                                                            hintStyle: TextStyle(
                                                              color: Color(0xFF898989),
                                                              fontSize: (MediaQuery.of(context).size.height)*0.021875,
                                                              fontWeight: FontWeight.w900,
                                                              fontStyle: FontStyle.normal,
                                                            ),
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            contentPadding: EdgeInsets.only(left: 5, top: 5),
                                                            border: OutlineInputBorder(),
                                                          ),
                                                          style: TextStyle(
                                                              color: Color(0xFF434343),
                                                              fontSize: (MediaQuery.of(context).size.height)*0.021875,
                                                              fontWeight: FontWeight.w500,
                                                              fontStyle: FontStyle.normal
                                                          ),
                                                        ),

                                                      )

                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                    top: (MediaQuery.of(context).size.height)*0.0125,
                                                    left: (MediaQuery.of(context).size.width)*0.0694,
                                                  ),
                                                  child: Text(
                                                      "Ingredientes",
                                                      style: TextStyle(
                                                          color: Color(0xFF434343),
                                                          fontSize: (MediaQuery.of(context).size.height)*0.028125,
                                                          fontWeight: FontWeight.w900,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              children: [
                                                Padding(
                                                  padding: EdgeInsets.only(
                                                      top: (MediaQuery.of(context).size.height)*0.0125,
                                                      left: (MediaQuery.of(context).size.width)*0.0694,
                                                      right: (MediaQuery.of(context).size.width)*0.0694
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Container(
                                                        padding: EdgeInsets.only(
                                                          top: 1.0,
                                                          bottom: 1.0,
                                                        ),
                                                        width: (MediaQuery.of(context).size.width)*0.85,
                                                        child: TextField(
                                                            maxLines: 3,
                                                            controller: _ingredients,
                                                            decoration: InputDecoration(
                                                              hintText: "Insira os ingredientes do produto.",
                                                              hintStyle: TextStyle(
                                                                color: Color(0xFF898989),
                                                                fontSize: (MediaQuery.of(context).size.height)*0.021875,
                                                                fontWeight: FontWeight.w900,
                                                                fontStyle: FontStyle.normal,
                                                              ),
                                                              filled: true,
                                                              fillColor: Colors.white,
                                                              contentPadding: EdgeInsets.only(left: 5, top: 5),
                                                              border: OutlineInputBorder(),
                                                            ),
                                                            style: TextStyle(
                                                                color: Color(0xFF434343),
                                                                fontSize: (MediaQuery.of(context).size.height)*0.021875,
                                                                fontWeight: FontWeight.w500,
                                                                fontStyle: FontStyle.normal
                                                            )
                                                        ),

                                                      )],
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: (MediaQuery.of(context).size.height)*0.0125,
                                                left: (MediaQuery.of(context).size.width)*0.0694,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Tipo",
                                                      style: TextStyle(
                                                          color: Color(0xFF434343),
                                                          fontSize: (MediaQuery.of(context).size.height)*0.028125,
                                                          fontWeight: FontWeight.bold,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                  Container(
                                                      width: (MediaQuery.of(context).size.width)*0.85,
                                                      child: TextField(
                                                          maxLines: 2,
                                                          controller: _tipo,
                                                          decoration: InputDecoration(
                                                            hintText: "Tipos aceitaveis: lanche, combo, acompanhamento ou bebida.",
                                                            hintStyle: TextStyle(
                                                              color: Color(0xFF898989),
                                                              fontSize: (MediaQuery.of(context).size.height)*0.021875,
                                                              fontWeight: FontWeight.w900,
                                                              fontStyle: FontStyle.normal,
                                                            ),
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            contentPadding: EdgeInsets.only(left: 5, top: 5),
                                                            border: OutlineInputBorder(),
                                                          ),
                                                          style: TextStyle(
                                                              color: Color(0xFF898989),
                                                              fontSize: (MediaQuery.of(context).size.height)*0.02187,
                                                              fontWeight: FontWeight.w500,
                                                              fontStyle: FontStyle.normal
                                                          )
                                                      )
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height*0.01,),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: (MediaQuery.of(context).size.height)*0.0125,
                                                left: (MediaQuery.of(context).size.width)*0.0694,
                                              ),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      "Preço",
                                                      style: TextStyle(
                                                          color: Color(0xFF434343),
                                                          fontSize: (MediaQuery.of(context).size.height)*0.028125,
                                                          fontWeight: FontWeight.bold,
                                                          fontStyle: FontStyle.normal
                                                      )
                                                  ),
                                                  Container(
                                                      width: (MediaQuery.of(context).size.width)*0.85,
                                                      child: TextField(
                                                          maxLines: 1,
                                                          keyboardType: TextInputType.number,
                                                          controller: _price,
                                                          decoration: InputDecoration(
                                                            hintText: "0,00 ou 0,00",
                                                            hintStyle: TextStyle(
                                                              color: Color(0xFF898989),
                                                              fontSize: (MediaQuery.of(context).size.height)*0.03,
                                                              fontWeight: FontWeight.w900,
                                                              fontStyle: FontStyle.normal,
                                                            ),
                                                            prefixIcon: Padding(
                                                              padding: EdgeInsets.only(left: 12,right: 12,top: 12,bottom: 12),
                                                              child: Text('R\$',
                                                                style: TextStyle(
                                                                  fontSize: (MediaQuery.of(context).size.height)*0.023,
                                                                  fontFamily: 'Roboto',
                                                                  color: Color(0xFFFF9B0D),
                                                                  fontWeight: FontWeight.bold,
                                                                ),),),
                                                            filled: true,
                                                            fillColor: Colors.white,
                                                            contentPadding: EdgeInsets.only(top: 0),
                                                            border: OutlineInputBorder(),
                                                          ),
                                                          style: TextStyle(
                                                              color: Color(0xFF898989),
                                                              fontSize: (MediaQuery.of(context).size.height)*0.04,
                                                              fontWeight: FontWeight.w900,
                                                              fontStyle: FontStyle.normal
                                                          )
                                                      )
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: MediaQuery.of(context).size.height*0.03,),
                                            Padding(
                                              padding: EdgeInsets.only(
                                                top: (MediaQuery.of(context).size.height)*0.0125,
                                                left: (MediaQuery.of(context).size.width)*0.094,
                                              ),
                                              child: Container(
                                                height: MediaQuery.of(context).size.height * 0.069,
                                                width: MediaQuery.of(context).size.width * 0.8,
                                                child: ElevatedButton(
                                                  onPressed: () async{
                                                      _showChoiceDialog(context);
                                                  },
                                                  child: Text(
                                                    'Enviar imagem',
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
                                            ),


                                          ],
                                        )
                                    ),
                                  ),
                                ]
                            ),
                          ],
                        ),
                      ),
                    );
                  default:
                    return Text('default');

                }})
      ),
    );
  }

  Widget uploadImageButton(BuildContext context) {
    return ElevatedButton(
      onPressed: (){
        uploadImageToFirebase(context);
        Navigator.of(context).pop();
      },
      child: Text(
        'Upload Image',
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

