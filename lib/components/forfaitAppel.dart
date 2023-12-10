import 'package:flutter/material.dart';

import 'cardForfait.dart';

class ForfaitAppel extends StatefulWidget {
  const ForfaitAppel({Key? key}) : super(key: key);

  @override
  State<ForfaitAppel> createState() => _ForfaitAppelState();
}

class _ForfaitAppelState extends State<ForfaitAppel> {
  var orange = [
    {
    'photo':'assets/logo-orange.jpg',
    'forfait':'Orange Appel',
    'quantite':'Uniquement Orange',
    'code':'#111*1*1*2#'
  },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Appel',
      'quantite':'Tous réseaux',
      'code':'#111*1*1*1#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Appel',
      'quantite':'Tous réseaux+internet',
      'code':'#111*1*1*3#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Appel 2',
      'quantite':'Forfait appel',
      'code':'#131*2*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Appel international',
      'quantite':'Forfait appel international',
      'code':'#131*3#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Appel ',
      'quantite':'Forfait appel Semaine',
      'code':'#131*8#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Appel Mois',
      'quantite':'Forfait appel Mois',
      'code':'#131*7#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Ma surprise',
      'quantite':'Offre Appel gratuit',
      'code':'#131*9#'
    },

   ];
  var mtn = [
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN bon plan',
      'quantite':'variable',
      'code':'*123*1*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Super promo',
      'quantite':'variables',
      'code':'*123*0#'
    },

    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Appel Plan',
      'quantite':'Forfait Tous réseaux',
      'code':'*123*3*1*1*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Appel Plan',
      'quantite':'Forfait MTN uniquement',
      'code':'*123*3*1*1*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Appel Plan',
      'quantite':'Tous réseaux + internet',
      'code':'*123*3*1*1*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Wanda',
      'quantite':'Forfait jour',
      'code':'*123*3*1*2*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Wanda',
      'quantite':'Forfait Semaine',
      'code':'*123*3*1*2*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Wanda',
      'quantite':'Forfait Mois',
      'code':'*123*3*1*2*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Magic',
      'quantite':'Forfait magic',
      'code':'*123*3*1*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn International',
      'quantite':'Forfait Appel international',
      'code':'*123*3*1*4#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Roaming',
      'quantite':'Forfait Roaming',
      'code':'*123*3*1*5#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN Bon plan',
      'quantite':'Meilleures offres',
      'code':'*222#'
    },

  ];
  var camtel = [{
    'photo':'assets/camtel_logo.jpg',
    'forfait':'Blue Appel illimité ',
    'quantite':'2000F illimité 30 jours',
    'code':'*825*1*1*3#'
  },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue Appel ',
      'quantite':'Forfait Appel',
      'code':'*825*1*1*1#'
    },


  ];
  var nexttel = [
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Jakpot(SMS+Appel)',
      'quantite':'multiple',
      'code':'*860#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Japap(Appel,data,SMS)',
      'quantite':'multiple',
      'code':'*860#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Jakpot',
      'quantite':'multiple',
      'code':'*860#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'OHHA 100F',
      'quantite':'100F Appels Nexttel\n 24H +200Mo valable 30 jours',
      'code':'*860*3#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'OHHA 200F',
      'quantite':'200F Appels Nexttel\n 36H +300Mo valable 30 jours',
      'code':'*860*3#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'HOHA 500F',
      'quantite':'500F Appels Nexttel\n 72H +1.2Go valable 30 jours',
      'code':'*860*3#'
    },
  ];
  var ForfaitsAppel = [];

  var imagesReseaux = [
    'assets/logo-orange.jpg',
    'assets/MTN-Logo.png',
    'assets/camtel_logo.jpg',
    'assets/Nexttel-Cameroon-Logo.png'
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    ForfaitsAppel = orange;
  }
  int current = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [

              SizedBox(
                height: 70,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: imagesReseaux.length,
                    itemBuilder: (context,index){
                      return Container(
                        decoration: BoxDecoration(
                            color: current==index? Colors.teal.withOpacity(.6) : Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        margin: EdgeInsets.all(4),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              index==0?ForfaitsAppel = orange
                                  :index==1?ForfaitsAppel = mtn
                                  :index ==2 ? ForfaitsAppel = camtel
                                  :ForfaitsAppel = nexttel;
                              current= index;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(7),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                                image: DecorationImage(
                                    image: AssetImage(imagesReseaux[index]),fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Flexible(child:
              ForfaitsAppel.isNotEmpty?ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ForfaitsAppel.length,
                  itemBuilder: (context,index){
                    return CardForfait(photo: ForfaitsAppel[index]['photo'].toString(), code: ForfaitsAppel[index]['code'].toString(),
                      forfait: ForfaitsAppel[index]['forfait'].toString(), quantite: ForfaitsAppel[index]['quantite'].toString(),
                    );
                  }):
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    Icon(Icons.search_off_outlined,size: 150,color: Colors.black26),
                    Text('Aucun forfait trouvé',style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.6)),)
                  ],
                ),
              ))
            ]
        ),
      ),
    );
  }
}
