import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/tip_provider.dart';
import 'package:provider/provider.dart';

class AddTipPage extends StatelessWidget {
  final Tip tips;
  AddTipPage({super.key, required this.tips});

  final tipTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Tip"),
      ),
      body: Column(
        children: [
          TextField(
            controller: tipTextController,
          ),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () {
                context.read<TipProvider>().addTip(
                    tip: Tip(text: tipTextController.text, id: tips.id));
                context.pop();
              },
              child: Text("submit"))
        ],
      ),
    );
  }
}
