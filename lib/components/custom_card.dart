import 'package:flutter/material.dart';


class CustomCard extends StatefulWidget {
  const CustomCard({Key? key, required this.onpressed, required this.image, required this.title, required this.type}) : super(key: key);
  final VoidCallback onpressed;
  final String image;
  final String title;
  final int type;

  @override
  State<CustomCard> createState() => _CustomCardState();
}

class _CustomCardState extends State<CustomCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:widget.onpressed,
      child: Container(
        width: 230,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: Colors.blueGrey.withOpacity(.4),
                  offset: Offset(0,3),
                  blurRadius: 3,
                  spreadRadius: 1
              ),
            ],
            border: Border.all(color: Colors.grey)
        ),
        child:Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SizedBox(width: 5,),
                Container(
                  width: widget.type == 0?80:40,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                      image: DecorationImage(
                          image: AssetImage(widget.image),
                          fit: BoxFit.cover
                      )
                  ),
                ),
                SizedBox(width: widget.type==0?4:15,),
                Text(widget.title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 13,color:Colors.black,),)
              ],
            ),
            Container(
                margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.call,color:Colors.teal))
          ],
        ),
      ),
    );
  }
}
