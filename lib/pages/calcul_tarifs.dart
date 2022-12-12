import 'package:flutter/material.dart';

import 'calcul_orange.dart';
import 'calculmtn.dart';


class CalculTarif extends StatefulWidget {
  const CalculTarif({Key? key}) : super(key: key);

  @override
  State<CalculTarif> createState() => _CalculTarifState();
}

class _CalculTarifState extends State<CalculTarif> {
  @override
  Widget build(BuildContext context) {
    int choix = 0;

    return Scaffold(
      appBar: AppBar(
        title: Text('Calcul de tarif'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 80,),
            Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey)
                ),
                child: Text('Choix du reseau?',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
            SizedBox(height: 60,),
            Center(
              child: Container(
                width: 250,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CalculOrange()));
                      },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            )
                        ),
                        child:
                        Padding(
                          padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text('Orange money',style: TextStyle(
                              fontSize: 18,color: Colors.white

                          ),),
                        ),),

                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: Container(
                width: 250,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed:(){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>CalculMTN()));
                      },
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            )
                        ),
                        child:
                        Padding(
                          padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text('Mobile money',style: TextStyle(
                              fontSize: 18,color: Colors.white

                          ),),
                        ),),

                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

}
