import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:adaptive_theme/adaptive_theme.dart';

import '../custom_card.dart';


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
        title: Text('Paiement de facture'),
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
                    child: Text('Choix de la facture',
                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                  )),
              SizedBox(height: 40,),
              CustomCard(onpressed: ()=>ChoixReseaux('eneo'), image: 'assets/eneo.jpg', title: 'ENEO prépayé', type: 0,),

              SizedBox(height: 12,),
              CustomCard(onpressed: ()=>ChoixReseaux('camwater'), image: 'assets/cam_water.jpg', title: 'CAMWATER', type: 0,),

              SizedBox(height: 12,),
              CustomCard(onpressed: ()=>ChoixReseaux('impots'), image: 'assets/impot.png', title: 'IMPOTS', type: 0,),


              SizedBox(height: 12,),
              CustomCard(onpressed: ()=>ChoixReseaux('canal'), image: 'assets/canalplus.png', title: 'CANAL+', type: 0,),

            ],
          ),
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
            borderRadius: BorderRadius.only(topRight: Radius.circular(50),
                topLeft:  Radius.circular(50))),
        builder: (BuildContext context){
      return Container(
        height: 220,
        child: Column(
          children: [
            SizedBox(height: 5,),
            Text('Payez avec  ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
          SizedBox(height: 7),

          //paiement orange ...
            InkWell(
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
            InkWell(
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
