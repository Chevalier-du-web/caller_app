import 'package:flutter/material.dart';

class TarifsOrange extends StatelessWidget {
  const TarifsOrange({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarif orange'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(top: 50),
                width: 250,
                child: Row(
                  children: [
                    Container(
                      height: 45,
                      width: 45,
                      decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(150),
                          image: DecorationImage(
                            image: AssetImage('assets/orangemoney.jpg'),
                            // fit: BoxFit.cover
                          )
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text('Orange money',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
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
                height: 350,
                width: 370,
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  image: DecorationImage(
                    image: AssetImage('assets/orange-tarif.PNG'),
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
                      image: AssetImage('assets/orange_tarifs.PNG'),
                      //fit: BoxFit.cover
                    )
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}
