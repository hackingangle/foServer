import 'package:flutter/material.dart';
import 'package:manager_client/providers/book_provider.dart';
import 'package:manager_client/providers/user_provider.dart';
import 'package:manager_client/screens/add_edit_book_screen.dart';
import 'package:manager_client/screens/book_list_screen.dart';
import 'package:manager_client/screens/dashboard_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => BookProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '轻舟',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DashboardScreen(),
      routes: {
        BookListScreen.routeName: (_) => BookListScreen(),
        AddEditBookScreen.routeName: (_) => AddEditBookScreen(),
      },
    );
  }
}
