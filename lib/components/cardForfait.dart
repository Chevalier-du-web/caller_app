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
    return Container(
      margin: EdgeInsets.all(6),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.transparent,
          border: Border.all(color: Colors.grey.withOpacity(.4),width: 3),
          borderRadius: BorderRadius.circular(20)
      ),
      child:
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              SizedBox(width: 16,),
              Container(
                width: 60,
                height: 50,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(forfait,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 16),),
                  Text(quantite,style: TextStyle(fontSize: 15)),
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
