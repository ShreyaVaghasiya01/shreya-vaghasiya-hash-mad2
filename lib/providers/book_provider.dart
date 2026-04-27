import 'package:flutter/material.dart';
import '../models/book_model.dart';
import '../services/storage_service.dart';

class BookProvider extends ChangeNotifier {

  List<Book> books = [];

  bool loading = true;

  BookProvider() {
    loadBooks();
  }

  // Load books from local storage
  Future loadBooks() async {

    books = await StorageService.loadBooks();

    loading = false;

    notifyListeners();
  }

  // Add new book
  Future addBook(Book book) async {

    books.add(book);

    await StorageService.saveBooks(books);

    notifyListeners();
  }

  // Delete book
  Future deleteBook(int index) async {

    books.removeAt(index);

    await StorageService.saveBooks(books);

    notifyListeners();
  }

  // Issue / Return Book
  Future toggleIssue(int index) async {

    books[index].issued = !books[index].issued;

    await StorageService.saveBooks(books);

    notifyListeners();
  }

  // Update Book
  Future updateBook(int index, Book book) async {

    books[index] = book;

    await StorageService.saveBooks(books);

    notifyListeners();
  }
}