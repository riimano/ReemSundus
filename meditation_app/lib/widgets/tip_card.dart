import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';

class TipCard extends StatelessWidget {
  TipCard({super.key, required this.tip});
  Tip tip;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: double.infinity,
      color: const Color.fromARGB(255, 207, 240, 255),
      child: Column(
        children: [
          Text(tip.text!),
          Text(tip.author!),
        ],
      ),
    );
  }
}
