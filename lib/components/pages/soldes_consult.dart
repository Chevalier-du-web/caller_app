import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import '../custom_card.dart';


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
              Container(
                width: 250,
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text('Choix du réseau ',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                ),
              ),
              SizedBox(height: 40,),
              CustomCard(
                onpressed: () {                   SoldOrange();
              },
                image: 'assets/logo-orange.jpg',
                title: 'ORANGE',
                type: 1,
              ),
              
              SizedBox(height: 20,),
              CustomCard(
                onpressed: () {
                  SoldMTN();
                },
                image: 'assets/MTN-Logo.png',
                title: 'MTN',
                type: 1,
              ),

              SizedBox(height: 20,),
              CustomCard(
                onpressed: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*825*3*2*1#');
                },
                image: 'assets/camtel_logo.jpg',
                title: 'CAMTEL',
                type: 1,
              ),

              SizedBox(height: 20,),
              CustomCard(
                onpressed: ()async{
                  await FlutterPhoneDirectCaller.callNumber('*801#');
                },
                image: 'assets/Nexttel-Cameroon-Logo.png',
                title: 'NEXTTEL',
                type: 1,
              ),


            ],
          ),
        ),
      ),
    );
  }

  Future SoldOrange(){
    return showModalBottomSheet(
        context: context,
        elevation: 9,
        isDismissible: true,
        showDragHandle: true,
        enableDrag: true,
        shape:RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(50),
                topLeft:  Radius.circular(50))),
        builder: (BuildContext context){
      return Container(
        height: 200,
        child:Column(
          children: [
            SizedBox(height: 10,),
            Text('Choix du compte ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            InkWell(
              onTap: ()async{

                Navigator.pop(context);
                await FlutterPhoneDirectCaller.callNumber('#150*6*2#');


              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color:Colors.grey),
                    borderRadius: BorderRadius.circular(10)

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SizedBox(width: 9,),
                        Container(
                          height: 45,
                          width: 45,
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
                            fontSize: 16,fontWeight: FontWeight.bold
                        ),)
                      ],
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Icon(Icons.call,color: Colors.teal,))
                  ],
                ),
              ),
            ),

            InkWell(
              onTap: ()async{

                Navigator.pop(context);
                await FlutterPhoneDirectCaller.callNumber('#123#');


              },
              child: Container(
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color:Colors.grey),
                    borderRadius: BorderRadius.circular(10)

                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                   Row(
                     children: [
                       SizedBox(width: 9,),
                       Container(
                         height: 45,
                         width: 45,
                       decoration: BoxDecoration(
                         color: Colors.transparent,
                         borderRadius: BorderRadius.circular(90),
                         image: DecorationImage(
                           image: AssetImage('assets/logo-orange.jpg'),
                           fit: BoxFit.cover
                         )
                       ),
                       ),
                       SizedBox(width: 25,),
                       Text('Credit principal',style: TextStyle(
                           fontSize: 16,fontWeight: FontWeight.bold
                       ),)
                     ],
                   ),
                    Container(
                        margin: EdgeInsets.only(right: 15),
                        child: Icon(Icons.call,color: Colors.teal,))
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
                             fontSize: 19,fontWeight: FontWeight.bold
                         ),)
                       ],
                     ),
                      Container(
                          margin: EdgeInsets.only(right: 15),
                          child: Icon(Icons.call,color: Colors.teal,))
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
                            height: 45,
                            width: 45,
                           decoration: BoxDecoration(

                               borderRadius: BorderRadius.circular(90),
                               image: DecorationImage(
                                 image: AssetImage('assets/MTN-Logo.png'),
                                 fit: BoxFit.cover
                                 // fit: BoxFit.cover
                               )
                           ),
                          ),
                          SizedBox(width: 25,),
                          Text('Credit principal',style: TextStyle(
                              fontSize: 16,fontWeight: FontWeight.bold
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
