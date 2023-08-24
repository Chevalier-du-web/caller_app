import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import '../components/button.dart';

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
        title: Text('Transfert de credit '
            '${widget.type==0?"Orange":widget.type==1?"Mtn":
        widget.type==2?"Camtel":"Nexttel"}'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: _h/12,),
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Remplissez le formulaire',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
              SizedBox(height: _h/14,),
              Center(
                child: Container(
                  width: 270,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    //border: Border.all(),borderRadius: BorderRadius.circular(0)
                  ),
                  child: TextField(
                    controller: phoneSaisi,
                    keyboardType: TextInputType.phone,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      label: Text("Téléphone"),
                        hintText: 'Saisir le numéro',
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.call),
                        hintStyle: TextStyle(fontSize: 16)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Center(
                child: Container(
                  width: 270,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    //border: Border.all(),borderRadius: BorderRadius.circular(0)
                  ),
                  child: TextField(
                    controller: montantSaisi,
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Montant'),
                        prefixIcon: Icon(Icons.monetization_on_outlined),
                        hintStyle: TextStyle(fontSize: 16)
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40,),
              CustomButton(onpressed: () async{

                  //lancement de l'appel
                  await FlutterPhoneDirectCaller.callNumber(
                      widget.type==0?
                      '#189*1*${phoneSaisi.text}*${montantSaisi.text}#'
                          :'*150*${montantSaisi.text}*${phoneSaisi.text}#');

              }, title: 'Composer',),

            ],
          ),
        ),
      ),
    );
  }
}
