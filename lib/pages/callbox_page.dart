import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class CallBoxPage extends StatefulWidget {
  const CallBoxPage({Key? key, required this.type}) : super(key: key);
  final int type;

  @override
  State<CallBoxPage> createState() => _CallBoxPageState();
}

class _CallBoxPageState extends State<CallBoxPage> {
  TextEditingController phoneSaisi = TextEditingController();
  TextEditingController montantSaisi = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;


    return Scaffold(
      appBar: AppBar(
        title: Text('Transfert de credit'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: _h/12,),
              Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey)
                  ),
                  child: Text('Remplissez le formulaire',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              SizedBox(height: _h/10,),
              Center(
                child: Container(
                  width: 260,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    //border: Border.all(),borderRadius: BorderRadius.circular(0)
                  ),
                  child: Card(
                    child: TextField(
                      controller: phoneSaisi,
                      keyboardType: TextInputType.phone,
                      style: TextStyle(fontSize: 17,letterSpacing: 3),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Téléphone',
                          prefixIcon: Icon(Icons.call),
                          hintStyle: TextStyle(fontSize: 16)
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Center(
                child: Container(
                  width: 260,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    //border: Border.all(),borderRadius: BorderRadius.circular(0)
                  ),
                  child: Card(
                    child: TextField(
                      controller: montantSaisi,
                      keyboardType: TextInputType.number,
                      style: TextStyle(fontSize:17,letterSpacing: 2),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Montant',
                          prefixIcon: Icon(Icons.monetization_on_outlined),
                          hintStyle: TextStyle(fontSize: 16)
                      ),
                    ),
                  ),
                ),
              ),
              Container(
                width: 200,
                margin: EdgeInsets.only(top: _h/9),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: ()async{
                          //lancement de l'appel
                          await FlutterPhoneDirectCaller.callNumber(
                            widget.type==0?
                              '#189*1*${phoneSaisi.text}*${montantSaisi.text}#'
                          :'*150*${montantSaisi.text}*${phoneSaisi.text}#');
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text('Valider',style: TextStyle(color: Colors.white,fontSize: 17),),
                        ),
                        style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(Colors.blue)
                        ),

                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
