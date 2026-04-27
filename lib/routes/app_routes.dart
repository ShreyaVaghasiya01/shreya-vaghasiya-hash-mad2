import 'package:flutter/material.dart';

import '../screens/login_screen.dart';
import '../screens/register_screen.dart';
import '../screens/dashboard_screen.dart';
import '../screens/add_book_screen.dart';

class AppRoutes {

  static const String login = "/login";
  static const String register = "/register";
  static const String dashboard = "/dashboard";
  static const String addBook = "/addBook";

  static Map<String, WidgetBuilder> routes = {

    login: (context) => const LoginScreen(),

    register: (context) => const RegisterScreen(),

    dashboard: (context) => const DashboardScreen(),

    addBook: (context) => const AddBookScreen(),

  };
}