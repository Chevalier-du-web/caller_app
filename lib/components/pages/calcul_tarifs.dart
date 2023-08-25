import 'package:caller/components/button.dart';
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
            SizedBox(height: 50,),
            Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('Choix de l\'opérateur :',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 60,),
            CustomButton(
                onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CalculOrange()));
                },
                title: "Orange money"),

            SizedBox(height: 30,),
            CustomButton(
                onpressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>CalculMTN()));
                },
                title: "MTN money"),

          ],
        ),
      ),
    );
  }

}
