import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/tip.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/views/add_tip_page.dart';
import 'package:meditation_app/views/home_page.dart';
import 'package:meditation_app/views/music.dart';
import 'package:meditation_app/views/signin.dart';
import 'package:meditation_app/views/signup.dart';
import 'package:meditation_app/views/tips.dart';
import 'package:meditation_app/views/user_profile.dart';
import 'package:meditation_app/views/yoga_video.dart';

final router = GoRouter(routes: [
  GoRoute(
    path: "/home",
    name: "home",
    builder: (context, state) => MyHomePage(user: state.extra as User),
  ),
  GoRoute(
    path: "/",
    name: 'signup',
    builder: (context, state) => SignupPage(),
  ),
  GoRoute(
    path: "/MyProfile",
    name: 'MyProfile',
    builder: (context, state) => MyProfile(user: state.extra as User),
  ),
  GoRoute(
    path: "/signin",
    name: "signin",
    builder: (context, state) => SigninPage(),
  ),
  // GoRoute(
  //   path: "/Meditation",
  //   name: "Meditation",
  //   builder: (context, state) => Meditation(),
  // ),
  GoRoute(
    path: "/Music",
    name: "Music",
    builder: (context, state) => Music(),
  ),
  GoRoute(
    path: "/Tips",
    name: "Tips",
    builder: (context, state) => TipsListPage(),
  ),
  GoRoute(
    path: "/Yoga",
    name: "Yoga",
    builder: (context, state) => Yoga(),
  ),
  GoRoute(
    path: "/addTip",
    name: "addTip",
    builder: (context, state) => AddTipPage(),
  ),
]);
