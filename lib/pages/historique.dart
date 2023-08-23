import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HistoriquePage extends StatefulWidget {
  const HistoriquePage({Key? key}) : super(key: key);

  @override
  State<HistoriquePage> createState() => _HistoriquePageState();
}

class _HistoriquePageState extends State<HistoriquePage> {
  @override
  void initState()async {
    // TODO: implement initState
    super.initState();
    SharedPreferences prefs = await SharedPreferences.getInstance();

  }
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
        itemBuilder: (context,index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        background: Container(
            decoration: BoxDecoration(
                color: Colors.deepOrangeAccent.withOpacity(.3)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Icon(Icons.delete,color: Colors.red,size: 25,),
              ],
            )),
        onDismissed: (DismissDirection direction){
          setState(() {
            //items.removeAt(index);
          });
        },
        child: Container(
          padding: EdgeInsets.all(8),
            margin: EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
              borderRadius: BorderRadius.circular(10)
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Forfait internet : 23 janvier 2023',
                      style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                    Text('Forfait jour'),

                  ],
                ),
                InkWell(
                  onTap: (){

                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text('Reproduire', style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                      Icon(Icons.call, color: Colors.teal,),
                    ],
                  ),
                )
              ],
            )),
      );
    });
  }
}
