import 'package:caller/components/button.dart';
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
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          children: [
            SizedBox(height: 60,),
              Container(
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                  child: Text('Quelle recharge desirez-vous ?',
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)),
            SizedBox(height: 70,),
            CustomButton(onpressed: ()=>ChoixReseaux('credit'), title: 'Recharge de credit'),

            SizedBox(height: 30,),
            CustomButton(onpressed: ()=>ChoixReseaux('internet'), title: 'Recharge internet'),
            SizedBox(height: 190,)


          ],
        ),
      ),
    );
  }

  Future ChoixReseaux(String type){
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
        child: Column(
          children: [
            SizedBox(height: 5,),
            Text('Rechargez avec  ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            SizedBox(height: 7,),

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
                    border: Border.all(color:Colors.grey),
                    borderRadius: BorderRadius.circular(10)

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
                    border: Border.all(color:Colors.grey),
                    borderRadius: BorderRadius.circular(10)

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
