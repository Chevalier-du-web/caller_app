import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caller/pages/faire_un_don.dart';
import 'package:caller/pages/historique.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import 'package:adaptive_theme/adaptive_theme.dart';

import 'components/drawerHome.dart';
import 'components/forfaitAppel.dart';
import 'components/forfaitInternet.dart';
import 'components/forfaitSMS.dart';
import 'components/retraitpage.dart';


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
      appBar: index==1?
      AppBar(
        leading: Icon(Icons.history),
        title: Text("Hisorique"),
      )
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
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),child: Column(
          children: [
            InkWell(
              onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PageDon())),
              child: Container(
                width: 270,
                padding: EdgeInsets.only(left: 20,right: 20,top: 8,bottom: 8),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(50)
                ),
                child: Center(
                  child: Row(
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                          margin: EdgeInsets.only(right: 10),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(.2),
                            borderRadius: BorderRadius.circular(50)
                          ),
                          child: Icon(Icons.attach_money,color: Colors.white,)),
                      AnimatedTextKit(
                        repeatForever: true,
                        animatedTexts: [
                          TyperAnimatedText("Faites un don ... ",
                              speed: Duration(milliseconds: 150),
                              textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white)),
                          TyperAnimatedText("Pour nous soutenir ",
                              speed: Duration(milliseconds: 150),
                              textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white)),
                          TyperAnimatedText("Et nous encourager ",
                              speed: Duration(milliseconds: 150),
                              textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold,color:Colors.white))


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
      drawer: index==0?Drawer(
        width: 270,
        elevation: 9,
        child: DrawerHome(),
      ):null,
      body: index==0?TabBarView(
        controller: _controller,
        children: [
          RetraitPage(),
          ForfaitInternet(),
          ForfaitAppel(),
          ForfaitSMS()
        ],
      ):HistoriquePage(),
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
          NavigationDestination(icon: Icon(Icons.home,
            color: index==0?Colors.black:Colors.white,), label: 'Accueil',),
          // NavigationDestination(icon: Icon(Icons.call_end_outlined,
          //   color: index==1?Colors.black:Colors.white,), label: 'Call Box',),
          NavigationDestination(icon: Icon(Icons.history,
            color: index==1?Colors.black:Colors.white,), label: 'Historique'),


        ],
      ),),

    );
  }
}
