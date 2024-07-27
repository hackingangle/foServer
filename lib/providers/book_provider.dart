import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/book.dart';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];

  List<Book> get books => _books;

  Future<void> fetchBooks() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8080/books?page=1&pageSize=10'));
    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      _books = data.map((json) => Book.fromJson(json)).toList();
      notifyListeners();
    } else {
      throw Exception('Failed to load books');
    }
  }

  Future<void> addBook(Book book) async {
    final response = await http.post(
      Uri.parse('http://127.0.0.1:8080/books'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(book.toJson()),
    );
    if (response.statusCode == 201) {
      fetchBooks();
    } else {
      throw Exception('Failed to add book');
    }
  }

  Future<void> updateBook(Book book) async {
    final response = await http.put(
      Uri.parse('http://127.0.0.1:8080/books/${book.id}'),
      headers: {'Content-Type': 'application/json'},
      body: json.encode(book.toJson()),
    );
    if (response.statusCode == 200) {
      fetchBooks();
    } else {
      throw Exception('Failed to update book');
    }
  }

  Future<void> deleteBook(int id) async {
    final response = await http.delete(Uri.parse('http://127.0.0.1:8080/books/$id'));
    if (response.statusCode == 200) {
      fetchBooks();
    } else {
      throw Exception('Failed to delete book');
    }
  }
}