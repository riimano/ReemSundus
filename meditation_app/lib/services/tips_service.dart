import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/services/client.dart';

class TipService {
  Future<List<Tip>> getTips() async {
    List<Tip> tips = [];
    try {
      var res = await ApiClient.dio.get("/tips");

      tips = (res.data as List).map((tip) => Tip.fromJson(tip)).toList();
    } catch (e) {
      print(e);
    }
    return tips;
  }

  Future<Tip> addTip({required Tip tip}) async {
    late Tip newTip;
    try {
      var res = await ApiClient.dio.post('/tips', data: tip.toJson());
      newTip = Tip.fromJson(res.data);
    } catch (e) {
      print(e);
    }
    return newTip;
  }

  deleteTip({required Tip tip}) async {
    late Tip delTip;
    try {
      final res = await ApiClient.dio.delete('/tips', data: tip.toJson());
      delTip = Tip.fromJson(res.data);
    } catch (e) {
      print(e);
    }
    return delTip;
  }
}
