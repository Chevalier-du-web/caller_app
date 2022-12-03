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
    'quantite':'102F 25 sms',
    'code':'#131*1*1#'
  },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'SMS semaine',
      'quantite':'255F sms illimite',
      'code':'#131*1*2#'
    },
    {
      'photo':'assets/logo-orange.jpg',
      'forfait':'SMS mois',
      'quantite':'459F sms illimite',
      'code':'#131*1*3#'
    },];
  var mtn = [ {
    'photo':'assets/MTN-Logo.png',
    'forfait':'SMS jour',
    'quantite':'20F SMS illimite ',
    'code':'*8123*5*1*1#'
  },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'SMS jour',
      'quantite':'50F SMS illimite +50Mo',
      'code':'*8123*5*1*3#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'SMS semaine',
      'quantite':'250F SMS illimite \n+100Mo Whatsapp ',
      'code':'*8123*5*1*4#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'SMS mois',
      'quantite':'750F SMS illimite \n+300Mo Whatsapp ',
      'code':'*8123*5*1*5#'
    },
    {
      'photo':'assets/MTN-Logo.png',
      'forfait':'SMS mois',
      'quantite':'500F SMS illimite ',
      'code':'*8123*5*1*2#'
    },

  ];
  var camtel = [{
    'photo':'assets/camtel_logo.jpg',
    'forfait':'TOLI XS',
    'quantite':'    500F 500Mo+50min\n+50SMS 30jrs',
    'code':'*825*2*1*1*1#'
  },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'TOLI S',
      'quantite':'    2.000F 2Go+200min\n+200SMS 30jrs',
      'code':'*825*2*1*2*1#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'TOLI M',
      'quantite':'    5.000F 5Go+500min\n+500SMS 30jrs',
      'code':'*825*2*1*3*1#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'TOLI XS',
      'quantite':'    10.000F 10Go+1000min\n+1000SMS 30jrs',
      'code':'*825*2*1*4*1#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'TOLI XS',
      'quantite':'    20.000F 20Go+2000min\n+2000SMS 30jrs',
      'code':'*825*2*1*5*1#'
    },
    {
      'photo':'assets/camtel_logo.jpg',
      'forfait':'TOLI XS',
      'quantite':'    35.000F 35Go+3500min\n+3500SMS 30jrs',
      'code':'*825*2*1*6*1#'
    }
  ];
  var nexttel = [
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Bundle SMS jour',
      'quantite':'100F SMS illimite ',
      'code':'*860#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Bundle SMS semaine',
      'quantite':'200F SMS illimite ',
      'code':'*860#'
    },
    {
      'photo':'assets/Nexttel-Cameroon-Logo.png',
      'forfait':'Bundle SMS mois',
      'quantite':'400F SMS illimite ',
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
                              index==0?ForfaitsSMS = orange
                                  :index==1?ForfaitsSMS = mtn
                                  :index ==2 ? ForfaitsSMS = camtel
                                  :ForfaitsSMS = nexttel;
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.all(7),
                            height: 60,
                            width: 60,
                            decoration: BoxDecoration(
                              color: Colors.red,
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
