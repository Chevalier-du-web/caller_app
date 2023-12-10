import 'package:caller/authentication/sign_in.dart';
import 'package:caller/authentication/sign_up.dart';
import 'package:flutter/material.dart';



class AuthenticationPage extends StatefulWidget {
  const AuthenticationPage({Key? key}) : super(key: key);

  @override
  State<AuthenticationPage> createState() => _AuthenticationPageState();
}

class _AuthenticationPageState extends State<AuthenticationPage> with TickerProviderStateMixin{
  late TabController tabviewController;

  @override
  void initState() {
    super.initState();
    tabviewController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage('assets/images/background.png'))
          ),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Container(
                child: Text("Bienvenue chez nous",style:TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold)),
              ),
              SizedBox(height: 30,),
              TabBar(
                  controller: tabviewController,
                  tabs: [
                Tab(child: Column(
                  children: [
                    Icon(Icons.login,color: Colors.deepOrangeAccent,size: 30,),
                    Text("Connexion",style: TextStyle(color: Colors.black),),
                  ],
                )),
                    Tab(child: Column(
                      children: [
                        Icon(Icons.person_add_alt_outlined,color: Colors.deepOrangeAccent,size: 30,),
                        Text("Inscription",style: TextStyle(color: Colors.black),),
                      ],
                    )),
              ]
              ),
              SizedBox(
                height: 412,
                child: TabBarView(
                    controller: tabviewController,
                    children: [
                      LoginPage(),
                      RegisterPage()
                ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}
