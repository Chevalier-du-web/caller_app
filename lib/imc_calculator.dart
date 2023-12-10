import 'package:flutter/material.dart';
import 'package:clipboard/clipboard.dart';

import 'chat_page/services/assets_manager.dart';



class BMICalculator extends StatefulWidget {
  @override
  _BMICalculatorState createState() => _BMICalculatorState();
}

class _BMICalculatorState extends State<BMICalculator> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  double bmiResult = 0.0;

  void calculateBMI() {
    double weight = double.tryParse(weightController.text) ?? 0.0;
    double height = double.tryParse(heightController.text) ?? 0.0;

    if (weight > 0 && height > 0) {
      double heightInMeters = height / 100;
      double bmi = weight / (heightInMeters * heightInMeters);

      setState(() {
        bmiResult = bmi;
      });
    } else {
      setState(() {
        bmiResult = 0.0;
      });
    }
  }

  void copyToClipboard() {
    FlutterClipboard.copy('Votre IMC est : ${bmiResult.toStringAsFixed(2)}').then((result) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Résultat copié dans le presse-papiers'),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculateur IMC'),
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
                        image: AssetImage('assets/doctor.png')
                    )
                ),
              ),
              TextField(
                controller: weightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Poids (kg)'),
              ),
              SizedBox(height: 16),
              TextField(
                controller: heightController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(labelText: 'Taille (cm)'),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  calculateBMI();
                },
                child: Text('Calculer IMC'),
              ),
              SizedBox(height: 16),
              Text(
                'Votre IMC est : ${bmiResult.toStringAsFixed(2)}',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  copyToClipboard();
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
