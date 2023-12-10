import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'dart:io';
import 'package:adaptive_theme/adaptive_theme.dart';

import 'components/drawerHome.dart';
import 'components/forfaitAppel.dart';
import 'components/forfaitInternet.dart';
import 'components/forfaitSMS.dart';
import 'components/pages/faire_un_don.dart';
import 'components/retraitpage.dart';
import 'gadgets/gadgets.dart';
import 'history/history_page.dart';
import 'onboarding_malia/onboarding_malia.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _controller ;
  dynamic savedThemeMode;
  bool  darkMode = false;
  int index = 0;

  //Et ces fonctions vont permettre l'initialisation et la mise a jour du contoller..
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentTheme();
    _controller = TabController(length: 4, vsync: this);
    _controller.addListener(() {
      setState(() {
      });
    });
  }
  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();

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

  Icon iconDark = Icon(Icons.mode_night_outlined,color: Colors.white);
  Icon iconLight = Icon(Icons.light_mode_outlined,color: Colors.white);
  bool modeDark = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: index==3 || index==1 ||index==2?
      null
          :AppBar(

        title:  Text('Bienvenue chez Servus'),
        //backgroundColor: darkMode?Colors.deepPurple:Colors.blue,
        actions: [
          IconButton(onPressed: (){
            setState(() {
              modeDark = !modeDark;
            });

            if (modeDark==true){
              AdaptiveTheme.of(context).setDark();
            }else{
              AdaptiveTheme.of(context).setLight();
            }
          },
              icon: modeDark?iconDark:iconLight),
          InkWell(
            onTap: (){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>UsersPage()));
            },
              child: Icon(Icons.history))
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),child: Column(
          children: [
            InkWell(
              //PageDon- OnboardingMalia
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PageDon())),
              child: Container(
                width: 280,
                padding: EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(20),

                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                          width: 40,
                          height: 40,
                        padding: EdgeInsets.all(6),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.2),
                            borderRadius: BorderRadius.circular(50),
                              border: Border.all(color: Colors.deepOrange),
                              image: DecorationImage(
                              image: AssetImage("assets/don.gif"),

                            )
                          ),
                      ),

                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText("Cliquez ici pour faire un don",
                              speed: Duration(milliseconds: 150),
                              textStyle: TextStyle(fontSize: 14,fontWeight: FontWeight.bold,color:Colors.white)),
                          TyperAnimatedText("Pour nous soutenir ",
                              speed: Duration(milliseconds: 150),
                              textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.white)),
                          TyperAnimatedText("Et nous encourager ",
                              speed: Duration(milliseconds: 150),
                              textStyle: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color:Colors.white))

                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            TabBar(
              controller: _controller,
              tabs: [
                //Les entetes des onglets ...
                Tab(text: 'Argent',icon: Icon(Icons.attach_money_outlined)),
                Tab(text: 'Internet',icon: Icon(Icons.network_wifi)),
                Tab(text: 'Appel',icon: Icon(Icons.call)),
                Tab(text: 'SMS',icon: Icon(Icons.sms)),
              ],
            ),
          ],
        ),
        ),
      ),
      // drawer: index==0?Drawer(
      //   width: 270,
      //   elevation: 9,
      //   child: DrawerHome(),
      // ):null,
      body: index==0?TabBarView(
        controller: _controller,
        children: [
          RetraitPage(),
          ForfaitInternet(),
          ForfaitAppel(),
          ForfaitSMS()
        ],
      ):index==1?GadgetPage():index==2?HistoryPage():DrawerHome(),
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
            indicatorColor: Colors.white,
            backgroundColor:  Colors.teal,
            labelTextStyle: MaterialStateProperty.all(const TextStyle(fontSize: 14,fontWeight: FontWeight.w500,color: Colors.white))
        ),
      child:  NavigationBar(
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: index,
        animationDuration: const Duration(seconds: 3),
        onDestinationSelected: (index){
          setState(() {
            this.index = index;
          });
        },
        destinations: [
          NavigationDestination(
            icon: Icon(Icons.home,
            color: index==0?Colors.black:Colors.white,), label: 'Accueil',),

          NavigationDestination(
            icon: Icon(Icons.add_box_outlined,
              color: index==1?Colors.black:Colors.white,), label: 'Outils',),
          NavigationDestination(
            icon: Icon(Icons.history,
              color: index==2?Colors.black:Colors.white,), label: 'Historique',),
          NavigationDestination(icon: Icon(
            Icons.menu_rounded,
            color: index==3?Colors.black:Colors.white,),
              label: 'Options'),

        ],
      ),),

    );
  }
}


class UsersPage extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Liste des utilisateurs'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Une erreur est survenue : ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Text('La liste est vide.'),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

              return ListTile(
                title: Text(data['name']),
                subtitle: Text(data['email']),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
