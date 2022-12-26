import 'package:flutter/material.dart';

import 'cardForfait.dart';

class ForfaitAppel extends StatefulWidget {
  const ForfaitAppel({Key? key}) : super(key: key);

  @override
  State<ForfaitAppel> createState() => _ForfaitAppelState();
}

class _ForfaitAppelState extends State<ForfaitAppel> {
  var orange = [{
    'photo':'assets/logo-orange.jpg',
    'forfait':'Appel jour',
    'quantite':'102F 1200F',
    'code':'#131*2*1#'
  },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Appel jour',
      'quantite':'128F 850F/tout reseau',
      'code':'#131*2*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Appel jour',
      'quantite':'250F 1050F+125Mo',
      'code':'#131*2*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Appel semaine',
      'quantite':'250F 3200F',
      'code':'#131*8*1#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Appel semaine',
      'quantite':'765F 4550F/tous reseaux',
      'code':'#131*8*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Appel semaine',
      'quantite':'1100F 3950F+525Mo',
      'code':'#131*8*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Appel mois',
      'quantite':'3000F 41000F',
      'code':'#131*7*1#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Appel mois',
      'quantite':'3000F 21000F/tous reseaux',
      'code':'#131*7*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Appel mois',
      'quantite':'4500F 31500F+2000Mo',
      'code':'#131*7*3#'
    },];
  var mtn = [
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN bon plan',
      'quantite':'variable',
      'code':'*123*1*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Meilleures offres',
      'quantite':'variables',
      'code':'*123#'
    },
    {
    'photo':'assets/MTN-Logo.png',
    'forfait':'Super promo',
    'quantite':'bonus appel',
    'code':'*123*0#'
  },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel jour',
      'quantite':'500F 4500F',
      'code':'*123*3*1*2*1*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel jour',
      'quantite':'1000F 10000F',
      'code':'*123*3*1*2*1*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel semaine',
      'quantite':'500F 3500F',
      'code':'*123*3*1*2*2*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel semaine',
      'quantite':'1000F 9000F',
      'code':'*123*3*1*2*2*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel semaine',
      'quantite':'2500F 25000F',
      'code':'*123*3*1*2*2*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel semaine',
      'quantite':'5000F 55000F',
      'code':'*123*3*1*2*2*4#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel mois',
      'quantite':'1000F 7500F',
      'code':'*123*3*1*2*3*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel mois',
      'quantite':'2500F 23750F',
      'code':'*123*3*1*2*3*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel mois',
      'quantite':'5000F 52500F',
      'code':'*123*3*1*2*3*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Appel mois',
      'quantite':'10000F 115000F',
      'code':'*123*3*1*2*3*4#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Yamo Kongossa',
      'quantite':'50F 5 minutes appels /24H',
      'code':'*220*1*1*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Yamo Kongossa',
      'quantite':'199F 1450F/30 jours',
      'code':'*220*1*1*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Yamo Kongossa',
      'quantite':'399F 2925F/30 jours',
      'code':'*220*1*1*3#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Yamo Kongossa',
      'quantite':'1000F 10.000F/30 jours',
      'code':'*220*1*1*4#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Yamo 5kolo',
      'quantite':'5000F 15.000F tous  réseaux \n +3Go + SMS illimité 30 jours',
      'code':'*220*1*4*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Yamo Kongossa',
      'quantite':'500F 2.700F/7jours \n +43.000F MTN/minuit/7 jours',
      'code':'*222*0#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN tous réseaux',
      'quantite':'250F 1100F/24H',
      'code':'*222*1*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN tous réseaux',
      'quantite':'500F 2500F/3 jours',
      'code':'*222*1*2#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN tous réseaux',
      'quantite':'1000F 5550F/7 jours',
      'code':'*222*1*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN tous reseaux',
      'quantite':'3.000F 18.950F/30 jours',
      'code':'*222*1*4#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN uniquement',
      'quantite':'250F 3000F/24H',
      'code':'*222*2*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN uniquement',
      'quantite':'500F 6100F/3 jours',
      'code':'*222*2*2#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN uniquement',
      'quantite':'1000F 12.450F/7 jours',
      'code':'*222*2*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN uniquement',
      'quantite':'3000F 42.500F/30 jours',
      'code':'*222*2*4#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN uniquement',
      'quantite':'variable',
      'code':'*200#'
    },
  ];
  var camtel = [{
    'photo':'assets/camtelo.png',
    'forfait':'Blue One ',
    'quantite':'2.000F 15min+100SMS /7jours',
    'code':'*825*5*1*1*2#'
  },
    {
      'photo':'assets/camtelo.png',
      'forfait':'Blue One ',
      'quantite':'3.000F 30min+200SMS /30jours',
      'code':'*825*5*1*1*3#'
    },
    {
      'photo':'assets/camtelo.png',
      'forfait':'Blue One ',
      'quantite':'5.000F 45min+300SMS /30jours',
      'code':'*825*5*1*1*4#'
    },
    {
      'photo':'assets/camtelo.png',
      'forfait':'Blue One ',
      'quantite':'   10.000F 60min+400SMS \npendant 30 jours',
      'code':'*825*5*1*1*5#'
    },
    {
      'photo':'assets/camtelo.png',
      'forfait':'Blue One ',
      'quantite':'   20.000F 75min+500SMS \npendant 30 jours',
      'code':'*825*5*1*1*6#'
    },
    {
      'photo':'assets/camtelo.png',
      'forfait':'Blue One ',
      'quantite':'250F 5Go/24H(00H-06H)',
      'code':'*825*5*1*1*15#'
    },
    {
      'photo':'assets/camtelo.png',
      'forfait':'Appel illimité ',
      'quantite':'2.000F illimité pendant 30 jours',
      'code':'*825*5*1*3*17#'
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
      'forfait':'OHHA 500F',
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
                            color: Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(90)
                        ),
                        margin: EdgeInsets.all(2),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              index==0?ForfaitsAppel = orange
                                  :index==1?ForfaitsAppel = mtn
                                  :index ==2 ? ForfaitsAppel = camtel
                                  :ForfaitsAppel = nexttel;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(7),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
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
