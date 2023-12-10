import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //dimensions de l'ecran ....
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;

    return Column(

      children: [

        Container(
          margin: EdgeInsets.only(top: _h/6),
          height: 200,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            image: DecorationImage(
              image: AssetImage('assets/image1.png')
            )
          ),
        ),
        Container(
      margin: EdgeInsets.only(left:_h/19,right: _h/19,top: _h/25,),
      child: Text('Bienvenue sur Servus.',
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
        Container(
          margin: EdgeInsets.only(top:_h/30,left: _w/9,right: _w/9),
          child: Text('   Votre application d\'activation ,'
              'de consultation de vos forfaits \n'
              ' soldes et de paiement des factures \n totalement gratuit et 100% sécurisé !',
              style: TextStyle(fontSize: 16,color: Colors.white),textAlign: TextAlign.center),
        )
      ],
    );
  }
}
