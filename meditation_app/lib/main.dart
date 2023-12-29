import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/med_provider.dart';
import 'package:meditation_app/views/home_page.dart';
import 'package:meditation_app/views/signin.dart';
import 'package:meditation_app/views/signup.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => MedProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }

//initialLocation: "/signup"
  final _router = GoRouter(routes: [
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: "/",
      name: 'signup',
      builder: (context, state) => SignupPage(),
    ),
    // GoRoute(
    //   path: "/",
    //   name: 'splash',
    //   builder: (context, state) => SplashScreen(),
    // ),
    GoRoute(
      path: "/signin",
      name: "signin",
      builder: (context, state) => SigninPage(),
    ),
  ]);
}
