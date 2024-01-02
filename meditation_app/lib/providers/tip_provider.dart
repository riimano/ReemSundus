import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/services/tips_service.dart';

class TipProvider extends ChangeNotifier {
  List<Tip> tips = [];

  Future<void> getTips() async {
    tips = await TipService().getTips();
    print("i'm in provider: $tips");
    notifyListeners();
  }

  Future<void> addTip({required Tip tip}) async {
    Tip newTip = await TipService().addTip(tip: tip);
    tips.add(newTip);
    notifyListeners();
  }

  Future<void> deleteTask({required int? id}) async {
    tips.removeWhere((element) => element.id == id);
    tips.remove(tips);
    notifyListeners();
  }
}
