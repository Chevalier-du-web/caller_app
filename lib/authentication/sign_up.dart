import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';

import '../components/custom_button.dart';
import '../homepage.dart';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
          children:[
            Container(
              margin: EdgeInsets.only(top: 17,bottom: 10),
              child: Text("Veillez entrer vos informations\n d'inscription",
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            ),

            Container(
              width: 310,
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.person),
                    suffixIcon: Icon(Icons.check,color: Colors.grey,),
                    border: OutlineInputBorder(),
                    label: Text('Nom complet',style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),)
                ),
              ),
            ),
            Container(
              width: 310,
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.phone),
                    suffixIcon: Icon(Icons.check,color: Colors.grey,),
                    border: OutlineInputBorder(),
                    label: Text('Telephone',style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),)
                ),
              ),
            ),
            Container(
              width: 310,
              margin: EdgeInsets.only(bottom: 10),
              child: TextField(
                keyboardType: TextInputType.emailAddress,

                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                    suffixIcon: Icon(Icons.check,color: Colors.grey,),
                    border: OutlineInputBorder(),
                    label: Text('Adresse email',style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),)
                ),
              ),
            ),

            Container(
              width: 310,
              margin: EdgeInsets.only(top: 5),
              child: TextField(
                keyboardType: TextInputType.visiblePassword,

                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: Icon(Icons.check,color: Colors.grey,),
                    border: OutlineInputBorder(),
                    label: Text('Mot de passe',style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),)
                ),
              ),
            ),


            // bouton
            Padding(
              padding: const EdgeInsets.all(12.0),
              child:  CustomButton(onPress: () {
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => HomePage(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              }, title: 'Inscription',),
            ),

            //reseau social
            SignInButton(
              Buttons.Google,
              text: "Connexion avec Google",
              onPressed: () {},
            )
          ]
      ),
    );
  }
}
