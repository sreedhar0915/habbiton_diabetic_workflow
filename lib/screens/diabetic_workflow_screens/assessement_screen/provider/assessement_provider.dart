import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:habbiton_diabetic_workflow/api_services/app_repositry.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/assessement_screen/model/assessement_model.dart';

class DiabetesController with ChangeNotifier {
  final AppRepository _repository = AppRepository();

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<bool> postDiabetesData(DiabetesModel data) async {
    _isLoading = true;
    notifyListeners();

    try {
      final response = await _repository.postDiabetes(data: data);

      if (response['success'] == true) {
        Fluttertoast.showToast(
            msg: response['message'] ?? 'Submitted successfully!');
        return true;
      } else {
        Fluttertoast.showToast(
            msg: response['message'] ?? 'Submission failed.');
        return false;
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Error: ${e.toString()}');
      return false;
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
