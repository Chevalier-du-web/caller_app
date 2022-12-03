import 'package:flutter/material.dart';

import 'cardForfait.dart';

class ForfaitInternet extends StatefulWidget {
  const ForfaitInternet({Key? key}) : super(key: key);

  @override
  State<ForfaitInternet> createState() => _ForfaitInternetState();
}

class _ForfaitInternetState extends State<ForfaitInternet> {
  // tableau de forfaits ...
  var orange = [{
    'photo':'assets/logo-orange.jpg',
    'forfait':'internet jour',
    'quantite':'100F 110Mo',
    'code':'#131*2*3#'
  },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'jour decouverte',
      'quantite':'102F 80Mo',
      'code':'#145*2*3*5#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Internet jour',
      'quantite':'200F 330Mo',
      'code':'#111*1*2*5*3#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet 3 jours',
      'quantite':'500F 500Mo',
      'code':'#145*2*2*1#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet 3 jours',
      'quantite':'300F 350Mo',
      'code':'#145*2*2*2#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Internet 3 jours',
      'quantite':'6750F 5Go/jour',
      'code':'#145*2*4*4*1#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Internet 3 jours',
      'quantite':'5400F 4Go/jour',
      'code':'#145*2*4*4*2#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Internet 3 jours',
      'quantite':'4050F 3Go/jour',
      'code':'#145*2*4*4*3#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Internet 3 jours',
      'quantite':'2050F 2Go/jour',
      'code':'#145*2*4*4*4#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'Internet 3 jours',
      'quantite':'1200F 1Go/jour',
      'code':'#145*2*4*4*5#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet semaine',
      'quantite':'300F 350Mo',
      'code':'#131*8*3#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet semaine',
      'quantite':'450F 600Mo',
      'code':'#111*1*2*4*2#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet semaine',
      'quantite':'600F 1.2Go',
      'code':'#111*1*2*4*2#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet mois',
      'quantite':'1250F 1.5Go',
      'code':'#131*7*4#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet mois',
      'quantite':'10.000F 1Go/jour',
      'code':'#145*2*1*1#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet mois',
      'quantite':'8.000F 9.2Go',
      'code':'#145*2*1*2#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet mois',
      'quantite':'4.000F 3Go',
      'code':'#145*2*1*3#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet mois',
      'quantite':'2.000F 1.2Go',
      'code':'#145*2*1*4#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet mois',
      'quantite':'2.040F 3Go/nuit',
      'code':'#145*2*1*5#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet mois',
      'quantite':'1900F 2.6Go',
      'code':'#111*1*2*3#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'internet mois',
      'quantite':'2500F 6.1Go',
      'code':'#111*1*2*3#'
    }, {
      'photo':'assets/logo-orange.jpg',
      'forfait':'construire',
      'quantite':'variable',
      'code':'#111*1*2*6#'
    },];
  var mtn = [
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Offres mois',
      'quantite':'10000F 115000F',
      'code':'*123*3*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet jour',
      'quantite':'125F 150Mo',
      'code':'*157*1*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet jour',
      'quantite':'100F 100Mo',
      'code':'*157*1*2#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet jour',
      'quantite':'250F 250Mo',
      'code':'*157*1*3#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet jour',
      'quantite':'500F 600Mo',
      'code':'*157*1*4#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet jour',
      'quantite':'1000F 2Go',
      'code':'*157*1*5#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet semaine',
      'quantite':'700F 200Mo',
      'code':'*157*2*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet semaine',
      'quantite':'1000F 750Mo',
      'code':'*157*2*2#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet semaine',
      'quantite':'3000F 3Go',
      'code':'*157*2*3#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'399F 430Mo',
      'code':'*157*0*0#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'999F 1.1Go',
      'code':'*157*0*1#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'2.199F 2.57Go',
      'code':'*157*0*2#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'4499F 5.5Go',
      'code':'*157*0*3#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'9999F 12.5Go',
      'code':'*157*0*4#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'850F 250Mo',
      'code':'*157*3*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'2.000F 1.2Go',
      'code':'*157*3*2#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'4.000F 3Go',
      'code':'*157*3*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'8.000F 9.2Go',
      'code':'*157*3*4#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'internet mois',
      'quantite':'10.000F 30Go(1Go/jr)',
      'code':'*157*3*5#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Night 00H-06H',
      'quantite':'200F 2Go',
      'code':'*157*4*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 3 jours',
      'quantite':'1.200F 3Go/(1Go/jr)',
      'code':'*157*5*1*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 3 jours',
      'quantite':'2.550F 6Go/(2Go/jr)',
      'code':'*157*5*1*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 3 jours',
      'quantite':'4.000F 9Go/(3Go/jr)',
      'code':'*157*5*1*3#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 3 jours',
      'quantite':'5.450F 12Go/(4Go/jr)',
      'code':'*157*5*1*4#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 3 jours',
      'quantite':'6.900F 15Go/(5Go/jr)',
      'code':'*157*5*1*5#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 7 jours',
      'quantite':'2.700F 7Go/(1Go/jr)',
      'code':'*157*5*2*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 7 jours',
      'quantite':'5.750F 14Go/(2Go/jr)',
      'code':'*157*5*2*2#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 7 jours',
      'quantite':'8.850F 21Go/(3Go/jr)',
      'code':'*157*5*2*3#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 7 jours',
      'quantite':'12.000F 28Go/(4Go/jr)',
      'code':'*157*5*2*4#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 7 jours',
      'quantite':'15.200F 35Go/(5Go/jr)',
      'code':'*157*5*2*5#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 15 jours',
      'quantite':'5.250F 15Go/(1Go/jr)',
      'code':'*157*5*3*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 15 jours',
      'quantite':'11.250F 30Go/(2Go/jr)',
      'code':'*157*5*3*2#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 15 jours',
      'quantite':'17.350F 45Go/(3Go/jr)',
      'code':'*157*5*3*3#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 15 jours',
      'quantite':'25.000F 60Go/(4Go/jr)',
      'code':'*157*5*3*4#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 15 jours',
      'quantite':'32.250F 75Go/(5Go/jr)',
      'code':'*157*5*3*5#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 30 jours',
      'quantite':'10.000F 30Go/(1Go/jr)',
      'code':'*157*5*4*1#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 30 jours',
      'quantite':'21.000F 60Go/(2Go/jr)',
      'code':'*157*5*4*2#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 30 jours',
      'quantite':'34.500F 90Go/(3Go/jr)',
      'code':'*157*5*4*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 30 jours',
      'quantite':'49.500F 120Go/(4Go/jr)',
      'code':'*157*5*4*4#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Giga surf 30 jours',
      'quantite':'63.500F 150Go/(5Go/jr)',
      'code':'*157*5*4*5#'
    }, {
      'photo':'assets/MTN-Logo.png',
      'forfait':'Autres bonus',
      'quantite':'variable',
      'code':'*123*10#'
    },
  ];
  var camtel = [
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Internet X-DAY',
      'quantite':'',
      'code':'*825*2*2*1*1#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue mo',
      'quantite':'100F 1Go/3h',
      'code':'*825*2*2*1*2#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue mo',
      'quantite':'300F 1.5Go/jr',
      'code':'*825*2*2*1*3#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'FAP',
      'quantite':'500F 1Go/2jours',
      'code':'*825*2*2*1*4#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'FAKO XS',
      'quantite':'500F 2Go/1jour',
      'code':'*825*2*2*1*5#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Semaine XWEEK',
      'quantite':'variable',
      'code':'*825*2*2*2*1#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue mo',
      'quantite':'1000F 2Go',
      'code':'*825*2*2*2*2#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'DEAL',
      'quantite':'3000F 5Go',
      'code':'*825*2*2*2*3#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'X-STARTER',
      'quantite':'',
      'code':'*825*2*2*3*1#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'X-PREMIUM',
      'quantite':'',
      'code':'*825*2*2*3*2#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'X-BUSINESS',
      'quantite':'',
      'code':'*825*2*2*3*3#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'X-TREM ',
      'quantite':'',
      'code':'*825*2*2*3*4#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'X-TREM UNLIMITED ',
      'quantite':'',
      'code':'*825*2*2*3*4#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue mo XXL ',
      'quantite':'5000F 10Go/30jours',
      'code':'*825*2*2*3*5#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'SKATE ',
      'quantite':'10.000f 20Go/30jours',
      'code':'*825*2*2*3*6#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'PREMIUM ',
      'quantite':'20.000F 50Go/30jours',
      'code':'*825*2*2*3*7#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'ENJOY ',
      'quantite':'35.000F 100Go/30jours',
      'code':'*825*2*2*3*8#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue Go S ',
      'quantite':'   2.000F 300mo/jour \npendant 30 jours',
      'code':'*825*2*2*3*9#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue M ',
      'quantite':'   5.000F 850Mo/jour \npendant 30 jours',
      'code':'*825*2*2*3*10#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue L ',
      'quantite':'   10.000F 2Go/jour \npendant 30 jours',
      'code':'*825*2*2*3*11#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue Go XL ',
      'quantite':'   20.000F 4.5Go/jour \npendant 30 jours',
      'code':'*825*2*2*3*12#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue  XXL ',
      'quantite':'   35.000F 8Go/jour\n pendant 30 jours',
      'code':'*825*2*2*3*13#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Plus S ',
      'quantite':'15.000F 60Go/30jours',
      'code':'*825*2*2*3*14#'
    }, {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Plus M ',
      'quantite':'25.000F 135Go/30jours',
      'code':'*825*2*2*3*15#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue go plus  ',
      'quantite':'40.000F 240Go/30jours',
      'code':'*825*2*2*3*16#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue Home  mois ',
      'quantite':'15.000F 35Go illimite 1.5 Mbps',
      'code':'*825*5*1*4*1#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue Home  mois ',
      'quantite':'25.000F 75Go illimite 2 Mbps',
      'code':'*825*5*1*4*2#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'Blue Home  mois ',
      'quantite':'40.000F 150Go illimite 2.5 Mbps',
      'code':'*825*5*1*4*3#'
    },
  ];
  var nexttel = [
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 24H',
      'quantite':'50F 50Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 24H',
      'quantite':'150F 150Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 24H',
      'quantite':'250F 250Mo',
      'code':'*865#'
    }, {
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
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 7 jours',
      'quantite':'1000F 500Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 7 jours',
      'quantite':'2000F 1536Mo',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 30 jours',
      'quantite':'4 000F 3072Mo+4000F',
      'code':'*865#'
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Fly 30 jours',
      'quantite':'12 000F 12288Mo',
      'code':'*865#'
    },
    {
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
    }, {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Nexttel Socials semaine',
      'quantite':'   1000F reseaux \nsociaux illimite',
      'code':'*865#'
    },
    {
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
                  color: Colors.grey.withOpacity(.3),
                  child: GestureDetector(
                    onTap: (){
                      setState(() {
                        index==0?ForfaitsInternets = orange
                            :index==1?ForfaitsInternets = mtn
                            :index ==2 ? ForfaitsInternets = camtel
                            :ForfaitsInternets = nexttel;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.all(7),
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
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
