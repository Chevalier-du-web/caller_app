import 'package:caller/pages/introduction_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.dart';
import 'package:adaptive_theme/adaptive_theme.dart';



int? initScreen;

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences preferences = await SharedPreferences.getInstance();
  initScreen = await preferences.getInt('initScreen');
  await preferences.setInt('initScreen',1);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return AdaptiveTheme(
      light: ThemeData(
          brightness: Brightness.light,
          primarySwatch: Colors.teal
      ),
      dark: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.teal
      ),
      initial: AdaptiveThemeMode.light,
      builder: (theme, Darktheme)=>MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Servus ',
        darkTheme: Darktheme,
        theme: theme,

// home: isviwed !=0 ? IntroductionScreen():HomePage(),
        initialRoute: initScreen ==0 || initScreen ==null?'onBoard':'home',
        routes: {
          'home' : (context)=>HomePage(),
          'onBoard' : (context)=>IntroductionScreen()
        },
      ),
    );
  }
}


