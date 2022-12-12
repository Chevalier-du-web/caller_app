import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class RechargePage extends StatefulWidget {
  const RechargePage({Key? key}) : super(key: key);

  @override
  State<RechargePage> createState() => _RechargePageState();
}

class _RechargePageState extends State<RechargePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recharge'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 60,),
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey)
                ),
                  child: Text('Quel forfait desirez-vous ?',
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
            SizedBox(height: 70,),
            Center(
              child: Container(
                width: 250,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed: ()=>ChoixReseaux('credit'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            )
                        ),
                        child:
                        Padding(
                          padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text('Recharge credit',style: TextStyle(
                              fontSize: 18,color: Colors.white

                          ),),
                        ),),

                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 30,),
            Center(
              child: Container(
                width: 250,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed: ()=>ChoixReseaux('internet'),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue),
                            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)
                                )
                            )
                        ),
                        child:
                        Padding(
                          padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                          child: Text('Recharge internet',style: TextStyle(
                              fontSize: 18,color: Colors.white

                          ),),
                        ),),

                    )
                  ],
                ),
              ),
            )
          ],
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
            SizedBox(height: 5,),
            Text('Rechargez avec  ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            GestureDetector(
              onTap: ()async{
                print(type);
                Navigator.pop(context);
                type =='credit'?
                await FlutterPhoneDirectCaller.callNumber('#150*2*1#')
                    :  await FlutterPhoneDirectCaller.callNumber('#150*2*2#');


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
              ),
            ),
            GestureDetector(
              onTap: ()async{
                print(type);
                Navigator.pop(context);
                type =='credit'?
                await FlutterPhoneDirectCaller.callNumber('*126#')
                    :  await FlutterPhoneDirectCaller.callNumber('*126#');


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
