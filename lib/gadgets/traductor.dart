import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class TraductorPage extends StatefulWidget {
  const TraductorPage({Key? key}) : super(key: key);

  @override
  _TraductorPageState createState() => _TraductorPageState();
}

class _TraductorPageState extends State<TraductorPage> {
  final _textController = TextEditingController();
  String _translatedText = '';
  String _sourceLang = 'en';
  String _targetLang = 'fr';

  Future<void> _translateText() async {
    final apiKey = 'YOUR_API_KEY_HERE';
    final baseUrl = 'https://translation.googleapis.com/language/translate/v2';
    final url =
        '$baseUrl?q=${_textController.text}&source=$_sourceLang&target=$_targetLang&key=$apiKey';

    final response = await http.post(Uri.parse(url));

    if (response.statusCode == 200) {
      final jsonResponse = jsonDecode(response.body);
      setState(() {
        _translatedText = jsonResponse['data']['translations'][0]['translatedText'];
      });
    } else {
      setState(() {
        _translatedText = '';
      });
    }
  }

  Future<void> _copyTranslatedText() async {
    await Clipboard.setData(ClipboardData(text: _translatedText));
    Fluttertoast.showToast(msg: 'Texte traduit copié dans le presse-papiers.');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Traducteur'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: _textController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Entrez le texte à traduire',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              DropdownButton<String>(
                value: _sourceLang,
                onChanged: (value) {
                  setState(() {
                    _sourceLang = value!;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: 'en',
                    child: Text('Anglais'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'fr',
                    child: Text('Français'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'es',
                    child: Text('Espagnol'),
                  ),
                  // Ajoutez ici les autres langues que vous souhaitez prendre en charge
                ],
              ),
              Text('vers'),
              DropdownButton<String>(
                value: _targetLang,
                onChanged: (value) {
                  setState(() {
                    _targetLang = value!;
                  });
                },
                items: [
                  DropdownMenuItem<String>(
                    value: 'fr',
                    child: Text('Français'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'en',
                    child: Text('Anglais'),
                  ),
                  DropdownMenuItem<String>(
                    value: 'es',
                    child: Text('Espagnol'),
                  ),
                  // Ajoutez ici les autres langues que vous souhaitez prendre en charge
                ],
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () async {
              await _translateText();
            },
            child: Text('Traduire'),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                child: Text(
                  _translatedText,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () async {
              await _copyTranslatedText();
            },
            child: Text('Copier le texte traduit'),
          ),
        ],
      ),
    );
  }
}
