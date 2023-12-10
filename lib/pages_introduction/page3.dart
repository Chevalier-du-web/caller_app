import 'package:caller/components/button.dart';
import 'package:flutter/material.dart';

import '../components/transition.dart';
import '../homepage.dart';

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
          margin: EdgeInsets.only(top: _h/5),
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
            child: Text('   Consultez les meilleurs forfaits',textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),)),
        Container(
          margin: EdgeInsets.only(top:_h/30,left: _w/8,right: _w/8),
          child: Text('    Que ce soit vos forfaits d\'appel, d\'internet ou de SMS'
              ' sur tous vos réseaux en toute sécurité.',style: TextStyle(fontSize: 16,color: Colors.white),textAlign: TextAlign.center,),
        ),

        Container(
          margin: EdgeInsets.only(top: _h/15,bottom: 10),
          child: CustomButton(
              onpressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>MyCustomSplashScreen())),
              title: "Commencer")
        )
      ],
    );
  }
}
