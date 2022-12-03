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
    return Scaffold(
      appBar: AppBar(title: Text('Composer un code'),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50,),
            Text('Entrez votre code :',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            SizedBox(height: 70,),
            Center(
              child: Container(
                width: 260,
                padding: EdgeInsets.only(left: 10),
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  border: Border.all(),borderRadius: BorderRadius.circular(20)
                ),
                child: TextField(
                  controller: codeSaisi,
                  keyboardType: TextInputType.phone,
                  style: TextStyle(fontSize: 22),
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: 'Ecrire un code',
                    prefixIcon: Icon(Icons.call),
                    hintStyle: TextStyle(fontSize: 16)
                  ),
                ),
              ),
            ),
            Container(
              width: 200,
              margin: EdgeInsets.only(top: 40),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()async{
            //lancement de l'appel
            await FlutterPhoneDirectCaller.callNumber(codeSaisi.text);
            },
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Text('Composer',style: TextStyle(color: Colors.white,fontSize: 17),),
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue)
                      ),

                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
