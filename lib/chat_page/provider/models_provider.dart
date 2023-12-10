
import 'package:flutter/material.dart';

import '../models/models_model.dart';
import '../services/api_service.dart';

class ModelsProvider with ChangeNotifier {
  String currentModel = 'babbage';

  Future<List<ModelsModel>> get getAllModelsProvider {
    return ApiService.getModels();
  }

  String get getCurrentModel {
    return currentModel;
  }

  String setCurrentModel(String newModel) {
    currentModel = newModel;
    return currentModel;
  }
}
