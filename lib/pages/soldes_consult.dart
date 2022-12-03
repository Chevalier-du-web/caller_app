import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class SoldConsult extends StatefulWidget {
  const SoldConsult({Key? key}) : super(key: key);

  @override
  State<SoldConsult> createState() => _SoldConsultState();
}

class _SoldConsultState extends State<SoldConsult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mon solde'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text('Quel solde voulez-vous consulter ?',
                style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
              SizedBox(height: 40,),
              GestureDetector(
                onTap: (){
                  SoldOrange();
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
                             child: Image.asset('assets/logo-orange.jpg',fit: BoxFit.cover,)
                         ),
                         SizedBox(width: 15,),
                         Text('Orange',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
                       ],
                     ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: (){
                  SoldMTN();
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
                          Text('MTN',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*825#');
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
                          Text('Camtel',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              GestureDetector(
                onTap: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*801#');
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
                          Text('Nexttel',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),)
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 10),
                          child: Icon(Icons.call))
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

  Future SoldOrange(){
    return showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 200,
        child:Column(
          children: [
            SizedBox(height: 10,),
            GestureDetector(
              onTap: ()async{

                Navigator.pop(context);
                await FlutterPhoneDirectCaller.callNumber('#150*6*2#');


              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color:Colors.grey)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 9,),
                        Container(
                          height: 60,
                          width: 60,
                          decoration: BoxDecoration(
                              color: Colors.yellow,
                              borderRadius: BorderRadius.circular(150),
                              image: DecorationImage(
                                image: AssetImage('assets/orangemoney.jpg'),
                                // fit: BoxFit.cover
                              )
                          ),
                        ),
                        SizedBox(width: 25,),
                        Text('Orange money',style: TextStyle(
                            fontSize: 19,fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Icon(Icons.call))
                  ],
                ),
              ),
            ),

            GestureDetector(
              onTap: ()async{

                Navigator.pop(context);
                await FlutterPhoneDirectCaller.callNumber('#123#');


              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color:Colors.grey)
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Row(
                     children: [
                       SizedBox(width: 9,),
                       Container(
                         height: 60,
                         width: 70,
                         child: Image.asset('assets/logo-orange.jpg'),
                       ),
                       SizedBox(width: 25,),
                       Text('Credit principal',style: TextStyle(
                           fontSize: 19,fontWeight: FontWeight.bold
                       ),)
                     ],
                   ),
                    Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Icon(Icons.call))
                  ],
                ),
              ),
            )
          ],
        ),
      );
    });

  }

  Future SoldMTN(){
    return showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 200,
          child:Column(
            children: [
              SizedBox(height: 10,),
              GestureDetector(
                onTap: ()async{

                  Navigator.pop(context);
                  await FlutterPhoneDirectCaller.callNumber('*126#');


                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color:Colors.grey)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                     Row(
                       children: [
                         SizedBox(width: 9,),
                         Container(
                           height: 60,
                           width: 60,
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
                             fontSize: 19,fontWeight: FontWeight.bold
                         ),)
                       ],
                     ),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Icon(Icons.call))
                    ],
                  ),
                ),
              ),

              GestureDetector(
                onTap: ()async{

                  Navigator.pop(context);
                  await FlutterPhoneDirectCaller.callNumber('*155#');


                },
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color:Colors.grey)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SizedBox(width: 9,),
                          Container(
                            height: 60,
                            width: 70,
                            child: Image.asset('assets/MTN-Logo.png'),
                          ),
                          SizedBox(width: 25,),
                          Text('Credit principal',style: TextStyle(
                              fontSize: 19,fontWeight: FontWeight.bold
                          ),)
                        ],
                      ),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Icon(Icons.call))
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
