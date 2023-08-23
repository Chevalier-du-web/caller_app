import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:caller/pages/faire_un_don.dart';
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
      appBar: AppBar(
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
      drawer: Drawer(
        width: 270,
        elevation: 9,
        child: DrawerHome(),
      ),
      body: TabBarView(
        controller: _controller,
        children: [
          RetraitPage(),
          ForfaitInternet(),
          ForfaitAppel(),
          ForfaitSMS()
        ],
      ),

      // bottomNavigationBar: AnimatedBottomNavigationBar(
      //
      //   backgroundColor: Colors.teal,
      //   icons: [
      //     Icons.home_filled,
      //     Icons.history,
      //     Icons.card_travel
      //   ],
      //   activeIndex: 1,
      //   onTap: (int ) {  },),

    );
  }
}
