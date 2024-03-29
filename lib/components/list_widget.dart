import 'package:flutter/material.dart';

class ListWidget extends StatefulWidget {
  const ListWidget({Key? key, required this.title, required this.onPressed, required this.icon}) : super(key: key);
  final String title;
  final VoidCallback onPressed;
  final Icon icon;

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onPressed,
      child: Container(
        padding: EdgeInsets.all(6),

        decoration: BoxDecoration(
          color: Colors.grey.withOpacity(.2),
          borderRadius: BorderRadius.circular(10)
        ),
        margin: EdgeInsets.only(left: 15,right: 15,top: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    padding: EdgeInsets.all(7),
                    margin: EdgeInsets.only(left: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.2),
                        borderRadius: BorderRadius.circular(70)
                    ),
                    child: widget.icon),
                SizedBox(width: 20,),
                Text(widget.title,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
              ],
            ),

            Container(
              margin: EdgeInsets.only(right: 10),
                child: Icon(Icons.arrow_forward_ios_outlined,color: Colors.teal,))
          ],
        ),
      ),
    );
  }
}
