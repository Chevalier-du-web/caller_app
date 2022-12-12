import 'dart:io';
import 'package:caller/pages/calcul_tarifs.dart';
import 'package:share/share.dart';
import 'package:caller/pages/apropos.dart';
import 'package:caller/pages/composer.dart';
import 'package:caller/pages/mon_numero.dart';
import 'package:caller/pages/payment_facture.dart';
import 'package:caller/pages/recharge.dart';
import 'package:caller/pages/soldes_consult.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:adaptive_theme/adaptive_theme.dart';


import 'package:flutter/services.dart';
// import 'package:share_plus/share_plus.dart';


class DrawerHome extends StatefulWidget {
  const DrawerHome({Key? key}) : super(key: key);

  @override
  State<DrawerHome> createState() => _DrawerHomeState();
}

class _DrawerHomeState extends State<DrawerHome> {
  bool  darkMode = false;
  dynamic savedThemeMode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentTheme();
  }
  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    print(savedThemeMode.toString());
    if(savedThemeMode.toString() =='AdaptiveThemeMode.dark'){
      setState(() {
        darkMode = true;
      });
    }else{
      setState(() {
        darkMode = false;
      });
    }

  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 200,
            width: 400,
            color: darkMode?Colors.black26:Colors.blue,

            child: Column(
              children: [
                SizedBox(height: 40,),
                Container(
                  height: 90,
                    width: 90,
                    child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(50),
                          image: DecorationImage(
                            image: AssetImage('assets/servus.jpg'),
                              fit: BoxFit.cover
                          )
                        ),
                        )),
                SizedBox(height: 15,),
                Text('Servus',style: TextStyle(fontSize: 22,
                    fontWeight: FontWeight.bold,color: Colors.white),),

              ],
            ),
          ),

          Container(

            child:
            Column(
              children: [
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentFacture()));

                  },
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.money,color: Colors.blue),
                      SizedBox(width: 20,),
                      Text('Paiement factures',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SoldConsult()));

                  },
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.monetization_on,color: Colors.blue),
                      SizedBox(width: 20,),
                      Text('Soldes principaux',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MonNumero()));

                  },
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.phone,color: Colors.blue),
                      SizedBox(width: 20,),
                      Text('Mon numéro',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargePage()));

                  },
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.help,color: Colors.blue),
                      SizedBox(width: 20,),
                      Text('Recharge',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap:  (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Composer()));

                  },
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.add_call,color: Colors.blue,),
                      SizedBox(width: 20,),
                      Text('Composer un code',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap:  (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CalculTarif()));

                  },
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.calculate_rounded,color: Colors.blue,),
                      SizedBox(width: 20,),
                      Text('Calcul de tarif',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Divider(),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Apropos()));

                  },
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.help,color: Colors.blue),
                      SizedBox(width: 20,),
                      Text('A propos',style: TextStyle(fontSize:15),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                     Share.share('Application Caller App disponible sur Playstore... '
                         'merci pour votre aimable'
                         ' compréhension et bonne utilisation ...');
                    },
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.share,color: Colors.blue),
                      SizedBox(width: 20,),
                      Text('Partager',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 20,),

                GestureDetector(
                  onTap: ()=>SystemNavigator.pop(),
                  child: Row(
                    children: [
                      SizedBox(width: 30,),
                      Icon(Icons.logout,color: Colors.blue),
                      SizedBox(width: 20,),
                      Text('Quitter',style: TextStyle(fontSize: 15),)
                    ],
                  ),
                ),
                SizedBox(height: 30,)
              ],
            ),
          )
        ],
      ),
    );
  }
}
