import 'package:caller/components/button.dart';
import 'package:flutter/material.dart';


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
        context: context,
        elevation: 9,
        isDismissible: true,
        showDragHandle: true,
        enableDrag: true,
        shape:RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft:  Radius.circular(50))),
        builder: (BuildContext context){
          return Container(
            height: MediaQuery.of(context).size.height - 100,
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.only(topRight: Radius.circular(40))
            ),
            child: Column(
              children: [
                Text('Paiement par : $mode',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                SizedBox(height: 12,),
                Container(
                  width: 270,
                  child: TextField(
                    keyboardType: TextInputType.number,
                    style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("Montant a donner"),
                      prefixIcon: Icon(Icons.monetization_on_outlined)
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                CustomButton(
                    onpressed: (){},
                    title: 'Envoyer le don')
              ],
            ),
          );
        });
  }

}
