import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flag/flag.dart';
import 'package:social_login_buttons/social_login_buttons.dart';
import '../components/button.dart';
import '../homepage.dart';

class OnboardingPageModel {
  final String title;
  final String description;
  final String question1;
  final String question2;
  final String reponse1;
  final String personal;
  final String image;
  final Color bgColor;
  final Color textColor;


  OnboardingPageModel(
      {required this.title,
        required this.description,
        required this.image,
        required this.question1,
        required this.personal,
        required this.question2,
        required this.reponse1,
        this.bgColor = Colors.white,
        this.textColor = Colors.blue});
}

class OnboardingPage extends StatefulWidget {
  final List<OnboardingPageModel> pages;

  const OnboardingPage({Key? key, required this.pages}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage>with SingleTickerProviderStateMixin  {
  // Store the currently visible page
  int _currentPage = 0;
  // Define a controller for the pageview
  final PageController _pageController = PageController(initialPage: 0);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.blue.withOpacity(.2),
              Colors.white,Colors.blue.withOpacity(.1)],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
          image: DecorationImage(
            image: AssetImage('assets/bg2.jpg'),fit: BoxFit.cover
          )
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          color: Colors.transparent,
          child: SafeArea(

            child: Column(
              children: [
                Expanded(
                  // affichage de la page
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: widget.pages.length,
                    onPageChanged: (idx) {
                      // changement de page
                      setState(() {
                        _currentPage = idx;
                      });
                    },
                    itemBuilder: (context, idx) {
                      final _item = widget.pages[idx];
                      return Container(
                        color: Colors.transparent,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    AnimatedTextKit(
                                      repeatForever: true,
                                      animatedTexts: [
                                      TypewriterAnimatedText(_item.title,
                                          textStyle:TextStyle(fontSize: 28,
                                              fontWeight: FontWeight.bold,color:Colors.black),
                                          speed: Duration(milliseconds: 140) ),

                                    ],
                                    ),
                                    Text(_item.description,
                                      style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.black.withOpacity(.7)),
                                    ),
                                    _currentPage !=2?
                                    AnimationWidget(
                                        question1: _item.question1,
                                        question2: _item.question2,
                                        reponse1: _item.reponse1,
                                        image: _item.image, personal: _item.personal,):
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          child: Column(
                                            children: [
                                              // contenu de la derniere page ...
                                              Container(
                                                height:200,
                                                width:200,
                                                margin: EdgeInsets.only(top: 30),
                                                decoration: BoxDecoration(
                                                  color: Colors.transparent,
                                                  borderRadius: BorderRadius.circular(40),
                                                  image: DecorationImage(
                                                    image: AssetImage("assets/opinion.gif")
                                                  )
                                                ),
                                              ),
                                              SizedBox(height: 40,),
                                              Text("Avec votre assistant personnel,",
                                                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                              SizedBox(height: 10,),
                                              Text("Soyz plus productif et perfomant.",
                                                  style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold)),
                                              SizedBox(height: 10,),
                                              Row(
                                                children: [
                                                  Text("100% Camerounais ☺💥🔥",style: TextStyle(fontSize: 17,fontWeight: FontWeight.bold)),
                                                  Flag.fromCode(
                                                    FlagsCode.CM,
                                                    height: 20,
                                                    width: 30,
                                                    fit: BoxFit.fill,
                                                  ),
                                                ],
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ),
                            ),

                          ],
                        ),
                      );
                    },
                  ),
                ),

                // Current page indicator
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: widget.pages
                      .map((item) => AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    width: _currentPage == widget.pages.indexOf(item)
                        ? 20
                        : 4,
                    height: 4,
                    margin: const EdgeInsets.all(2.0),
                    decoration: BoxDecoration(
                        color: Colors.indigo,
                        borderRadius: BorderRadius.circular(10.0)),
                  ))
                      .toList(),
                ),

                // Bottom buttons
                SizedBox(
                  height: 80,
                  child: Row(
                    mainAxisAlignment: _currentPage==2?MainAxisAlignment.center:MainAxisAlignment.spaceBetween,
                    children: [
                      _currentPage==2?Container():TextButton(
                          onPressed: () {
                            // Handle Skipping onboarding page
                            _pageController.animateToPage(2,
                                curve: Curves.easeInOutCubic,
                                duration: const Duration(milliseconds: 250));                        },
                          child: Container(
                            margin: EdgeInsets.only(left: 15),
                            padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                            decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                            ),
                            child: Text(
                              _currentPage==2?"":"Passer",
                              style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                            ),
                          )),
                      TextButton(
                        onPressed: () {
                          if (_currentPage == widget.pages.length - 1) {
                            // This is the last page
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginPage()));
                          } else {
                            _pageController.animateToPage(_currentPage + 1,
                                curve: Curves.easeInOutCubic,
                                duration: const Duration(milliseconds: 250));
                          }
                        },
                        child: _currentPage==2?
                        Container(

                          padding: EdgeInsets.only(left: 90,right: 90,top: 20,bottom: 20),
                          decoration: BoxDecoration(
                              color: Colors.indigoAccent,
                              borderRadius: BorderRadius.circular(50)
                          ),
                          child: const Text(
                            "Commencer "
                            ,
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20),
                          ),
                        ):
                        Container(
                          margin: EdgeInsets.only(left: 15),
                          padding: EdgeInsets.only(left: 20,right: 20,top: 10,bottom: 10),
                          decoration: BoxDecoration(
                            color: Colors.indigoAccent,
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomRight: Radius.circular(20))
                          ),
                          child: Text(
                            "Suivant  ",
                            style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class OnboardingMalia extends StatefulWidget {
  const OnboardingMalia({Key? key}) : super(key: key);

  @override
  State<OnboardingMalia> createState() => _OnboardingMaliaState();
}

class _OnboardingMaliaState extends State<OnboardingMalia> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingPage(
          pages:[
            OnboardingPageModel(
                title: "Demandez tout à Malia",
                description: "posez toutes vos préoccupations, vous serez ébloui par un résultat rapide",
                image: 'assets/logo.png',
                question1: 'Comment améliorer l\'accès à l\'éducation pour les populations défavorisées?',
                question2: 'Waaouhh merci beaucoup Coucou 😊',
                reponse1: 'Pour améliorer l\'accès à l\'éducation des populations défavorisées,'
                    ' il est possible de mettre en place des programmes d\'aide financière,'
                    'de mentorat, de formation professionnelle, de sensibilisation, de nutrition,'
                    ' de transport, d\'alphabétisation et de partenariats avec '
                    'des organisations locales.',
                personal: 'Malia AI'),

            OnboardingPageModel(
                title: "Discutez avec un spécialiste en Santé",
                description: "Ne négligez plus votre vie.",
                image: 'assets/doctor.png',
                question1: 'Qu\'est-ce que le cancer et comment est-il diagnostiqué et traité ?',
                question2: 'Et qu\'est-ce que le VIH/SIDA Docteur ?',
                reponse1: 'Le cancer est une maladie caractérisée par la croissance anormale '
                    'et incontrôlée de cellules. Le diagnostic peut être établi par une biopsie'
                    ' ou d\'autres tests tels que des scanners ou des radiographies.'
                    ' Le traitement dépend du type et de la gravité de la maladie et '
                    'peut inclure la chirurgie, la radiothérapie, la chimiothérapie,'
                    ' l\'immunothérapie ou les thérapies ciblées..',
                personal: 'Mon Docteur'),

            OnboardingPageModel(
                title: "Le BOSS c'est vous !!!",
                description: "Désormais vous aurez les réponses à tous vos malentendus dans n'importe quel domaine.",
                image: 'assets/don.gif',
                question1: '',
                question2: '',
                reponse1: '',
                personal: '')

          ] ),
    );
  }
}

var reponse = "La voiture telle que nous la connaissons aujourd'hui"
    " a été inventée par Karl Benz en 1885. Benz était un ingénieur "
    "allemand qui a fondé la société Benz & Cie en 1883. Il a conçu et "
    "construit la première automobile à moteur à combustion interne,"
    " la Benz Patent Motorwagen, en 1885";

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({Key? key,
    required this.question1, required this.question2,
    required this.reponse1, required this.image,
    required this.personal}) : super(key: key);
  final String question1;
  final String question2;
  final String reponse1;
  final String image;
  final String personal;

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>with SingleTickerProviderStateMixin {

  late AnimationController controller;
  late Animation<Offset> offset1, offset2, offset3,offset4;
  late Animation<double> opacity1, opacity2, opacity3,opacity4;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );

    offset1 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeOut),
    ));

    offset2 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.3, 0.8, curve: Curves.easeOut),
    ));

    offset3 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.6, 1.0, curve: Curves.easeOut),
    ));

    offset4 = Tween<Offset>(
      begin: Offset(0.0, 1.0),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.9, 1.0, curve: Curves.easeOut),
    ));


    opacity1 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.0, 0.5, curve: Curves.easeOut),
    ));

    opacity2 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.3, 0.8, curve: Curves.easeOut),
    ));

    opacity3 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.6, 1.0, curve: Curves.easeOut),
    ));

    opacity4 = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: controller,
      curve: Interval(0.9, 1.0, curve: Curves.easeOut),
    ));

    controller.forward();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
      Container(
        width: 500,
        height: MediaQuery.of(context).size.height/1.7-15,
        margin: EdgeInsets.only(top: 20,left: 40),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            )
          ],
        ),
        child: Column(
          children: [
            SlideTransition(
              position: offset1,
              child: FadeTransition(
                opacity: opacity1,
                child: Row(
                  children: [
                    Container(
                      height: 40,
                      width: 40,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 3,
                              blurRadius: 7,
                              offset: Offset(0, 3), // changes position of shadow
                            )
                          ],
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: AssetImage(widget.image)
                          )
                      ),

                    ),
                    Text(widget.personal,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: offset2,
              child: FadeTransition(
                opacity: opacity2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      width: 230,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(widget.question1,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: offset3,
              child: FadeTransition(
                opacity: opacity3,
                child:Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(
                        width:240,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.indigo.withOpacity(.4),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(widget.reponse1,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)),
                  ],
                ),
              ),
            ),
            SlideTransition(
              position: offset4,
              child: FadeTransition(
                opacity: opacity4,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        width: 230,
                        padding: EdgeInsets.all(10),
                        margin: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(.2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Text(widget.question2,style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold))),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
  }
}


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(left: 30,right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(top: 70,bottom: 20),
              child: Row(
                children: [
                  Container(
                    height: 40,
                    margin: EdgeInsets.only(right: 10),
                    width: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),

                      image: DecorationImage(
                        image: AssetImage('assets/logo.png')
                      )
                    ),
                  ),
                  Text("Malia AI",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
                ],
              ),
            ),

            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Votre assistant IA Personnel",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 10,bottom: 10),
              height: 200,
              decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                  image: AssetImage('assets/login.png')
                )
              ),
            ),

            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  onTap: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>PhoneLogin())),
                  child: Container(
                    height: 55,
                    width: 275,
                    margin: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(70),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 3,
                          blurRadius: 7,
                          offset: Offset(0, 3), // changes position of shadow
                        )
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                            margin: EdgeInsets.only(left: 22,right: 20),
                            child: Icon(Icons.phone)),
                        Text("Se connecter avec un numéro",style: TextStyle(fontSize: 14,fontWeight: FontWeight.bold),)
                      ],
                    ),
                  ),
                ),

                Container(
                  width: 275,
                  height: 55,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(70),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      )
                    ],
                  ),
                  child: SocialLoginButton(
                    borderRadius: 90,
                    buttonType: SocialLoginButtonType.google,
                    text: "Se connecter avec Google",
                    onPressed: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 40,),

            Text("En continuant, vous acceptez nos",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Politiques d'utilisation ",style: TextStyle(fontSize: 15,color: Colors.teal,fontWeight: FontWeight.bold),),
                Text("et de ",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),
                Text("Confidentialité.",style: TextStyle(fontSize: 15,color: Colors.teal,fontWeight: FontWeight.bold))
              ],
            )
          ],
        ),
      ),
    );
  }
}


/// page de connexion 
class PhoneLogin extends StatefulWidget {
  const PhoneLogin({Key? key}) : super(key: key);

  @override
  State<PhoneLogin> createState() => _PhoneLoginState();
}

class _PhoneLoginState extends State<PhoneLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Composant du profil du user....
            HeaderProfil(userPhone: '+237657591936',),
            SizedBox(height: 60,),

            // PersonalityWidget(
            //   title: 'Assistant aux problemes de sante',
            //   description: "Salut, je suis votre medecin personnel present pour repondre "
            //       "a toutes vos...",
            //   image: "assets/doctor.png",
            // ),
            //MaliaPro()
          ],
        ),
      ),
    );
  }
}

// entete de la page profil
class HeaderProfil extends StatefulWidget {
  const HeaderProfil({Key? key, required this.userPhone}) : super(key: key);
  final String userPhone;

  @override
  State<HeaderProfil> createState() => _HeaderProfilState();
}

class _HeaderProfilState extends State<HeaderProfil> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.blue.withOpacity(.2),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(80))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                height: 120,
                width: 120,
                margin: EdgeInsets.only(top: 50,bottom: 10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(70)
                ),
                child: Icon(Icons.person,size: 70,color: Colors.white,),

              ),
              Text(widget.userPhone,style:TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              SizedBox(height: 30,)
            ],
          ),
        ],
      ),
    );
  }
}


// composant de l'accueil pour les personnalites de domaine ...

class PersonalityWidget extends StatefulWidget {
  const PersonalityWidget({Key? key, required this.title, required this.description, required this.image}) : super(key: key);
  final String title;
  final String description;
  final String image;

  @override
  State<PersonalityWidget> createState() => _PersonalityWidgetState();
}

class _PersonalityWidgetState extends State<PersonalityWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10,right: 10,bottom: 10),
      decoration: BoxDecoration(
        color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 3,
              blurRadius: 7,
              offset: Offset(0, 3), // changes position of shadow
            )
          ],
        borderRadius: BorderRadius.circular(8)
      ),
      child: Row(
        children: [
          Container(
            height: 50,
            width: 50,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  )
                ],
              image: DecorationImage(
                image: AssetImage(widget.image)
              )
            ),
          ),
          Column(
            children: [
              Text(widget.title,style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
              Container(
                width: 240,
                margin: EdgeInsets.only(top: 3),
                child: Text(widget.description,
                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400)),
              )
            ],
          )
        ],
      ),
    );
  }
}

// composant pour les formules ....

class MaliaPro extends StatefulWidget {
  const MaliaPro({Key? key}) : super(key: key);

  @override
  State<MaliaPro> createState() => _MaliaProState();
}

class _MaliaProState extends State<MaliaPro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 20,right: 20),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 50,
                width: 50,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 3,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                      )
                    ],
                    image: DecorationImage(
                        image: AssetImage("assets/logo.png")
                    )
                ),
              ),
              Text(" Malia Pro",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
            ],
          ),


          SizedBox(height: 20,),
          CardWidgetPro(image: "assets/chat.png", title: "Plus de requêtes", description: "5000 requêtes par mois",),
          CardWidgetPro(image: "assets/deep.png", title: "Modeles puissants", description: "GPT-4,Claude et plus",),
          CardWidgetPro(image: "assets/buy.png", title: "Disponible sur toutes les\n Plateformes", description: "Android, IOS, Web",),

          // formules...
          FormuleMalia(title: "Formule simple", description: " 08 requêtes sans delai", price: 200, recude: "+20%",),
          FormuleMalia(title: "Formule avancée", description: " 25 requêtes sans delai", price: 500, recude: "+30%",),
          FormuleMalia(title: "Formule Pro", description: " 32 requêtes sans delai", price: 600, recude: "+30%",),

          // boutton d'essai gratuit ...

          InkWell(
            onTap: (){
              // fonction de transition du home ...
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(70)
              ),
              child: Center(
                  child: Text("Commencer l'essai gratuit",style: TextStyle(fontSize: 17,color: Colors.white,fontWeight: FontWeight.bold),)),
            ),
          ),

          // regles de confidentialite ...
          Container(
            margin: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Conditions d'utilisation",style: TextStyle(fontSize: 15)),
                Text("Confidentialité",style: TextStyle(fontSize: 15),

    )
              ],
            ),
          ),

        ],
      ),
    );
  }
}

// composant pour afficher les caracteristiques de formules
class CardWidgetPro extends StatefulWidget {
  const CardWidgetPro({Key? key, required this.image, required this.title, required this.description}) : super(key: key);
  final String image;
  final String title;
  final String description;

  @override
  State<CardWidgetPro> createState() => _CardWidgetProState();
}

class _CardWidgetProState extends State<CardWidgetPro> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Container(
            height: 35,
            width: 35,
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                color: Colors.transparent,
                image: DecorationImage(
                    image: AssetImage(widget.image,)
                )
            ),
          ),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold),),
              Text(widget.description,style: TextStyle(fontSize: 17))
            ],
          )
        ],
      ),
    );
  }
}

/// composant pour les formules ...
class FormuleMalia extends StatefulWidget {
  const FormuleMalia({Key? key, required this.title,
    required this.description, required this.price,
    required this.recude}) : super(key: key);
  final String title;
  final String description;
  final int price;
  final String recude;

  @override
  State<FormuleMalia> createState() => _FormuleMaliaState();
}

class _FormuleMaliaState extends State<FormuleMalia> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      margin: EdgeInsets.only(bottom: 9),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(.1),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 3,color: Colors.blue)
      ),
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.title,style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
              Text(widget.description,style: TextStyle(fontSize: 17),)
            ],
          ),
          Row(
            children: [
              Container(
                height: 20,
                width: 50,
                padding: EdgeInsets.all(2),
                margin: EdgeInsets.only(left: 8,right: 8),
                decoration: BoxDecoration(
                  color: Colors.blue,
                  borderRadius: BorderRadius.circular(30)
                ),
                child: Center(child: Text(widget.recude,style: TextStyle(color: Colors.white),)),
              ),
              Text("${widget.price} CFA",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          )
        ],
      ),
    );
  }
}




