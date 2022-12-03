import 'package:caller/choix_reseau.dart';
import 'package:caller/option_money.dart';
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
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 40,),
          Container(
            padding: EdgeInsets.all(18),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(color: Colors.grey)
            ),
            child: Text('Que voulez-vous faire ?',
            style: TextStyle(fontSize: 20,
                fontWeight: FontWeight.bold),),
          ),

          SizedBox(height: 60,),
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
          SizedBox(height: 30,),
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
            SizedBox(height: 15,),
            GestureDetector(
              onTap: (){
                Navigator.pop(context);
                type =='retrait'?
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RetraitArgent()))
                    : Navigator.push(context, MaterialPageRoute(builder: (context)=>TransfertArgent(type: 1,)));


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
                Navigator.push(context, MaterialPageRoute(builder: (context)=>RetraitArgent()))
                    : Navigator.push(context, MaterialPageRoute(builder: (context)=>TransfertArgent(type: 2,)));


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
