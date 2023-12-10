import 'dart:io';
import 'package:caller/components/pages/apropos.dart';
import 'package:caller/components/pages/calcul_tarifs.dart';
import 'package:caller/components/pages/composer.dart';
import 'package:caller/components/pages/mon_numero.dart';
import 'package:caller/components/pages/payment_facture.dart';
import 'package:caller/components/pages/recharge.dart';
import 'package:caller/components/pages/soldes_consult.dart';

import 'package:flutter/material.dart';
import 'dart:async';
import 'package:adaptive_theme/adaptive_theme.dart';


import 'package:flutter/services.dart';
import 'package:share/share.dart';

import 'list_widget.dart';
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
      physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
      child: Column(
        children: [
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
              color: darkMode?Colors.black26:Colors.teal,
              borderRadius: BorderRadius.only(bottomRight: Radius.circular(60))
            ),
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
                SizedBox(height: 10,),
                ListWidget(
                  title: 'Paiement factures',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>PaymentFacture()));
                  },
                  icon: Icon(Icons.monetization_on,
                    color: Colors.teal,),),

                ListWidget(
                  title: 'Soldes principaux',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>SoldConsult()));
                  },
                  icon: Icon(Icons.money_rounded,
                    color: Colors.teal,),),

                ListWidget(
                  title: 'Mon numéro',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>MonNumero()));
                  },
                  icon: Icon(Icons.phone,
                    color: Colors.teal,),),

                ListWidget(
                  title: 'Recharge',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>RechargePage()));
                  },
                  icon: Icon(Icons.credit_card_rounded,
                    color: Colors.teal,),
                ),

                ListWidget(
                  title: 'Composer un code',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Composer()));
                  },
                  icon: Icon(Icons.add_call,
                    color: Colors.teal,),),

                ListWidget(
                  title: 'Calculateur de tarif',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CalculTarif()));
                  },
                  icon: Icon(Icons.calculate_rounded,
                    color: Colors.teal,),),

                Divider(),
                ListWidget(
                  title: 'A propos & aides',
                  onPressed: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>Apropos()));
                  },
                  icon: Icon(Icons.help,
                    color: Colors.teal,),),

                ListWidget(
                  title: 'Partager aux amis',
                  onPressed: () {
                    Share.share('Application Servus disponible sur Playstore... '
                        'merci pour votre aimable'
                        ' compréhension et bonne utilisation ...');                  },
                  icon: Icon(Icons.share,
                    color: Colors.teal,),),

                ListWidget(
                  title: 'Quitter',
                  onPressed: ()=>SystemNavigator.pop(),
                  icon: Icon(Icons.logout,
                    color: Colors.teal,),),

              ],
            ),
          ),
          SizedBox(height: 20,)
        ],
      ),
    );
  }
}
