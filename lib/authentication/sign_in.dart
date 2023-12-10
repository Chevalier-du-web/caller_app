import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import '../components/custom_button.dart';
import '../homepage.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children:[
        Container(
          margin: EdgeInsets.only(top: 17,bottom: 10),
          child: Text("Veillez entrer vos informations\n de connexion",
            style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
        ),
         Container(
           width: 310,
           margin: EdgeInsets.only(bottom: 10),
           child: TextField(
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
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(
              margin: EdgeInsets.only(right: 20),
                child: TextButton(onPressed: (){},
                    child: Text("Mot de passe oublie ?")))
          ],
        ),

        // bouton
        CustomButton(
          onPress: () {
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
        }, title: 'Connexion',),

        //reseau social
        SignInButton(
          Buttons.Google,
          text: "Connexion avec Google",
          onPressed: () {},
        )
      ]
    );
  }
}
