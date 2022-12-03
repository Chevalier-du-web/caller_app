import 'package:flutter/material.dart';

import '../homepage.dart';

class Page3 extends StatelessWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(

      children: [
        SizedBox(height: 40,),
        Container(
          height: 240,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(90),
              image: DecorationImage(
                  image: AssetImage('assets/image3.jpeg'),
                fit: BoxFit.cover
              )
          ),
        ),
        Container(
            margin: EdgeInsets.all(30),
            child: Text('Consultez les meilleurs forfaits',
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
        Container(
          margin: EdgeInsets.only(top:20,left: 50,right: 50),
          child: Text('       Que ce soit vos forfaits d\'apppel, de d\'internet ou de SMS'
              'sur toutes vos reseaux ',style: TextStyle(fontSize: 18),),
        ),
        SizedBox(height: 40,),
        GestureDetector(
          onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage())),
          child: Container(
            padding: EdgeInsets.only(left: 40,right: 40,top: 15,bottom: 15),
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
