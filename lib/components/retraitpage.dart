import 'package:caller/components/pages/callbox_page.dart';
import 'package:caller/components/pages/tarif_mtn.dart';
import 'package:caller/components/pages/tarif_orange.dart';
import 'package:caller/components/transfert_argent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'button.dart';
import 'header_title.dart';
import 'option_money.dart';

class RetraitPage extends StatefulWidget {
  const RetraitPage({Key? key}) : super(key: key);

  @override
  State<RetraitPage> createState() => _RetraitPageState();
}

class _RetraitPageState extends State<RetraitPage> {


  @override
  Widget build(BuildContext context) {
  double _h = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        children: [

         // HeaderTitle()

          SizedBox(height: MediaQuery.of(context).size.height/18,),

          CustomButton(onpressed: ()=>ChoixReseaux('retrait'), title: 'Retrait d\'argent',),
          SizedBox(height: 10,),
          CustomButton(onpressed: ()=>ChoixReseaux('transfert'), title: 'Transfert d\'argent',),
          SizedBox(height: 10,),
          CustomButton(onpressed: ()=>ChoixReseaux('callbox'), title: 'CallBox (transfert)',),
          SizedBox(height: 10,),
          CustomButton(onpressed: ()=>ChoixReseaux('tarifs'), title: 'Tarification',),



        ],
      )
    );
  }
  Future ChoixReseaux(String type){
    return showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
              topRight: Radius.circular(50)),
        ),
        context: context,
        isScrollControlled: true,
        showDragHandle: true,
        builder: (BuildContext context){
      return Container(
        height: type=='callbox'?MediaQuery.of(context).size.height-240:220,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.only(topRight: Radius.circular(40))
        ),
        child: Column(
          children: [
            SizedBox(height: 5,),
            Text('Choix du réseau ',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            SizedBox(height: 7,),
            InkWell(
              onTap: (){
                Navigator.pop(context);
                type =='retrait'?
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => RetraitArgent(type: 1,),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                )
                    : type =='transfert'?
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TransfertArgent(type: 1,),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                )
                : type =='callbox'?
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => CallBoxPage(type: 0,),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                )
                    :
                Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) => TarifsOrange(),
                    transitionsBuilder: (context, animation, secondaryAnimation, child) {
                      return FadeTransition(
                        opacity: animation,
                        child: child,
                      );
                    },
                  ),
                );

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
                            image: AssetImage(type =='callbox'?'assets/logo-orange.jpg':'assets/orangemoney.jpg'),
                             fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(width: 25,),
                    Text(type =='callbox'?'Orange':'Orange money',style: TextStyle(
                      fontSize: 17,fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: (){
                print(type);
                Navigator.pop(context);
                type =='retrait'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RetraitArgent(type: 2,)))
                    : type =='transfert'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TransfertArgent(type: 2,)))
                :type =='callbox'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CallBoxPage(type: 1 )))
                    : Navigator.push(context, MaterialPageRoute(builder: (context)=>TarifsMTN()));
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
                            image: AssetImage(type =='callbox'?'assets/MTN-Logo.png':'assets/mtnmoney.jpg'),
                             fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(width: 25,),
                    Text(type =='callbox'?'MTN':'MTN MoMo',style: TextStyle(
                        fontSize: 17,fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ),
            // Camtel
            type =='callbox'?InkWell(
              onTap: (){
                Navigator.pop(context);
                type =='retrait'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RetraitArgent(type: 1,)))
                    : type =='transfert'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TransfertArgent(type: 1,)))
                    : type =='callbox'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CallBoxPage(type: 2)))
                    :Navigator.push(context, MaterialPageRoute(builder: (context)=>TarifsOrange()));

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
                              image: AssetImage('assets/camtel_logo.jpg'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(width: 25,),
                    Text("Camtel",style: TextStyle(
                        fontSize: 17,fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ):Container(),

            // Nexttel
            type =='callbox'?InkWell(
              onTap: (){
                Navigator.pop(context);
                type =='retrait'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RetraitArgent(type: 1,)))
                    : type =='transfert'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TransfertArgent(type: 1,)))
                    : type =='callbox'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CallBoxPage(type: 3)))
                    :Navigator.push(context, MaterialPageRoute(builder: (context)=>TarifsOrange()));

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
                              image: AssetImage('assets/Nexttel-Cameroon-Logo.png'),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(width: 25,),
                    Text("Nexttel",style: TextStyle(
                        fontSize: 17,fontWeight: FontWeight.bold
                    ),)
                  ],
                ),
              ),
            ):Container(),
          ],
        ),
      );
    });
  }
}
