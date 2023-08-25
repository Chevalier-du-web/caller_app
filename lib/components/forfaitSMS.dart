import 'package:flutter/material.dart';

import 'cardForfait.dart';

class ForfaitSMS extends StatefulWidget {
  const ForfaitSMS({Key? key}) : super(key: key);

  @override
  State<ForfaitSMS> createState() => _ForfaitSMSState();
}

class _ForfaitSMSState extends State<ForfaitSMS> {
  var orange = [  {
    'photo':'assets/logo-orange.jpg',
    'forfait':'SMS jour',
    'quantite':'102F = 200 SMS',
    'code':'#131*1*1#'
  },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'SMS semaine',
      'quantite':'250F = 100 SMS/jours',
      'code':'#131*1*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'SMS mois',
      'quantite':'475F = 100 SMS/30 jours',
      'code':'#131*1*3#'
    },];
  var mtn = [ {
    'photo':'assets/MTN-Logo.png',
    'forfait':'SMS jour',
    'quantite':'50F = 50 SMS/24H ',
    'code':'*123*5*1*1#'
  },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN SMS ',
      'quantite':'500F = 50 SMS/Jour',
      'code':'*123*5*1*2#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN SMS',
      'quantite':'100F = 50 SMS+100Mo \nWhatsapp/24H ',
      'code':'*123*5*1*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN SMS mois',
      'quantite':'250F = 50 SMS par jour \n+100Mo Whatsapp /30 jours ',
      'code':'*123*5*1*4#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'SMS mois',
      'quantite':'750F = 50 par jour SMS \n+300Mo Whatsapp/30 jours ',
      'code':'*123*5*1*5#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'MTN Bonus Ayoba',
      'quantite':'Offre gratuite de megas ',
      'code':'*123*5*1*5#'
    },

  ];
  var camtel = [
    {
      'photo':'assets/camtel_logo.jpg',
    'forfait':'Blue SMS',
    'quantite':'Forfait SMS+internet+Appel',
    'code':'*825*1*1*1#'
  },
  ];
  var nexttel = [
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Bundle SMS jour',
      'quantite':'100F SMS illimité ',
      'code':'*860#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Bundle SMS semaine',
      'quantite':'200F SMS illimité ',
      'code':'*860#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Bundle SMS mois',
      'quantite':'400F SMS illimité ',
      'code':'*860#'
    },
  ];
  var ForfaitsSMS = [];

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
    ForfaitsSMS = orange;
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
                            color: current==index? Colors.teal.withOpacity(.3) : Colors.grey.withOpacity(.3),
                            borderRadius: BorderRadius.circular(90)
                        ),
                        margin: EdgeInsets.all(2),
                        child: GestureDetector(
                          onTap: (){
                            setState(() {
                              index==0?ForfaitsSMS = orange
                                  :index==1?ForfaitsSMS = mtn
                                  :index ==2 ? ForfaitsSMS = camtel
                                  :ForfaitsSMS = nexttel;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(7),
                            height: 50,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.red,
                                borderRadius: BorderRadius.circular(90),
                                image: DecorationImage(
                                    image: AssetImage(imagesReseaux[index],),fit: BoxFit.cover
                                )
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Flexible(child:
              ForfaitsSMS.isNotEmpty? ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: ForfaitsSMS.length,
                  itemBuilder: (context,index){
                    return CardForfait(photo: ForfaitsSMS[index]['photo'].toString(), code: ForfaitsSMS[index]['code'].toString(),
                      forfait: ForfaitsSMS[index]['forfait'].toString(), quantite: ForfaitsSMS[index]['quantite'].toString(),
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
