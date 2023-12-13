import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;



import 'dart:convert';
import 'package:http/http.dart' as http;

import 'chat_page/services/assets_manager.dart';
import 'components/custom_button.dart';

class LoveCalculatorService {
  final String apiUrl = 'https://love-calculator.p.rapidapi.com/getPercentage';

   Future<dynamic> calculateLove(String name1, String name2) async {
    final response = await http.get(
      Uri.parse('$apiUrl?sname=$name1&fname=$name2'),
      headers: {
        'X-RapidAPI-Key': '9d2d9d77ddmsha647758ba32ff6cp1a9becjsn6eeaecc44601',
        'X-RapidAPI-Host': 'love-calculator.p.rapidapi.com',
      },
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print(data);
      return {
        "percentage":data['percentage'],
        "result":data['result']
      };
    } else {
      throw Exception('Failed to load love percentage');
    }
  }
}



class LoveCalculator extends StatefulWidget {
  @override
  _LoveCalculatorState createState() => _LoveCalculatorState();
}

class _LoveCalculatorState extends State<LoveCalculator> {
  TextEditingController name1Controller = TextEditingController();
  TextEditingController name2Controller = TextEditingController();
  String lovePercentage = "0";
  String loveResult = "En attente";
  LoveCalculatorService loveCalculatorService = LoveCalculatorService();


  Future<void> _calculateLove() async {
    try {
      LoveCalculatorService loveCalculatorService = LoveCalculatorService();
      var percentage = await loveCalculatorService.calculateLove(
        name1Controller.text,
        name2Controller.text,
      );
      print(percentage);

      setState(() {
        lovePercentage = percentage['percentage'];
        loveResult = percentage['result'];
      });
    } catch (e) {
      print('Error: $e');
      // Gérer l'erreur, afficher un message à l'utilisateur, etc.
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Love Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              SizedBox(height: MediaQuery.of(context).size.height/32,),
              Container(
                height: 140,
                width: 140,
                margin: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/love.png")
                    )
                ),
              ),
              TextField(
                controller: name1Controller,
                decoration: InputDecoration(labelText: 'Nom de la première personne'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: name2Controller,
                decoration: InputDecoration(labelText: 'Nom de la deuxième personne'),
              ),
              SizedBox(height: 16),
              CustomButton(onPress: () {
                _calculateLove();
              }, title: 'Calculer l\'amour',),

              SizedBox(height: 16),
              Text(
                'Pourcentage d\'amour : ${lovePercentage} %',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              Text(
                'Conclusion : ${loveResult} ',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
