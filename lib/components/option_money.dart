import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'button.dart';


class RetraitArgent extends StatefulWidget {
  const RetraitArgent({Key? key, required this.type}) : super(key: key);
  final int type;

  @override
  State<RetraitArgent> createState() => _RetraitArgentState();
}

class _RetraitArgentState extends State<RetraitArgent> {
  double frais = 0.0;
  TextEditingController _codeMarchant = new TextEditingController();
  TextEditingController _phone = new TextEditingController();
  TextEditingController _montant = new TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Retrait ${ widget.type==1?"Orange Money":"MTN Money"}'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 40,),

                widget.type==1?Container(
                  width: 270,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      //borderRadius: BorderRadius.circular(20),
                      //border: Border.all(color: Colors.blue,width: 2)
                  ),
                  child: TextField(
                    controller: _codeMarchant,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Code marchant',
                        label: Text("Code marchand"),
                        labelStyle: TextStyle(fontSize: 20),
                        border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.security)
                    ),
                    onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
                  ),
                ):
                Container(),

                SizedBox(height: 30,),

                //numero de telephone ...

                Container(
                  width: 270,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(0),
                      //border: Border.all(color: Colors.blue,width: 2)
                  ),
                  child: TextField(
                    controller: _phone,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Téléphone ',
                        label: Text("Téléphone"),
                        labelStyle: TextStyle(fontSize: 17),
                        border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.phone)
                    ),
                    onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
                  ),
                ),
                SizedBox(height: 30,),

                //numero de telephone ...

                Container(
                  width: 270,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      //border: Border.all(color: Colors.blue,width: 2)
                  ),
                  child: TextField(
                    controller: _montant,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    onChanged: (value){
                      setState(() {
                        if (widget.type==1){
                          //tarif orange ...

                          _montant.text.isNotEmpty?
                          frais= double.parse(value.toString())<3333.0
                              ?50.0:( double.parse(value.toString())<=233300.0 && double.parse(value.toString())>3333.0)
                              ?double.parse(value.toString())*1.5/100:3500.0
                              :frais = 0.0;
                        }else{
                          //tarif mtn ...
                          _montant.text.isNotEmpty?
                          frais= (double.parse(value.toString())<=2500)
                              ?50.0:(double.parse(value.toString())<=175000.0 &&double.parse(value.toString())>2500)
                              ?double.parse(value.toString())*2/100:3500.0
                              :frais = 0.0;
                        }
                      });
                    },
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Montant du retrait',
                        label: Text("Montant du retrait"),
                        labelStyle: TextStyle(fontSize: 17),
                        border: OutlineInputBorder(),
                        prefixIcon: Icon(Icons.attach_money_rounded)
                    ),
                    onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
                  ),
                ),
                
                Container(
                  width: 255,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.only(left: 15,top: 20,bottom: 10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10)
                  ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Frais : ',
                          style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                        Text(' $frais FCFA',style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),

                      ],
                    )),
                SizedBox(height: 30,),
                CustomButton(
                  onpressed: ()async{
                    widget.type==1?
                    await FlutterPhoneDirectCaller.callNumber('#150*14*${_codeMarchant.text}'
                        '*${_phone.text}*${_montant.text}#'):
                    await FlutterPhoneDirectCaller.callNumber('*126*14*${_phone.text}*${_montant.text}#')

                    ;
                  },
                title: 'Composer'),
                SizedBox(height: 130,)


              ],
            ),
          ),
        ),
      ),
    );
  }
}
