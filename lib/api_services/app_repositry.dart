import 'package:habbiton_diabetic_workflow/api_services/api_base_helpers.dart';
import 'package:habbiton_diabetic_workflow/screens/diabetic_workflow_screens/assessement_screen/model/assessement_model.dart';

class AppRepository {
  final ApiBaseHelper _helper = ApiBaseHelper();

  Future<dynamic> postDiabetes({required DiabetesModel data}) async {
    try {
      return await _helper.post("diabetes/", data.toJson());
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getDiabetes() async {
    try {
      return await _helper.get("diabetes/");
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> getDiabetesById(String id) async {
    try {
      return await _helper.get("diabetes/$id");
    } catch (e) {
      rethrow;
    }
  }
}
