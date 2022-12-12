import 'package:flutter/material.dart';

import '../homepage.dart';
import '../transition.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //dimensions de l'ecran ....
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return Column(

      children: [

        Container(
          margin: EdgeInsets.only(top: _h/8),
          height: 200,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              image: DecorationImage(
                  image: AssetImage('assets/image3.png'),
                fit: BoxFit.cover
              )
          ),
        ),
        Container(
            margin: EdgeInsets.only(left:_h/19,right: _h/19,top: _h/25,),
            child: Text('   Consultez les meilleurs forfaits',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        Container(
          margin: EdgeInsets.only(top:_h/30,left: _w/8,right: _w/8),
          child: Text('    Que ce soit vos forfaits d\'apppel, d\'internet ou de SMS'
              ' sur tous vos réseaux .',style: TextStyle(fontSize: 16),),
        ),

        GestureDetector(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCustomSplashScreen())),
          child: Container(
            margin: EdgeInsets.only(top: _h/20),
            padding: EdgeInsets.only(left: 40,right: 40,top: 10,bottom: 10),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(35)
            ),
            child: Text('Commencer',style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),),
          ),
        )
      ],
    );
  }
}
