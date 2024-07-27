import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/book_provider.dart';
import 'add_edit_book_screen.dart';

class BookListScreen extends StatelessWidget {
  static const routeName = '/book-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图书管理'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.of(context).pushNamed(AddEditBookScreen.routeName);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: Provider.of<BookProvider>(context, listen: false).fetchBooks(),
        builder: (ctx, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.error != null) {
            return Center(child: Text('加载图书失败!'));
          } else {
            return Consumer<BookProvider>(
              builder: (ctx, bookProvider, _) {
                return ListView.builder(
                  itemCount: bookProvider.books.length,
                  itemBuilder: (ctx, index) {
                    final book = bookProvider.books[index];
                    return Dismissible(
                      key: ValueKey(book.id),
                      background: Container(
                        color: Colors.red,
                        child: Icon(Icons.delete, color: Colors.white, size: 40),
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20),
                      ),
                      direction: DismissDirection.endToStart,
                      confirmDismiss: (direction) {
                        return showDialog(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: Text('确认删除'),
                            content: Text('你确定要删除这本书吗?'),
                            actions: [
                              TextButton(
                                child: Text('取消'),
                                onPressed: () {
                                  Navigator.of(ctx).pop(false);
                                },
                              ),
                              TextButton(
                                child: Text('确认'),
                                onPressed: () {
                                  Navigator.of(ctx).pop(true);
                                },
                              ),
                            ],
                          ),
                        );
                      },
                      onDismissed: (direction) {
                        Provider.of<BookProvider>(context, listen: false).deleteBook(book.id);
                      },
                      child: ListTile(
                        leading: Image.network(book.coverImageUrl, fit: BoxFit.cover, width: 50, height: 50),
                        title: Text(book.name),
                        subtitle: Text('作者: ${book.author}\n${book.description}'),
                        isThreeLine: true,
                        onTap: () {
                          Navigator.of(context).pushNamed(
                            AddEditBookScreen.routeName,
                            arguments: book,
                          );
                        },
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}