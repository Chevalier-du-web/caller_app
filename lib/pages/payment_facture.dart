import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

class PaymentFacture extends StatefulWidget {
  const PaymentFacture({Key? key}) : super(key: key);

  @override
  State<PaymentFacture> createState() => _PaymentFactureState();
}

class _PaymentFactureState extends State<PaymentFacture> {
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
        title: Text('Facture'),
      ),

      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Text('Choix de la facture',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: ()=>ChoixReseaux('eneo'),
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
                          SizedBox(width: 5,),
                          Container(
                              width: 80,
                              height: 40,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    image: AssetImage('assets/eneo.jpg'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(width: 4,),
                          Text('ENEO prépayé',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color:Colors.black,),)
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call,color:Colors.black))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              GestureDetector(
                onTap:()=>ChoixReseaux('camwater'),
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
                          SizedBox(width: 5,),
                          Container(
                              width: 80,
                              height: 40,
                            decoration: BoxDecoration(
                                color: Colors.transparent,
                                image: DecorationImage(
                                    image: AssetImage('assets/cam_water.jpg'),
                                    fit: BoxFit.cover
                                )
                            ),
                          ),
                          SizedBox(width: 5,),
                          Text('CAMWATER',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color:Colors.black),)
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call,color:Colors.black))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              GestureDetector(
                onTap: ()=>ChoixReseaux('impots'),
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
                          SizedBox(width: 5,),
                          Container(
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/impot.png',fit: BoxFit.cover,)
                          ),
                          SizedBox(width: 8,),
                          Text('IMPOTS',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 11,color:Colors.black),)
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call,color:Colors.black))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 12,),
              GestureDetector(
                onTap: ()=>ChoixReseaux('canal'),
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
                          SizedBox(width: 5,),
                          Container(
                              width: 40,
                              height: 40,
                              child: Image.asset('assets/canalplus.png',fit: BoxFit.cover,)
                          ),
                          SizedBox(width: 8,),
                          Text('CANAL+',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 12,color:Colors.black),)
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

  Future ChoixReseaux(String type){
    return showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 200,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Payez avec  ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),)
            //paiement orange ...
            ,GestureDetector(
              onTap: ()async{

                Navigator.pop(context);
                type =='eneo'?
                await FlutterPhoneDirectCaller.callNumber('#150*3*1*4*1#')
                    :type =='camwater'?  await FlutterPhoneDirectCaller.callNumber('#150*3*3#')
                    :type =='impots'?  await FlutterPhoneDirectCaller.callNumber('#150*3*4#'):null;


              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color:Colors.grey)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 9,),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(150),
                          image: DecorationImage(
                              image: AssetImage('assets/orangemoney.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(width: 25,),
                    Text('Orange money',style: TextStyle(
                        fontSize: 16,fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),
            //paiement Mtn
            GestureDetector(
              onTap: ()async{

                Navigator.pop(context);
                type =='eneo'?
                await FlutterPhoneDirectCaller.callNumber('*126#')
                    :type =='camwater'?  await FlutterPhoneDirectCaller.callNumber('*126#')
                    :type =='impots'?  await FlutterPhoneDirectCaller.callNumber('*126#')
                    : await FlutterPhoneDirectCaller.callNumber('*126#');


              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color:Colors.grey)
                ),
                child: Row(
                  children: [
                    SizedBox(width: 9,),
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(150),
                        image: DecorationImage(
                          image: AssetImage('assets/mtnmoney.jpg'),
                          // fit: BoxFit.cover
                        )
                      ),
                    ),
                    SizedBox(width: 25,),
                    Text('MTN MoMo',style: TextStyle(
                        fontSize: 16,fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
