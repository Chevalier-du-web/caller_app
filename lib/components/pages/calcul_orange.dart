import 'package:flutter/material.dart';

class CalculOrange extends StatefulWidget {
  const CalculOrange({Key? key}) : super(key: key);

  @override
  State<CalculOrange> createState() => _CalculOrangeState();
}

class _CalculOrangeState extends State<CalculOrange> {
  TextEditingController _controllerRetrait = TextEditingController();
  TextEditingController _controllerTarif = TextEditingController();
  var resultTransfert = 0.0;
  var resultTRetrait = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tarif Orange money'),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Frais d\'envoi :',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      Text('${resultTransfert} FCFA',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                    ],
                  )),

              Container(
                width: 310,
                  padding: EdgeInsets.only(left: 40,right: 40,top: 20,bottom: 20),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.grey.withOpacity(.2),
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Frais de retrait : ',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                      Text('${resultTRetrait} FCFA',
                        style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14),),
                    ],
                  )),


              Container(
                width: 310,
                margin: EdgeInsets.only(top: 20),
                child: TextField(
                  controller: _controllerTarif,
                  style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
                  keyboardType: TextInputType.number,
                  onChanged: (value){
                    setState(() {
                      _controllerTarif.text.isNotEmpty?
                      resultTransfert=double.parse(value.toString())<100000.0
                          ?double.parse(value.toString())*0.5/100:500.0
                          :resultTransfert = 0.0;

                      _controllerTarif.text.isNotEmpty?

                      resultTRetrait= double.parse(value.toString())<3333.0
                          ?50.0:( double.parse(value.toString())<=233300.0 && double.parse(value.toString())>3333.0)
                          ?double.parse(value.toString())*1.5/100:3500.0
                          :resultTRetrait = 0.0;


                    });
                  },
                  // keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      label: Text('Entrer le montant'),
                      labelStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),
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
