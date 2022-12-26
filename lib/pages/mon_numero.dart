import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

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
        title: Text('Mon numero'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text('Quel numero voulez-vous avoir ?',
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: ()async{
                  await FlutterPhoneDirectCaller.callNumber('#997#');
                },
                child: Container(
                  width: 230,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(.4),
                            offset: Offset(0,3),
                            blurRadius: 3,
                            spreadRadius: 1
                        ),
                      ],
                      border: Border.all(color: Colors.grey)
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                       children: [
                         SizedBox(width: 25,),
                         Container(
                             width: 40,
                             height: 40,
                             color: Colors.grey,
                             child: Image.asset('assets/logo-orange.jpg',fit: BoxFit.cover,)
                         ),
                         SizedBox(width: 15,),
                         Text('Orange',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:Colors.black),)
                       ],
                     ),
                      Container(
                        margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call,color:Colors.black))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*141#');
                },
                child: Container(
                  width: 230,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(.4),
                            offset: Offset(0,3),
                            blurRadius: 3,
                            spreadRadius: 1
                        ),
                      ],
                      border: Border.all(color: Colors.grey)
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                       children: [
                         SizedBox(width: 25,),
                         Container(
                             width: 40,
                             height: 40,
                             child: Image.asset('assets/MTN-Logo.png',fit: BoxFit.cover,)
                         ),
                         SizedBox(width: 15,),
                         Text('MTN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:Colors.black),)
                       ],
                     ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call,color:Colors.black))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*825*1*3#');
                },
                child: Container(
                  width: 230,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(.4),
                            offset: Offset(0,3),
                            blurRadius: 3,
                            spreadRadius: 1
                        ),
                      ],
                      border: Border.all(color: Colors.grey)
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                       children: [
                         SizedBox(width: 25,),
                         Container(
                             width: 40,
                             height: 40,
                             child: Image.asset('assets/camtel_logo.jpg',fit: BoxFit.cover,)
                         ),
                         SizedBox(width: 15,),
                         Text('Camtel',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:Colors.black),)
                       ],
                     ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call,color:Colors.black))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*600#');
                },
                child: Container(
                  width: 230,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                            color: Colors.blueGrey.withOpacity(.4),
                            offset: Offset(0,3),
                            blurRadius: 3,
                            spreadRadius: 1
                        ),
                      ],
                      border: Border.all(color: Colors.grey)
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Row(
                      children: [
                        SizedBox(width: 25,),
                        Container(
                            width: 40,
                            height: 40,
                            child: Image.asset('assets/Nexttel-Cameroon-Logo.png',fit: BoxFit.cover,)
                        ),
                        SizedBox(width: 15,),
                        Text('Nexttel',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17,color:Colors.black),)
                      ],
                    ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call,color:Colors.black))
                    ],
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
