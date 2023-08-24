import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CardForfait extends StatelessWidget {
  const CardForfait({Key? key, required this.photo, required this.code,
    required this.forfait, required this.quantite}) : super(key: key);
  final String photo;
  final String code;
  final String forfait;
  final String quantite;

  @override
  Widget build(BuildContext context) {
    return Card(
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 16,),
              Container(
                width: 60,
                height: 40,
               decoration: BoxDecoration(
                 color: Colors.transparent,
                 borderRadius: BorderRadius.circular(90),
                 image: DecorationImage(
                   image: AssetImage(photo),
                    fit: BoxFit.cover
                 )
               ),
              ),
              SizedBox(width: 13,),
              Column(
                children: [
                  Text(forfait,style: TextStyle(fontWeight: FontWeight.bold),),
                  Text(quantite,style: TextStyle(fontSize: 12)),
                ],
              ),

            ],
          ),
          IconButton(onPressed: ()async{
            //lancement de l'appel
            await FlutterPhoneDirectCaller.callNumber(code);
            setTransaction();
            print("reussi");
          },
              icon: Icon(Icons.call,color: Colors.blue,))
        ],
      ),
    );
  }
  Future  setTransaction()async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.setString(
        "transaction",
        jsonEncode({
          "name": "brandon",
          "age":"25"
        }));

  }
}
