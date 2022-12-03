import 'package:caller/retraitpage.dart';
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'drawerHome.dart';
import 'forfaitAppel.dart';
import 'forfaitInternet.dart';
import 'forfaitSMS.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _controller ;

  //Et ces fonctions vont permettre l'initialisation et la mise a jour du contoller..
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Caller'),
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
