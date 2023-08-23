import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';


class CustomButton extends StatefulWidget {
  const CustomButton({Key? key, required this.onpressed, required this.title}) : super(key: key);
  final VoidCallback onpressed;
  final String title;

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  dynamic savedThemeMode;
   bool  darkMode = true ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getCurrentTheme();
  }
  Future getCurrentTheme() async {
    savedThemeMode = await AdaptiveTheme.getThemeMode();
    print(savedThemeMode.toString());
    if(savedThemeMode.toString() =='AdaptiveThemeMode.dark'){
      setState(() {
        darkMode = true;
      });
    }else{
      setState(() {
        darkMode = false;
      });
    }

  }
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      padding: EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: Material(
        elevation: 6,
        color:Colors.teal,
        borderRadius: BorderRadius.circular(16),
        child: MaterialButton(
          onPressed: widget.onpressed,
          autofocus: true,
          height: 55,
          minWidth: MediaQuery.of(context).size.width * 0.5,
          child: Stack(
            alignment: Alignment.center,
            children: [
              Text(
                widget.title,
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  color: Colors.white
                ),

              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(.5),
                          shape: BoxShape.circle),
                      child: const Icon(
                        Icons.monetization_on_outlined,size: 18,
                        color: Colors.white,
                      ))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
