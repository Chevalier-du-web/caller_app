import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cardForfait.dart';

class ForfaitInternet extends StatefulWidget {
  const ForfaitInternet({Key? key}) : super(key: key);

  @override
  State<ForfaitInternet> createState() => _ForfaitInternetState();
}

class _ForfaitInternetState extends State<ForfaitInternet> {
  // tableau de forfaits ...
  var orange = [
    {
    'photo':'assets/logo-orange.jpg',
    'forfait':'Orange Bonus',
    'quantite':'Variable',
    'code':'#111*1*2#'
  },
  {
  'photo':'assets/logo-orange.jpg',
  'forfait':'Orange Data',
  'quantite':'Forfait jour 1',
  'code':'#111*1*2*5#'
  },
  {
  'photo':'assets/logo-orange.jpg',
  'forfait':'Orange Data ',
  'quantite':'Forfait jour 2',
  'code':'#145*2*3#'
  },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Bonus King ',
      'quantite':'Forfait jour 3',
      'code':'#131*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Data ',
      'quantite':'Forfait 03 jours',
      'code':'#145*2*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Data ',
      'quantite':'Forfait Semaine',
      'code':'#111*1*2*4#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Bonus King ',
      'quantite':'Forfait Semaine',
      'code':'#131*8#'
    },{
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Appel+internet',
      'quantite':'Tous réseaux+internet',
      'code':'#111*1*1*3#'
    },


    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Data ',
      'quantite':'Forfait Mois',
      'code':'#111*1*2*1#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Bonus King ',
      'quantite':'Forfait Mois',
      'code':'#131*7#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange Data ',
      'quantite':'Forfait GigaData',
      'code':'#111*1*2*4#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Orange My Way Data ',
      'quantite':'Construire un forfait',
      'code':'#111*1*2*5#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Ma surprise',
      'quantite':'Offre de data gratuit',
      'code':'#131*9#'
    },

    ];
  var mtn = [
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Wanda Net',
      'quantite':'Forfait internet',
      'code':'*157*0#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Data',
      'quantite':'Forfait jour',
      'code':'*157*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Data',
      'quantite':'Forfait Semaime',
      'code':'*157*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Data',
      'quantite':'Forfait Mois',
      'code':'*157*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Data',
      'quantite':'Forfait Nuit',
      'code':'*157*4#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Data',
      'quantite':'Forfait Découverte',
      'code':'*157*6#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Giga Data',
      'quantite':'Forfait Giga',
      'code':'*157*5#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Home',
      'quantite':'Forfait variable',
      'code':'*157*8#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Promo Phone',
      'quantite':'Forfait Découverte',
      'code':'*157*10#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Mtn Promo',
      'quantite':'Forfait Découverte',
      'code':'*157*7#'
    },


  ];
  var camtel = [
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Internet illimité',
      'quantite':'',
      'code':'*825*1*2*1#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue mo',
      'quantite':'Forfait jour',
      'code':'*825*1*2*2*1#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue mo Quota jour',
      'quantite':'Forfait Mois',
      'code':'*825*1*2*2*2*1#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue mo Quota Mois',
      'quantite':'Forfait Mois',
      'code':'*825*1*2*2*2*2#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue Home 30 jouts',
      'quantite':'Forfait Mois',
      'code':'*825*1*2*4#'
    },


  ];
  var nexttel = [
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 24H',
      'quantite':'50F 50Mo',
      'code':'*865#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 24H',
      'quantite':'150F 150Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 24H',
      'quantite':'250F 250Mo',
      'code':'*865#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 24H',
      'quantite':'500F 500Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 24H',
      'quantite':'100F 100Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 7 jours',
      'quantite':'700F 200Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 7 jours',
      'quantite':'1000F 500Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 7 jours',
      'quantite':'2000F 1536Mo',
      'code':'*865#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 30 jours',
      'quantite':'4 000F 3072Mo+4000F',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 30 jours',
      'quantite':'12 000F 12288Mo',
      'code':'*865#'
    },{
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 30 jours',
      'quantite':'15 000F 15 360Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 30 jours',
      'quantite':'25 000F 25 600Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Nexttel Socials jour',
      'quantite':'  300F reseaux \nsociaux illimite',
      'code':'*865#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Nexttel Socials semaine',
      'quantite':'   1000F reseaux \nsociaux illimite',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Nexttel Socials mois',
      'quantite':'   2000F reseaux \nsociaux illimite',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Nexttel Socials Plus',
      'quantite':'   2500F reseaux \nsociaux illimite',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Night surf',
      'quantite':'200F 3Go(23H-07H)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Night surf',
      'quantite':'300F 5Go(23H-07H)',
      'code':'*865#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Student',
      'quantite':'150F 3Go(23H-07H)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Student',
      'quantite':'250F 5Go(23H-07H)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Crazy data',
      'quantite':'500F 2Go',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Premium',
      'quantite':'68 500F 50Go',
      'code':'*865#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Premium',
      'quantite':'135 000F 90Go',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Extra 3 jours',
      'quantite':'850F 3Go(1Go/jour)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Extra 3 jours',
      'quantite':'1500F 6Go(2Go/jour)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Extra 7 jours',
      'quantite':'2000F 7Go(1Go/jour)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Extra 7 jours',
      'quantite':'5000F 14Go(2Go/jour)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Extra 15 jours',
      'quantite':'4500F 15.75Go(1.05Go/jour)',
      'code':'*865#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly Extra 30 jours',
      'quantite':'9000F 31.5Go(1.05Go/jour)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Surf Extra 1 mois',
      'quantite':'20500F 60Go(2Go/jour)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Surf Extra 2 mois',
      'quantite':'34500F 90Go(3Go/jour)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Surf Extra 3 mois',
      'quantite':'49500F 120Go(4Go/jour)',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Surf Extra 4 mois',
      'quantite':'63000F 150Go(5Go/jour)',
      'code':'*865#'
    },

  ];
  var ForfaitsInternets = [];

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
    ForfaitsInternets = orange;
  }
  int selectedNetwork = 0;
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
                    color: current==index? Colors.teal.withOpacity(.3) : Colors.grey.withOpacity(.3),
                    borderRadius: BorderRadius.circular(90)
                  ),
                  margin: EdgeInsets.all(2),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        index==0?ForfaitsInternets = orange
                            :index==1?ForfaitsInternets = mtn
                            :index ==2 ? ForfaitsInternets = camtel
                            :ForfaitsInternets = nexttel;
                        current= index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(8),
                      height: 50,
                      width: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(150),
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
            ForfaitsInternets.isNotEmpty? ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: ForfaitsInternets.length,
                itemBuilder: (context,index){
                return CardForfait(photo: ForfaitsInternets[index]['photo'].toString(), code: ForfaitsInternets[index]['code'].toString(),
                  forfait: ForfaitsInternets[index]['forfait'].toString(), quantite: ForfaitsInternets[index]['quantite'].toString(),
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
