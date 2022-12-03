import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(height: 40,),
        Container(
          height: 200,

          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              image: DecorationImage(
                  image: AssetImage('assets/image2.png'),

              )
          ),
        ),
        Container(
            margin: EdgeInsets.all(30),
            child: Text('Facilitez vous la vie,',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        Container(
          margin: EdgeInsets.only(top:30,left: 40,right: 40),
          child: Text('         Fini la saisie des longs codes .'
              'En un clic, activez vos forfaits et payez vos factures sur place.'
              'Envoyez de l\'argent et faites vos recharges plus rapidement.',style: TextStyle(fontSize: 18)),
        )
      ],
    );
  }
}
