import 'package:flutter/material.dart';

class TarifsMTN extends StatelessWidget {
  const TarifsMTN({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarif MTN'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                width: 250,
                margin: EdgeInsets.only(top: 50),
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(150),
                          image: DecorationImage(
                            image: AssetImage('assets/mtnmoney.jpg'),
                            // fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Mobile money',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border:Border.all()
                ),
              ),
              Divider(),
              // tableau des tarifs ..
              Container(
                height: 320,
                //width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/mtntransf.PNG'),
                      //fit: BoxFit.cover
                    )
                ),
              ),
              Divider(),
              Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/mtnretrai.PNG'),
                      //fit: BoxFit.cover
                    )
                ),
              ),
              Divider(),
              Container(
                height: 350,
                width: 300,
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    image: DecorationImage(
                      image: AssetImage('assets/mtn.PNG'),
                      //fit: BoxFit.cover
                    )
                ),
              ),
              SizedBox(height: 50,)


            ],
          ),
        ),
      ),
    );
  }
}
