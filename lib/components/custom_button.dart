import 'package:flutter/material.dart';
import 'package:async_button_builder/async_button_builder.dart';


class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, required this.onPress, required this.title}) : super(key: key);
  final VoidCallback onPress;
  final String title;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return AsyncButtonBuilder(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        child: Text(
          widget.title,
          style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.bold),
        ),
      ),
      loadingWidget: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 16.0,
          width: 16.0,
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        ),
      ),
      successWidget: Padding(
        padding: const EdgeInsets.all(4.0),
        child: Icon(
          Icons.check,
          color: Colors.purpleAccent,
        ),
      ),
      onPressed: () async {
        await Future.delayed(Duration(seconds: 4),()=>widget.onPress());

      },
      loadingSwitchInCurve: Curves.bounceInOut,
      loadingTransitionBuilder: (child, animation) {
        return SlideTransition(
          position: Tween<Offset>(
            begin: Offset(0, 1.0),
            end: Offset(0, 0),
          ).animate(animation),
          child: child,
        );
      },
      builder: (context, child, callback, state) {
        return Container(
          width: 310,
          child: Material(
            color: state.maybeWhen(
              success: () => Colors.purple[100],
              orElse: () => Colors.blue,
            ),
            // This prevents the loading indicator showing below the
            // button
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: child,
              ),
              onTap: callback,
            ),
          ),
        );
      },
    );
  }
}
