import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class RetraitArgent extends StatelessWidget {
  const RetraitArgent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController _codeMarchant = new TextEditingController();
    TextEditingController _phone = new TextEditingController();
    TextEditingController _montant = new TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text('Formulaire de retrait'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            child: Column(
              children: [
                SizedBox(height: 10,),
                SizedBox(height: 20,),
                Container(
                    margin: EdgeInsets.only(right: 66,bottom: 7),
                    child: Text('Code marchant',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                Container(
                  width: 220,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue,width: 2)
                  ),
                  child: TextField(
                    controller: _codeMarchant,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Entrer le code marchant',
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none
                    ),
                    onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
                  ),
                ),
                SizedBox(height: 20,),

                //numero de telephone ...
                Container(
                    margin: EdgeInsets.only(right: 20,bottom: 7),
                    child: Text('      Telephone du beneficiaire',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                Container(
                  width: 220,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue,width: 2)
                  ),
                  child: TextField(
                    controller: _phone,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Telephone',
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none
                    ),
                    onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
                  ),
                ),
                SizedBox(height: 20,),

                //numero de telephone ...
                Container(
                    margin: EdgeInsets.only(right: 39,bottom: 7),
                    child: Text('Montant du retrait',style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),)),
                Container(
                  width: 220,
                  padding: EdgeInsets.only(left: 15),
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: Colors.blue,width: 2)
                  ),
                  child: TextField(
                    controller: _montant,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Montant',
                        focusedBorder: InputBorder.none,
                        border: InputBorder.none
                    ),
                    onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
                  ),
                ),
                SizedBox(height: 30,),
                ElevatedButton(onPressed: ()async{
                  await FlutterPhoneDirectCaller.callNumber('#150*14*${_codeMarchant.text}'
                      '*${_phone.text}*${_montant.text}#');
                },
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(45, 15, 45, 15),
                    child: Text('Composer',style: TextStyle(
                        fontSize: 18,color: Colors.white

                    ),),
                  ),
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)
                          )
                      )
                  ),)

              ],
            ),
          ),
        ),
      ),
    );
  }
}
