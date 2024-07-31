import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../models/book.dart';

const String apiHost = '127.0.0.1';

class BookProvider with ChangeNotifier {
  List<Book> _books = [];
  final http.Client client;

  BookProvider({http.Client? client}) : client = client ?? http.Client();

  List<Book> get books => _books;

  Future<void> fetchBooks() async {
    var urlHost = 'http://$apiHost:8089/books?page=1&pageSize=10';
    final url = Uri.parse(urlHost);
    try {
      print('Fetching books from: $url');
      final response = await client.get(url);
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        _books = data.map((json) => Book.fromJson(json)).toList();
        notifyListeners();
      } else {
        throw Exception('Failed to load books: ${response.statusCode}');
      }
    } catch (error) {
      print('Error: $error host: $urlHost');
      throw Exception('Failed to load books: $error');
    }
  }

  Book findById(int bookId) {
    return _books.firstWhere((book) => book.id == bookId);
  }

  Future<void> addBook(Book book) async {
    final url = Uri.parse('http://$apiHost:8089/books');
    try {
      final response = await client.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: json.encode(book.toJson()),
      );
      if (response.statusCode == 201) {
        await fetchBooks();
      } else {
        throw Exception('Failed to add book');
      }
    } catch (error) {
      throw Exception('Failed to add book: $error');
    }
  }

  Future<void> updateBook(Book book) async {
    final url = Uri.parse('http://$apiHost:8089/books/${book.id}');
    try {
      final requestBody = json.encode(book.toUpdateJson());
      final response = await client.put(
        url,
        headers: {'Content-Type': 'application/json'},
        body: requestBody,
      );
      final respBody = response.body;
      // 打印book的json
      print("[url][$url][request][$requestBody][resp][$respBody]");
      if (response.statusCode == 200) {
        await fetchBooks();
      } else {
        throw Exception('Failed to update book');
      }
    } catch (error) {
      throw Exception('Failed to update book: $error');
    }
  }

  Future<void> deleteBook(int id) async {
    final url = Uri.parse('http://$apiHost:8089/books/$id');
    try {
      final response = await client.delete(url);
      if (response.statusCode == 200) {
        await fetchBooks();
      } else {
        throw Exception('Failed to delete book');
      }
    } catch (error) {
      throw Exception('Failed to delete book: $error');
    }
  }
}
