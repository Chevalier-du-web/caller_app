import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';



class HistoryPage extends StatefulWidget {
  @override
  State<HistoryPage> createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historique des questions'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection('history').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text('Une erreur est survenue : ${snapshot.error}');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
                child: CircularProgressIndicator());
          }
          if (snapshot.data!.docs.isEmpty) {
            return Center(
              child: Column(
                children: [
                  Icon(Icons.calendar_month),
                  Text('Pas de question !.'),
                ],
              ),
            );
          }

          return ListView(
            children: snapshot.data!.docs.map((DocumentSnapshot document) {
              Map<String, dynamic> data = document.data() as Map<String, dynamic>;

              return Dismissible(
                key: Key(data['id']),
                background: Container(
                    color: Colors.red.withOpacity(.5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Icon(Icons.delete, size: 60, color: Colors.white,),
                        SizedBox(width: 15,)
                      ],
                    )
                ),
                onDismissed: (direction) {
                  // Remove the item from the data source.
                  setState(() {
                    FirebaseFirestore.instance.collection('history').doc(
                        data['id']).delete();
                  });

                  // Then show a snackbar.
                  ScaffoldMessenger.of(context)
                      .showSnackBar(
                      SnackBar(
                          backgroundColor: Colors.orangeAccent,
                          content: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Element supprimé avec succès !',),
                              Icon(Icons.check_circle, color: Colors.white,)
                            ],
                          )));
                },
                child: Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(20)
                    // boxShadow: [
                    //   BoxShadow(
                    //     color: Colors.grey.withOpacity(0.5),
                    //     spreadRadius: 5,
                    //     blurRadius: 7,
                    //     offset: Offset(0, 3), // changes position of shadow
                    //   ),
                    // ],
                  ),
                  margin: EdgeInsets.all(10),
                  child: Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 5,
                              blurRadius: 4,
                              offset: Offset(0, 3), // changes position of shadow
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10))
                              ),
                              child: Center(child: Text("04",
                                style: TextStyle(fontSize: 14,color: Colors.white,fontWeight: FontWeight.bold),)),
                            ),
                            Container(
                              height: 30,
                              width: 70,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.only(bottomLeft: Radius.circular(10),bottomRight: Radius.circular(10))
                              ),
                              child: Center(child: Text("janvier",
                                style: TextStyle(fontSize: 14,color: Colors.black,fontWeight: FontWeight.bold),)),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(data['title'],style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            Container(
                              width: 200,
                                child: Text(data['description'],style: TextStyle(fontSize: 13))),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}


