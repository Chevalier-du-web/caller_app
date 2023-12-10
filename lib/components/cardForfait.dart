import 'dart:convert';

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:shared_preferences/shared_preferences.dart';


class CardForfait extends StatefulWidget {
  const CardForfait({Key? key, required this.photo, required this.code,
    required this.forfait, required this.quantite}) : super(key: key);
  final String photo;
  final String code;
  final String forfait;
  final String quantite;

  @override
  State<CardForfait> createState() => _CardForfaitState();
}

class _CardForfaitState extends State<CardForfait> {
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
    return Container(
      margin: EdgeInsets.only(left: 8,right: 8,top:2,bottom: 6),
      padding: EdgeInsets.all(6),
      decoration: BoxDecoration(
        color: Colors.transparent,
          border: Border.all(color: Colors.grey.withOpacity(.4),width: 3),
          borderRadius: BorderRadius.circular(10),

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
                 borderRadius: BorderRadius.circular(30),
                 image: DecorationImage(
                   image: AssetImage(widget.photo),
                    fit: BoxFit.cover
                 )
               ),
              ),
              SizedBox(width: 13,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FittedBox(child: Text(widget.forfait,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),)),
                  Text(widget.quantite,style: TextStyle(fontSize: 13)),
                ],
              ),

            ],
          ),
          IconButton(onPressed: ()async{
            //lancement de l'appel
            await FlutterPhoneDirectCaller.callNumber(widget.code);
            print("reussi");
          },
              icon: Icon(Icons.call,color: Colors.teal,),
          )
        ],
      ),
    );
  }
}
