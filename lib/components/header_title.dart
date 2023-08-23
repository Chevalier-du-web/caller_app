import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';

class HeaderTitle extends StatelessWidget {
  const HeaderTitle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: 270,
      height: 60,
      margin: EdgeInsets.only(top: 20),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
          color: Colors.transparent,
          border: Border.all(color: Colors.grey,width: 4),
        borderRadius: BorderRadius.circular(20),

      ),
      child: Center(
        child: AnimatedTextKit(
          repeatForever: true,
          animatedTexts: [
            TyperAnimatedText(
                "Que voulez-vous ....?",
                textStyle: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                speed: Duration(milliseconds: 160)
            ),
            FadeAnimatedText('Simplifiez-vous la vie ...',
                textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                duration: Duration(seconds: 5)),
            FadeAnimatedText('Fini les longs codes ... ',
                textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                duration: Duration(seconds: 5)),
            FadeAnimatedText('Les transactions deviennent un jeu ...',
                textStyle: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),
                duration: Duration(seconds: 5))
          ],

        )
      ),
    );
  }
}
