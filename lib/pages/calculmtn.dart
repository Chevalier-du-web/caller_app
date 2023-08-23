import 'package:flutter/material.dart';

class CalculMTN extends StatefulWidget {
  const CalculMTN({Key? key}) : super(key: key);

  @override
  State<CalculMTN> createState() => _CalculMTNState();

}

class _CalculMTNState extends State<CalculMTN> {
  TextEditingController _controllerTarif = TextEditingController();
  TextEditingController _controllerTransfert = TextEditingController();
  var resultTransfert = 0.0;
  var resultTRetrait = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarif Mobile money'),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60,),


              Container(
                  width: 310,
                  padding: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Frais d\'envoi :   ${resultTransfert} FCFA',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),

              Container(
                  width: 310,
                  padding: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Text('Frais de retrait :   ${resultTRetrait} FCFA',
                    style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),)),

              /// partie des saisies du montant


              Container(
                width: 310,
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _controllerTarif,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {

                      _controllerTarif.text.isNotEmpty?
                      resultTRetrait= (double.parse(value.toString())<=2500)
                          ?50.0:(double.parse(value.toString())<=175000.0 &&double.parse(value.toString())>2500)
                          ?double.parse(value.toString())*2/100:3500.0
                          :resultTRetrait = 0.0;

                      _controllerTarif.text.isNotEmpty?
                      resultTransfert= (double.parse(value.toString())<=1000000)
                          ?double.parse(value.toString())*0.5/100:500.0
                          :resultTransfert = 0.0;

                    });
                  },
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Entrer le montant'),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.attach_money,color: Colors.teal,)
                  ),
                ),
              ),

              SizedBox(height: 180,)


            ],
          ),
        ),
      ),
    );
  }
}
