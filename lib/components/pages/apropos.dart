import 'package:flutter/material.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
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
        "mises à jour . \n\n\nN'hésitez pas à nous soutenir ou nous contacter en cas"
        " de besoin des services et aussi lors de l'utilisation du logiciel. \n\n\n "
        "Merci et bonne utilisation ...." ;
    return Scaffold(

      body:CustomScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        slivers: [
          SliverAppBar(
            pinned: true,
            leading: IconButton(onPressed: () { Navigator.pop(context); },
            icon: Icon(Icons.arrow_back_ios,color: Colors.white,),),
            expandedHeight: 220.0,elevation: 12,
            backgroundColor: Colors.teal,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('A propos'),
              background: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/logo3.png'),fit: BoxFit.cover
                  ),
                ),
              ),
            ),
          ),

          SliverList(
            delegate: SliverChildListDelegate(
                [
              SizedBox(height: 20,),
              Text('Version 2.0',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              Container(
                margin: EdgeInsets.only(top: 20,left: 40,right: 40),
                child: Text(apropos,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 9,),
              Container(
                padding: EdgeInsets.all(10),
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10)),
                child: Text('Développeur : Sangon Brangon\n '
                    'Etudiant en informatique',
                  style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              SizedBox(height: 10,),
              Divider(),
              Center(child: Text("Comment ca marche ?",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 20),
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Row(
                  children: [
                    Container(
                      width:60,
                      height: 60,
                      margin: EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        color: Colors.teal.withOpacity(.3),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Icon(Icons.help),
                    ),
                    Container(
                      width: 220,
                      child: Text("        Il suffit de sélectionner le service souhaité, lancer l'appel "
                          "et choisir la sim en fonction des réseaux "
                          "disponibles dans votre téléphone. Simplifiez vous la vie avec Servus.",
                        style: TextStyle(fontWeight: FontWeight.bold),),
                    ),
                  ],
                ),
              ),
                  Divider(),
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          height: 3,
                        width: 75,
                        color: Colors.teal,
                        margin: EdgeInsets.all(7),),
                        Text('Pour vos besoins de :',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        Container(
                          height: 3,
                          width: 75,
                          color: Colors.teal,
                          margin: EdgeInsets.all(7),),
                      ],
                    ),
                    Container(
                      width: 270,
                      padding: EdgeInsets.all(13),
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.2),
                          borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.android),
                            Text('   Création d\'applications '),
                          ],
                        )),
                    Container(
                        width: 270,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.add_shopping_cart_rounded),
                            Text('   Création de sites web '),
                          ],
                        )),

                    Container(
                        width: 270,
                        margin: EdgeInsets.all(4),
                        padding: EdgeInsets.all(13),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          children: [
                            Icon(Icons.mobile_friendly_outlined),
                            Text('   Création des logos, flyers et autres '),
                          ],
                        )),
                  ],
                ),
              ),

              SizedBox(height: 10,),
                  FlutterSocialButton(
                    onTap: ()async{
                      var message = "Salut Mr Brandon, concepteur de "
                          "l\'application Servus, je desire entrer en possession de votre produit...";
                      var number = '+237657591936';
                      var url = "whatsapp://send?phone=$number&text=$message";
                      await canLaunch(url)?launch(url):print('erreur de lien');
                    },
                    title: "Me contacter",
                    buttonType: ButtonType.whatsapp,
                  ),
                  SizedBox(height: 20,)
            ]),
          )

        ],
      )
    );
  }
}

