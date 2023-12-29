import 'package:dio/dio.dart';
import 'package:meditation_app/models/med_model.dart';
import 'package:meditation_app/services/client.dart';

class MedService {
  Future<List<Med>> getTodosListApi() async {
    try {
      final responseValue = await ApiClient.get("/meds");
      if (responseValue.statusCode == 200) {
        final MedModel medModel = MedModel.fromJson(responseValue.data);
        return medModel.data;
      }
      return [];
    } catch (e) {
      throw e.toString();
    }
  }

  createTodoApi(String medName, bool? isComplete) async {
    try {
      final Response response = await ApiClient.post(
        "/meds",
        data: {
          "medName": medName,
          "isComplete": isComplete,
        },
      );
      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }

  updateTodoApi(String id, bool? isComplete) async {
    try {
      final response = await ApiClient.put(
        "meds/$id",
        data: {
          "isComplete": isComplete,
        },
      );

      return response.data;
    } catch (e) {
      throw e.toString();
    }
  }
}
