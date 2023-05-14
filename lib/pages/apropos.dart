import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
// import 'package:url_launcher/url_launcher.dart';


class Apropos extends StatelessWidget {
  const Apropos({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String apropos = "    Cette application a été concue pour faciliter "
        "l\'activation des forfaits et des transactions via les"
        " différents fournisseurs d'accès au cameroun, à savoir :"
        " Orange, MTN, Camtel ,Nexttel .\n\n La version actuelle "
        "se vera changée au fil du temps . Car les forfaits devront être "
        "mises à jour . \n\n\nN'hésitez pas à nous contacter en cas"
        " de besoin des services et aussi lors de l'utilisation du logiciel. \n\n\n "
        "Merci et bonne utilisation ...." ;
    return Scaffold(
      appBar: AppBar(
        title: Text('A propos'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 180,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(100),bottomLeft: Radius.circular(100))
              ),
                child: Column(
                  children: [
                    Container(
                      width: 90,
                    height: 90,
                      padding: EdgeInsets.all(10),
                      margin: EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(100),
                          image: DecorationImage(
                              image: AssetImage('assets/servus.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                       ),
                    SizedBox(height: 8,),
                    Text('Servus',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.white),)
                  ],
                ),
            ),
            SizedBox(height: 20,),
            Text('Version 1.0'),
            Container(
              margin: EdgeInsets.only(top: 20,left: 40,right: 40),
              child: Text(apropos),
            ),
            SizedBox(height: 9,),
            Text('Développeur : Sangon Brangon',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            SizedBox(height: 9,),
            Text('brandonsangon5@gmail.com',style: TextStyle(fontSize: 15)),
            SizedBox(height: 10,),
            Divider(),
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text('Pour vos besoins de :',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                  Text('* création d\'applications '),
                  Text('* création de sites web  '),
                  Text('* création des logos et flyers')
                ],
              ),
            ),
            SizedBox(height: 20,),
            GestureDetector(
              onTap: ()async{
                var message = "Salut Mr Brandon, concepteur de "
                    "l\'application Servus, je desire entrer en possession de votre produit...";
                var number = '+237657591936';
                var url = "whatsapp://send?phone=$number&text=$message";
                await canLaunch(url)?launch(url):print('erreur de lien');
              },
              child: Container(
                width: 200,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.grey,width: 0.5),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('      Me contacter ?',style: TextStyle(color: Colors.white,
                        fontWeight: FontWeight.bold,fontSize: 17),),
                    Icon(Icons.chat,color: Colors.green,)
                  ],
                ),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}
