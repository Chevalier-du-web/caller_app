import 'package:flutter/material.dart';

class CalculOrange extends StatefulWidget {
  const CalculOrange({Key? key}) : super(key: key);

  @override
  State<CalculOrange> createState() => _CalculOrangeState();
}

class _CalculOrangeState extends State<CalculOrange> {
  TextEditingController _controllerRetrait = TextEditingController();
  TextEditingController _controllerTransfert = TextEditingController();
  var resultTransfert = 0.0;
  var resultTRetrait = 0.0;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Tarif Orange money'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 60,),
              Text('Frais de transfert d\'argent',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              SizedBox(height: 20,),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all()
                ),
                child: Column(
                  children: [
                    Text('Le tarif est : ${resultTransfert} FCFA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 40,),
                    Container(
                      width: 240,
                      child: Card(
                        child: TextField(
                          controller: _controllerTransfert,
                          keyboardType: TextInputType.number,
                          onChanged: (value){
                            setState(() {
                              _controllerTransfert.text.isNotEmpty?
                              resultTransfert=double.parse(value.toString())<100000.0
                                  ?double.parse(value.toString())*0.5/100:500.0
                                  :resultTransfert = 0.0;
                            });
                          },
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Entrer le montant',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.attach_money)
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 30,),
              Text('Frais de retrait ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15)),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all()
                ),
                child: Column(
                  children: [
                    Text('Le tarif est : ${resultTRetrait} FCFA',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                    SizedBox(height: 40,),
                    Container(
                      width: 240,
                      child: Card(
                        child: TextField(
                          controller: _controllerRetrait,
                          keyboardType: TextInputType.number,
                          onChanged: (value){
                            setState(() {
                              _controllerRetrait.text.isNotEmpty?

                              resultTRetrait= double.parse(value.toString())<3333.0
                                  ?50.0:( double.parse(value.toString())<=233300.0 && double.parse(value.toString())>3333.0)
                                  ?double.parse(value.toString())*1.5/100:3500.0
                                  :resultTRetrait = 0.0;
                            });
                          },
                          // keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              hintText: 'Entrer le montant',
                              border: InputBorder.none,
                              prefixIcon: Icon(Icons.attach_money)
                          ),
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
