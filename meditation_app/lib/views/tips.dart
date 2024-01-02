import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/tip_provider.dart';
import 'package:meditation_app/widgets/tip_card.dart';
import 'package:provider/provider.dart';

class TipsListPage extends StatefulWidget {
  TipsListPage({
    Key? key,
  });

  @override
  State<TipsListPage> createState() => _TipsListPageState();
}

class _TipsListPageState extends State<TipsListPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Tips"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            context.push('/addTip');
          },
          child: Icon(Icons.add),
        ),
        body: FutureBuilder(
          future: Provider.of<TipProvider>(context, listen: false).getTips(),
          builder: (context, dataSnapshot) {
            return Consumer<TipProvider>(
              builder: (context, tip, child) => ListView.builder(
                shrinkWrap: true,
                itemCount: tip.tips.length,
                itemBuilder: (context, index) => TipCard(tip: tip.tips[index]),
              ),
            );
          },
        ),
        // bottomNavigationBar: Card(
        //   child: IconButton(
        //     onPressed: () {
        //       final tipProvider =
        //           Provider.of<TipProvider>(context, listen: false);
        //       tipProvider.deleteTask(tips.id);
        //     },
        //     icon: const Icon(
        //       Icons.delete,
        //       color: Colors.red,
        //     ),
        //   ),
        // ),
      ),
    );
  }
}
