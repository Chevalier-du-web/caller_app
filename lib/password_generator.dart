import 'dart:math';
import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

import 'chat_page/services/assets_manager.dart';



class PasswordGenerator extends StatefulWidget {
  @override
  _PasswordGeneratorState createState() => _PasswordGeneratorState();
}

class _PasswordGeneratorState extends State<PasswordGenerator> {
  int _passwordLength = 12;
  late String _generatedPassword;

  void _generatePassword() {
    const String chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789!@#\$%^&*()-_=+';

    String password = '';
    final Random random = Random();

    for (int i = 0; i < _passwordLength; i++) {
      password += chars[random.nextInt(chars.length)];
    }

    setState(() {
      _generatedPassword = password;
    });
  }

  void _copyToClipboard() {
    FlutterClipboard.copy(_generatedPassword).then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Mot de passe copié dans le presse-papiers'),
        ),
      );
    });
  }

  @override
  void initState() {
    super.initState();
    _generatePassword();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generateur de mot de passe'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/18,),
              Container(
                height: 100,
                width: 100,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AssetsManager.userImage)
                  )
                ),
              ),
              Text(
                'Mot de passe généré :',
                style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 28),
              Container(
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(10)
                ),
                child: SelectableText(
                  _generatedPassword,
                  style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Longueur du mot de passe : $_passwordLength',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 17),),

                ],
              ),
              Slider(
                value: _passwordLength.toDouble(),
                min: 4,
                max: 50,
                onChanged: (value) {
                  setState(() {
                    _passwordLength = value.toInt();
                  });
                },
              ),
          ElevatedButton(
            onPressed: () {

              _generatePassword();
            },
            child: Text('Generer le mot de passe'),
          ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  _copyToClipboard();
                },
                child: Text('Copier dans le presse-papiers'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
