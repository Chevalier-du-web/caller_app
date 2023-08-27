import 'package:caller/components/button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

class Composer extends StatefulWidget {
  const Composer({Key? key}) : super(key: key);

  @override
  State<Composer> createState() => _ComposerState();
}

class _ComposerState extends State<Composer> {
  TextEditingController codeSaisi = TextEditingController();
  @override
  Widget build(BuildContext context) {
    double _h = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(title: Text('Composer un code'),),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          children: [
            SizedBox(height: _h/12,),
            Container(
              width: 250,
                padding: EdgeInsets.all(17),
                decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                  borderRadius: BorderRadius.circular(10)
                ),
                child: Center(
                  child: Text('Entrez votre code ',
                    style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                )),
            SizedBox(height: _h/13,),
            Center(
              child: Container(
                width: 260,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  //border: Border.all(),borderRadius: BorderRadius.circular(0)
                ),
                child: TextField(
                  controller: codeSaisi,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(fontSize: 15),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    label: Text("Saisissez votre code"),
                    hintText: 'Saisir un code',
                    prefixIcon: Icon(Icons.call,color: Colors.teal,),
                    hintStyle: TextStyle(fontSize: 15)
                  ),
                ),
              ),
            ),
            SizedBox(height: 30,),
            CustomButton(
                onpressed: ()async{
                  //lancement de l'appel
                  await FlutterPhoneDirectCaller.callNumber(codeSaisi.text);
                }, title: 'Composer',
            ),
            SizedBox(height: 160,)

          ],
        ),
      ),
    );
  }
}
