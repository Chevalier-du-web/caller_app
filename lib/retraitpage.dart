import 'package:caller/choix_reseau.dart';
import 'package:caller/option_money.dart';
import 'package:caller/pages/callbox_page.dart';
import 'package:caller/pages/tarif_mtn.dart';
import 'package:caller/pages/tarif_orange.dart';
import 'package:caller/transfert_argent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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

          Container(
            margin: EdgeInsets.only(top: _h/12),
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey)
            ),
            child: Text('Que voulez-vous faire ?',
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),),
          ),

          SizedBox(height: 40,),
          Center(
            child: Container(
              width: 250,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: ()=>ChoixReseaux('retrait'),
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
                          child: Text('Retrait d\'argent',style: TextStyle(
                              fontSize: 16,color: Colors.white

                          ),),
                        ),),

                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              width: 250,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: ()=>ChoixReseaux('transfert'),
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
                        child: Text('Transfert d\'argent',style: TextStyle(
                            fontSize: 16,color: Colors.white

                        ),),
                      ),),

                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              width: 250,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: ()=>ChoixReseaux('callbox'),
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
                        child: Text('Call box (transfert)',style: TextStyle(
                            fontSize: 16,color: Colors.white

                        ),),
                      ),),

                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 20,),
          Center(
            child: Container(
              width: 250,
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(onPressed: ()=>ChoixReseaux('tarifs'),
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
                        child: Text('Tarification',style: TextStyle(
                            fontSize: 16,color: Colors.white

                        ),),
                      ),),

                  )
                ],
              ),
            ),
          )

        ],
      )
    );
  }
  Future ChoixReseaux(String type){
    return showModalBottomSheet(context: context, builder: (BuildContext context){
      return Container(
        height: 200,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Text('Choix du reseau ',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                type =='retrait'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RetraitArgent(type: 1,)))
                    : type =='transfert'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TransfertArgent(type: 1,)))
                : type =='callbox'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CallBoxPage(type: 0)))
                    :Navigator.push(context, MaterialPageRoute(builder: (context)=>TarifsOrange()));

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
            GestureDetector(
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
            )
          ],
        ),
      );
    });
  }
}
