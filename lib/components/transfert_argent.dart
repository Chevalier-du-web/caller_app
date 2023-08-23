import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'button.dart';

class TransfertArgent extends StatefulWidget {
  const TransfertArgent({Key? key, required this.type}) : super(key: key);
  final int type;

  @override
  State<TransfertArgent> createState() => _TransfertArgentState();
}

class _TransfertArgentState extends State<TransfertArgent> {
  TextEditingController _montant = TextEditingController();
  TextEditingController _telephone = TextEditingController();
  int same_phone = 0;
  double frais = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfert d\'argent'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Container(
                padding: EdgeInsets.all(20),
                width: 250,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(width: 4,color: Colors.grey)
                ),
                child: Center(
                  child: Text('  Réseau :  ${widget.type==1?'orange':'MTN'}',
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                ),
              ),

              SizedBox(height: 20,),

              same_phone !=1?Column(
                children: [

                  CustomButton(onpressed: (){
                    setState(() {
                      same_phone = 1;
                    });
                  }, title: 'Vers un numéro ${widget.type==1?'orange':'MTN'}',),
                  SizedBox(height: 20,),

                  CustomButton(onpressed:  ()async{
                    widget.type==1?await FlutterPhoneDirectCaller.callNumber('#150*1*3*#')
                        :await FlutterPhoneDirectCaller.callNumber('*126#');
                  }, title: 'Vers un autre opérateur',),
                  SizedBox(height: 200,)
                ],
              ):EnvoiTransaction()
            ],
          ),
        ),
      ),
    );
  }
  Widget EnvoiTransaction(){
    return Container(
      child: Column(
        children: [

          Container(
            width: 270,
            margin: EdgeInsets.only(top: 6),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.transparent,

            ),
            child: TextField(
              controller: _telephone,
              style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Saisir le numéro',
                  label: Text("Téléphone du bénéficiaire"),
                  labelStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone)
              ),
              onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            width: 270,
            margin: EdgeInsets.only(top: 6),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.transparent,
                //borderRadius: BorderRadius.circular(20),
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
                    frais=double.parse(value.toString())<100000.0
                        ?double.parse(value.toString())*0.5/100:500.0
                        :frais = 0.0;
                  }else{
                    //tarif mtn ...
                    _montant.text.isNotEmpty?
                    frais=double.parse(value.toString())<100000.0
                        ?double.parse(value.toString())*0.5/100:500.0
                        :frais = 0.0;
                  }
                });
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                  hintText: 'Saisir le montant',
                  labelStyle: TextStyle(fontSize: 16),
                  label: Text("Montant du transfert"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.attach_money)
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
          SizedBox(height: 40,),

          CustomButton(onpressed: ()async{
            widget.type ==1?
            await FlutterPhoneDirectCaller.callNumber('#150*1*1*${_telephone.text}'
                '*${_montant.text}}#'):
            await FlutterPhoneDirectCaller.callNumber('*126*1*1*${_telephone.text}'
                '*${_montant.text}}#');
          }, title: "Transferer"),

          SizedBox(height: 115,)

        ],
      ),
    );
  }
}
