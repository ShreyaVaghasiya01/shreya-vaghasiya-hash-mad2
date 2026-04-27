import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/book_model.dart';

class StorageService {

  static Future<List<Book>> loadBooks() async {
    final prefs = await SharedPreferences.getInstance();
    List<String> data = prefs.getStringList("books") ?? [];

    return data.map((e) => Book.fromJson(jsonDecode(e))).toList();
  }

  static Future<void> saveBooks(List<Book> books) async {
    final prefs = await SharedPreferences.getInstance();

    List<String> data =
        books.map((e) => jsonEncode(e.toJson())).toList();

    prefs.setStringList("books", data);
  }
}
