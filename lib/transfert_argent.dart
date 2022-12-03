import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transfert d\'argent'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 40,),
              Text('Reseau : ${widget.type==1?'orange':'MTN'}',
                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),

              SizedBox(height: 70,),

              same_phone !=1?Column(
                children: [
                  GestureDetector(
                    onTap: (){
                      setState(() {
                        same_phone = 1;
                      });
                    },
                    child: Container(
                      width: 240,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text('Vers un numero ${widget.type==1?'orange':'MTN'}',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  GestureDetector(
                    onTap: ()async{
                      widget.type==1?await FlutterPhoneDirectCaller.callNumber('#150*1*3*#')
                          :await FlutterPhoneDirectCaller.callNumber('*126#');
                    },
                    child: Container(
                      width: 240,
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(color: Colors.grey)
                      ),
                      child: Center(
                        child: Text('Vers un autre operateur',
                          style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                      ),
                    ),
                  )
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

          Text('Telephone du beneficiaire'),
          Container(
            width: 220,
            margin: EdgeInsets.only(top: 6),
            padding: EdgeInsets.only(left: 15),
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: Colors.blue,width: 2)
            ),
            child: TextField(
              controller: _telephone,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                  hintText: 'Telephone',
                  focusedBorder: InputBorder.none,
                  border: InputBorder.none
              ),
              onEditingComplete: ()=>FocusScope.of(context).nextFocus(),
            ),
          ),
          SizedBox(height: 20,),
          Text('Montant du transfert'),
          Container(
            width: 220,
            margin: EdgeInsets.only(top: 6),
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
          SizedBox(height: 40,),
          Container(
            width: 200,
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(onPressed: ()async{
                    widget.type ==1?
                    await FlutterPhoneDirectCaller.callNumber('#150*1*1*${_telephone.text}'
                        '*${_montant.text}}#'):
                    await FlutterPhoneDirectCaller.callNumber('*126*1*1*${_telephone.text}'
                        '*${_montant.text}}#');
          },
                    style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(Colors.blue),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)
                            )
                        )
                    ),
                    child:
                    Padding(
                      padding: EdgeInsets.fromLTRB(35, 15, 35, 15),
                      child: Text('Composer',style: TextStyle(
                          fontSize: 18,color: Colors.white

                      ),),
                    ),),

                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
