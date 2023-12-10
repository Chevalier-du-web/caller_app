// ignore_for_file: avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../constantes/api_consts.dart';
import '../models/chat_model.dart';
import '../models/models_model.dart';


List<ChatModel> chatList = [];

class ApiService {
  static Future<List<ModelsModel>> getModels() async {
    try {
      final response = await http.get(
        Uri.parse('$BASE_URL/models'),
        headers: {'Authorization': 'Bearer $API_KEY'},
      );

      final Map jsonResponse = jsonDecode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }

      final List temp = [];
      for (var value in jsonResponse['data']) {
        temp.add(value);
      }
      return ModelsModel.modelsFromSnapShot(temp);
    } catch (error) {
      print('error--> $error');
      rethrow;
    }
  }

  static Future<List<ChatModel>> sendMessage(
      {required String message, required String modelId}) async {
    try {
      final response = await http.post(
        Uri.parse('$BASE_URL/chat/completions'),
        headers: {
          'Authorization': 'Bearer $API_KEY',
          'Content-Type': 'application/json'
        },
        body: jsonEncode(
          {
            "model": "gpt-3.5-turbo",
            "messages": [
              {
                "role": "system",
                "content": "You are a helpful assistant."
              },
              {
                "role": "user",
                "content": message
              }
            ]
          },
        ),
      );


      final Map jsonResponse = json.decode(response.body);
      if (jsonResponse['error'] != null) {
        throw HttpException(jsonResponse['error']['message']);
      }


      chatList = List.generate(
        jsonResponse['choices'].length,
            (index) => ChatModel(
          msg: DecodeText(jsonResponse['choices'][index]['message']['content']),
          chatIndex: index + 1,
        ),
      );
      var jsonData =jsonResponse['choices'][0] as Map;

      // print("liste de chat : ${jsonResponse['choices'][0]}");
      print("liste de chat2 : ${jsonResponse['choices'][0]['message']['content']}");
      print("liste de chat 3 : ${jsonResponse}");


      return chatList;
    } catch (error) {
      print('error--> $error');
      rethrow;
    }
  }
  static String DecodeText(String text){
    var bytes = latin1.encode(text);
    var result = utf8.decode(bytes);
    return utf8.decode(bytes);
  }
  //
}