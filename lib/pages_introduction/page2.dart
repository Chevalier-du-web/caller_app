import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //dimensions de l'ecran ....
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Column(

      children: [
        Container(
          margin: EdgeInsets.only(top: _h/5),
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              image: DecorationImage(
                  image: AssetImage('assets/image2.png'),

              )
          ),
        ),
        Container(
            margin: EdgeInsets.only(left:_h/19,right: _h/19,top: _h/25,),
            child: Text('Facilitez vous la vie',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
        ),
        Container(
          margin: EdgeInsets.only(top:_h/30,left: _w/8,right: _w/8),
          child: Text('    Fini la saisie des longs codes .'
              'En un clic, activez vos forfaits et payez vos factures sur place.'
              'Envoyez de l\'argent et faites vos recharges plus rapidement.',
              style: TextStyle(fontSize: 20),textAlign: TextAlign.center,),
        )
      ],
    );
  }
}
