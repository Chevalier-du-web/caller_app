import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import '../components/custom_card.dart';

class MonNumero extends StatefulWidget {
  const MonNumero({Key? key}) : super(key: key);

  @override
  State<MonNumero> createState() => _MonNumeroState();
}

class _MonNumeroState extends State<MonNumero> {
  bool  darkMode = false;
  dynamic savedThemeMode;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentTheme();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon numéro'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Text('Quel numéro voulez-vous avoir ?',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ),
              SizedBox(height: 40,),
              CustomCard(
                onpressed: ()async{
                  await FlutterPhoneDirectCaller.callNumber('#997#');
                },
                image: 'assets/logo-orange.jpg',
                title: 'ORANGE',
                type: 1,),

              SizedBox(height: 20,),
              CustomCard(
                onpressed: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*141#');
                },
                image: 'assets/MTN-Logo.png',
                title: 'MTN',
                type: 1,),

              SizedBox(height: 20,),
              CustomCard(
                onpressed: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*825*1*3#');
                },
                image: 'assets/camtel_logo.jpg',
                title: 'CAMTEL',
                type: 1,),

              SizedBox(height: 20,),
              CustomCard(
                onpressed: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*600#');
                },
                image: 'assets/Nexttel-Cameroon-Logo.png',
                title: 'NEXTTEL',
                type: 1,),


            ],
          ),
        ),
      ),
    );
  }
}
