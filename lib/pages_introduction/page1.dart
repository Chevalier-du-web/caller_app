import 'package:flutter/material.dart';

class Page1 extends StatelessWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(height: 40,),
        Container(
          height: 300,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(90),
            image: DecorationImage(
              image: AssetImage('assets/image1.jpg')
            )
          ),
        ),
        Container(
      margin: EdgeInsets.all(30),
      child: Text('Bienvenue sur Caller App,',
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        Container(
          margin: EdgeInsets.only(top:30,left: 40,right: 40),
          child: Text('     Votre application d\'activation ,'
              'de consultation de vos forfaits ,'
              ' soldes et de paiement de facture',style: TextStyle(fontSize: 18)),
        )
      ],
    );
  }
}
