import 'package:app_admin/TelaAlterarItem/descricaobacon.dart';
import 'package:app_admin/tela_login_senha/senha/home_page.dart';
import 'package:flutter/material.dart';

class DesignAltCard extends StatefulWidget {
  const DesignAltCard({ Key? key }) : super(key: key);

  @override
  _DesignAltCardState createState() => _DesignAltCardState();
}

class _DesignAltCardState extends State<DesignAltCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFFFF9B0D),
        body:Stack(

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
                'Alterar Cardápio',
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


        Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Colors.white,
                  ),
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(15.0),
                      topLeft: Radius.circular(15.0))),
              height: (MediaQuery.of(context).size.height)/1.2,
              width: MediaQuery.of(context).size.width,
              child: GridView.count(
                primary: false,
                padding: EdgeInsets.all(30),
                crossAxisSpacing: 26,
                mainAxisSpacing: 32,
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                children: [
                  ItemCard(),
                  ItemCard(),
                  ItemCard(),
                  ItemCard(),
                  ItemCard(),
                  ItemCard(),
                ],
              ),

            ),
          ],
        )]
        )
    );
  }
}

class ItemCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Navigator.of(context).push(
          MaterialPageRoute(builder: (context) => Background())
      );},
      child: Container(
          decoration: BoxDecoration(
            color: Color(0xFFFFCB82),
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                blurRadius: 4,
                color: Color(0x3F000000),
                offset: Offset(0, 4),
                spreadRadius: 0,
              )
            ],
          ),
          child: ContentCard()
      ),
    );
  }
}

class ContentCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 80),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: InfoCard(),
          ),
        ),
        Positioned.fill(
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                  padding: EdgeInsets.only(
                      top: 10.0
                  ),
                  height: 128,
                  child: Image.asset(
                    'assets/images/pato-bacon_solo.png',
                    fit: BoxFit.fill,
                  )
              ),
            )
        )
      ],
    );
  }
}

class InfoCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 60),
          child: Text(
            'X-Lombo de Pato',
            style: TextStyle(
              fontFamily: 'Roboto',
              color: Color(0xFF434343),
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),),
        ),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(45, 0, 0, 0),
              child: Text('R\$',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xFFFF9B0D),
                  fontWeight: FontWeight.bold,
                ),),),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
              child: Text('0,00',
                style: TextStyle(
                  fontFamily: 'Roboto',
                  color: Color(0xFF434343),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),)
          ],)
      ],
    );
  }
}