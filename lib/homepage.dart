import 'package:caller/retraitpage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'drawerHome.dart';
import 'forfaitAppel.dart';
import 'forfaitInternet.dart';
import 'forfaitSMS.dart';
import 'package:adaptive_theme/adaptive_theme.dart';


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
        title: Text('Servus'),
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
              icon: modeDark?iconDark:iconLight)
        ],
        bottom: TabBar(
          controller: _controller,
          tabs: [
            //Les entetes des onglets ...
            Tab(text: 'Argent',),
            Tab(text: 'Internet',),
            Tab(text: 'Appel',),
            Tab(text: 'SMS',),

          ],
        ),
      ),
      drawer: Drawer(
        width: 250,
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

    );
  }
}
