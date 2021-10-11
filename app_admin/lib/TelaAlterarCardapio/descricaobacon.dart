import 'package:app_admin/TelaAlterarCardapio/altcardapio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Background extends StatefulWidget {
  late final String id;
  Background(this.id);

  @override
  _BackgroundState createState() => _BackgroundState();
}

class _BackgroundState extends State<Background> {
  late Future userFuture;

  @override
  void initState(){
    super.initState();
    userFuture = getData();
  }

  TextEditingController _nome = TextEditingController();
  TextEditingController _details = TextEditingController();
  TextEditingController _ingredients = TextEditingController();
  TextEditingController _price = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
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
                  padding: EdgeInsets.only(left: MediaQuery.of(context).size.width*0.88, top: MediaQuery.of(context).size.height*0.05),
                  child: Column(
                    children: [
                      IconButton(
                        onPressed: (){
                          // TODO: CRIAR O POP-UP Personalizado para exclusão do item, NÃO PRECISA TER A FUNÇÃO DE DELETAR QUANDO EU CHEGAR DE VIAJEM EU FAÇO
                          // FOCA NO DESIGN
                        },
                        icon: Icon(
                          Icons.delete_forever_sharp,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: (){
                          _nome.text = snapshot.data[widget.id]['nome'];
                          _details.text = snapshot.data[widget.id]['detalhes'];
                          _ingredients.text = snapshot.data[widget.id]['ingredientes'];
                          _price.text = snapshot.data[widget.id]['preco'];
                        },
                        icon: Icon(
                          Icons.restore,
                          color: Colors.white,
                        ),
                      ),
                      IconButton(
                        onPressed: () async{
                           if(_nome.text == "" || _ingredients.text == "" || _details.text == "" || _price.text == ""){
                             showDialog(
                               context: context,
                               barrierDismissible: true,
                               builder: (BuildContext context) => const AlertDialog(
                                 title: Text('Dados incompletos'),
                                 content: Text('Você está no modo edição total.\nPara alterar dados avulsos, aperte o botão recarregar e edite o que for necessário.'),
                               ),
                             );
                           }else{
                             DocumentReference ref = FirebaseFirestore.instance.collection('PatoBurguer').doc('lanches');
                            ref.update({
                              widget.id+'.nome': _nome.text,
                              widget.id+'.detalhes': _details.text,
                              widget.id+'.ingredientes': _ingredients.text,
                              widget.id+'.preco': _price.text
                            });
                           }
                        },
                        icon: Icon(
                          Icons.save,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  )
              ),
              Stack(
                  children: [
                    Positioned(
                      bottom: 0.0,
                      child: Container(
                          decoration: BoxDecoration(
                              color: Color(0xFFF3F3F3),
                              border: Border.all(
                                color: Colors.white,
                              ),
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(20.0),
                                  topLeft: Radius.circular(20.0)
                              )
                          ),
                          height: (MediaQuery.of(context).size.height)/1.7,
                          width: (MediaQuery.of(context).size.width),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(
                                  left: (MediaQuery.of(context).size.width)*0.06944,
                                  right: (MediaQuery.of(context).size.width)*0.06944,
                                  top: (MediaQuery.of(context).size.height)*0.0563,
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
                                            controller: _price,
                                            decoration: InputDecoration(
                                              filled: true,
                                              fillColor: Colors.white,
                                              contentPadding: EdgeInsets.only(left: 10),
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
                              )
                            ],
                          )
                      ),
                    ),
                    Positioned(
                      right: (MediaQuery.of(context).size.width)*0.1605,
                      left: (MediaQuery.of(context).size.width)*0.1105,
                      top: (MediaQuery.of(context).size.height)*0.1025,
                      child:
                      Image.network(
                        snapshot.data[widget.id]['imagem'],
                        fit: BoxFit.fill,
                        height: (MediaQuery.of(context).size.height)*0.384,
                        width: (MediaQuery.of(context).size.width),
                        scale: 0.3,

                      ),
                    )
                  ]
              ),
            ],
          ),
        );
        default:
          return Text('default');

    }})
      ),
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