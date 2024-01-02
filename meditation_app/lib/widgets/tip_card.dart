import 'package:flutter/material.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/providers/tip_provider.dart';
import 'package:provider/provider.dart';

class TipCard extends StatelessWidget {
  TipCard({Key? key, required this.tip}) : super(key: key);

  final Tip tip;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      margin: EdgeInsets.only(bottom: 10),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              tip.text!,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Author: ${tip.author ?? "Unknown"}',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.grey,
              ),
            ),
            Card(
              child: IconButton(
                onPressed: () {
                  final tipProvider =
                      Provider.of<TipProvider>(context, listen: false);
                  tipProvider.deleteTask(id: tip.id);
                },
                icon: const Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
