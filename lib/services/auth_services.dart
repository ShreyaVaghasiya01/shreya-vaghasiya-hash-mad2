import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {

  static String encrypt(String password){
    return sha256.convert(utf8.encode(password)).toString();
  }

  static Future register(String email, String password) async{

    final prefs = await SharedPreferences.getInstance();

    prefs.setString("email", email);
    prefs.setString("password", encrypt(password));
  }

  static Future<bool> login(String email, String password) async{

    final prefs = await SharedPreferences.getInstance();

    String? savedEmail = prefs.getString("email");
    String? savedPassword = prefs.getString("password");

    return email == savedEmail && encrypt(password) == savedPassword;
  }
}