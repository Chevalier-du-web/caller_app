import 'package:flutter/material.dart';
import '../../pages_introduction/page1.dart';
import '../../pages_introduction/page2.dart';
import '../../pages_introduction/page3.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';



class IntroductionScreen extends StatefulWidget {
  const IntroductionScreen({Key? key}) : super(key: key);

  @override
  State<IntroductionScreen> createState() => _IntroductionScreenState();
}

class _IntroductionScreenState extends State<IntroductionScreen> {
  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    bool onLastPage = false;

    return Scaffold(
      body:Stack(
        children:[
          PageView(
            controller: _controller,
              onPageChanged: (index){
              print(index);
                setState(() {
                  onLastPage=(index==2);
                });
                print(onLastPage);
              },
            children:[
              Page1(),
              Page2(),
              Page3()
            ]
          ),
          Container(
              alignment: Alignment(0,0.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  // bouton skip

                  SmoothPageIndicator(controller: _controller,count: 3,
                    effect: SlideEffect(
                        spacing:  8.0,
                        radius:  9.0,

                        paintStyle:  PaintingStyle.stroke,
                        strokeWidth:  0.9,
                        dotColor:  Colors.grey,
                        activeDotColor:  Colors.blue
                    ),),

                  //bouton next



                ],
              ))
        ]
      )
    );
  }
}
