import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'providers/book_provider.dart';
import 'screens/add_edit_book_screen.dart';
import 'screens/book_list_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => BookProvider()),
      ],
      child: MaterialApp(
        title: '图书管理系统',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner: false, // 去掉右上角的调试标志
        home: BookListScreen(),
        routes: {
          BookListScreen.routeName: (ctx) => BookListScreen(),
          AddEditBookScreen.routeName: (ctx) => AddEditBookScreen(),
        },
      ),
    );
  }
}
