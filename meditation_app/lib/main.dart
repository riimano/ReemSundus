import 'package:flutter/material.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/tip_provider.dart';
import 'package:meditation_app/routes.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    // ChangeNotifierProvider(
    //   create: (context) => MedProvider(),
    // ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => TipProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
    );
  }
}
