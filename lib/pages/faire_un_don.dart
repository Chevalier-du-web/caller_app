import 'package:caller/components/button.dart';
import 'package:clipboard/clipboard.dart';
import 'package:floating_snackbar/floating_snackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';


class PageDon extends StatefulWidget {
  const PageDon({Key? key}) : super(key: key);

  @override
  State<PageDon> createState() => _PageDonState();
}

class _PageDonState extends State<PageDon> {
  var remerciement = "Je tiens à vous exprimer toute ma gratitude pour votre "
      "généreux don. Votre contribution aura un impact significatif"
      " sur [la cause, l'organisation, etc.] que je soutiens "
      "et je suis très reconnaissant(e) de votre soutien.";
  TextEditingController _controllerMontant = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Faire un don"),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.all(20),
                child: Text(remerciement,
                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,)),

            SizedBox(height: 40,),
            CustomButton(
                onpressed: ()=>ChoixReseaux('orange'),
                title: "Don par Orange money"),
            SizedBox(height: 20,),

            CustomButton(
                onpressed: ()=>ChoixReseaux('mtn'),
                title: "Don par MTN money")
          ],
        ),
      ),

    );
  }
  Future ChoixReseaux(String mode){
    return showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50),
            topRight: Radius.circular(50)),
      ),
      context: context,
      isScrollControlled: true,
      showDragHandle: true,
      builder: (builder) {
        return Container(
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            children: [
              Text('Paiement par : $mode money\n',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text("Le nom qui doit s'afficher :\n SANGON ALBELDA BRANDON",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(height: 20,),
              mode=='orange'?
              Container(
                width: 270,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controllerMontant,
                  style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Montant à donner"),
                      prefixIcon: Icon(Icons.monetization_on_outlined)
                  ),
                ),
              ):Container(
                width: 290,
                padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.grey.withOpacity(.2),
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("  MTN money :  652917835",
                        textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold),),
                      IconButton(onPressed: (){
                        const copy_number = SnackBar(
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Numéro copié avec succes !',style: TextStyle(fontSize: 16),),
                              Icon(Icons.check_circle_sharp,color: Colors.white,)
                            ],
                          ),
                          backgroundColor: Colors.teal,
                          elevation: 10,
                          behavior: SnackBarBehavior.floating,
                          margin: EdgeInsets.all(5),
                        );
                        FlutterClipboard.copy('652917835').then(( value ) => ScaffoldMessenger.of(context).showSnackBar(copy_number));

                      }, icon: Icon(Icons.copy,color: Colors.teal,))
                    ],
                  )),

              SizedBox(height: 30,),

              CustomButton(
                  onpressed: ()async{
                    mode =='orange'?
                    await FlutterPhoneDirectCaller.callNumber('#150*1*1*659874120}'
                        '*${_controllerMontant.text}}#'):
                    await FlutterPhoneDirectCaller.callNumber('*126#');
                  },
                  title: mode=='orange'?'Envoyer le don':'Composer le *126#')
            ],
          ),
        );
      },
    );
  }

}
