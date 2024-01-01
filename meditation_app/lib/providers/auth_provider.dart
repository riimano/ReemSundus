import 'package:flutter/material.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/services/auth_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider extends ChangeNotifier {
  final AuthService authService = AuthService();

  String token = "";

  Future<String> signup({required User user}) async {
    token = await authService.signup(user: user);
    print("Signup successful. Token: $token");

    notifyListeners();
    return token;
  }

  Future<String> signin({required User user}) async {
    token = await authService.signin(user: user);
    print("Signin successful. Token: $token");
    saveTokenInStorage(token);

    notifyListeners();
    return token;
  }

  Future<void> saveTokenInStorage(String token) async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.setString('token', token);
  }

  Future<String> readFromStorage() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    token = shared.getString('token') ?? "";

    notifyListeners();
    return token;
  }

  Future<void> logOut() async {
    SharedPreferences shared = await SharedPreferences.getInstance();
    shared.remove("token");
    token = "";
    print("Logged out. Token: $token");
    saveTokenInStorage(token);
    notifyListeners();
  }

  // bool get isAuth {
  //   if (token.isNotEmpty) {
  //     try {
  //       if (Jwt.getExpiryDate(token)!.isAfter(DateTime.now())) {
  //         user = User.fromJson(Jwt.parseJwt(token));
  //         print("User is authenticated. Username: ${user?.username ?? 'NULL'}");
  //         return true;
  //       } else {
  //         print("Token is expired.");
  //       }
  //     } catch (e) {
  //       print("Error decoding token: $e");
  //     }
  //   } else {
  //     print("Token is empty.");
  //   }

  //   return false;
  // }
}
