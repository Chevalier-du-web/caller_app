import 'package:caller/gadgets/traductor.dart';
import 'package:flutter/material.dart';
import 'package:caller/gadgets/calculator.dart';

import '../chat_page/chat_screen.dart';
import '../chat_page/provider/chat_provider.dart';
import '../onboarding_malia/onboarding_malia.dart';



class GadgetPage extends StatefulWidget {
  const GadgetPage({Key? key}) : super(key: key);

  @override
  State<GadgetPage> createState() => _GadgetPageState();
}

class _GadgetPageState extends State<GadgetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Liste des gadgets"),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 8,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: 30,bottom: 9,right: 20),
                    child: Text("Intelligence artifficielle (IA)",style: TextStyle(fontWeight: FontWeight.bold),)),
                Expanded(
                  child: Container(
                    height: 2,
                  margin: EdgeInsets.only(right: 12),
                  color: Colors.orange,),
                )
              ],
            ),
            PersonalityWidget(title: 'Le savant', description: 'Repond a toutes vos questions ...', image: 'assets/doctor.png',
              onPress: () {
                //ChatScreen()
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(profil: 'LE SAVANT',),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },),
            PersonalityWidget(title: 'Docteur love', description: 'Specialiste en Amour et conseils',
              image: 'assets/doctor.png',
              onPress: () {
                ChatProvider().NewChat();
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => ChatScreen(profil: 'DOCTEUR LOVE',),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );
              },),
            PersonalityWidget(title: 'L\'influenceur des reseaux',
              description: 'Createur de contenus et publications', image: 'assets/doctor.png', onPress: () {  },),
            PersonalityWidget(title: 'Generateur d\'images', description: 'Genere les images de tres bonne qualite', image: 'assets/doctor.png', onPress: () {  },),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                    margin: EdgeInsets.only(left: 30,bottom: 9,right: 20),
                    child: Text("Utilitaires",style: TextStyle(fontWeight: FontWeight.bold),)),
                Expanded(
                  child: Container(
                    height: 2,
                    margin: EdgeInsets.only(right: 12),
                    color: Colors.orange,),
                )
              ],
            ),
            PersonalityWidget(title: 'Generateur de mot de passe',
              description: 'Genere des mots de passes puissants et surs',
              image: 'assets/doctor.png', onPress: () {  },),

            PersonalityWidget(title: 'Calculateur d\'amour',
              description: 'Donne le pourcentage d\'amour entre deux partenaires',
              image: 'assets/doctor.png', onPress: () {  },),




          ],
        ),
      ),
    );
  }
}
