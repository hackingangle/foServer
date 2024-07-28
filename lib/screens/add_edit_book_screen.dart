import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/book.dart';
import '../providers/book_provider.dart';

class AddEditBookScreen extends StatefulWidget {
  static const routeName = '/add-edit-book';

  @override
  _AddEditBookScreenState createState() => _AddEditBookScreenState();
}

class _AddEditBookScreenState extends State<AddEditBookScreen> {
  final _formKey = GlobalKey<FormState>();
  var _editedBook = Book(
    id: null,
    name: '',
    author: '',
    description: '',
    coverImageUrl: '',
    createdAt: '',
    updatedAt: '',
  );
  var _initValues = {
    'name': '',
    'author': '',
    'description': '',
    'coverImageUrl': '',
  };
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if (_isInit) {
      final book = ModalRoute.of(context)!.settings.arguments as Book?;
      if (book != null) {
        _editedBook = book;
        _initValues = {
          'name': _editedBook.name,
          'author': _editedBook.author,
          'description': _editedBook.description,
          'coverImageUrl': _editedBook.coverImageUrl,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }

  void _saveForm() {
    final isValid = _formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();
    if (_editedBook.id != null) {
      Provider.of<BookProvider>(context, listen: false).updateBook(_editedBook);
    } else {
      Provider.of<BookProvider>(context, listen: false).addBook(_editedBook);
    }
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editedBook.id != null ? '编辑图书' : '添加图书'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                initialValue: _initValues['name'],
                decoration: InputDecoration(labelText: '书名'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _editedBook = Book(
                    id: _editedBook.id,
                    name: value!,
                    author: _editedBook.author,
                    description: _editedBook.description,
                    coverImageUrl: _editedBook.coverImageUrl,
                    createdAt: _editedBook.createdAt,
                    updatedAt: DateTime.now().toIso8601String(),
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入书名';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _initValues['author'],
                decoration: InputDecoration(labelText: '作者'),
                textInputAction: TextInputAction.next,
                onSaved: (value) {
                  _editedBook = Book(
                    id: _editedBook.id,
                    name: _editedBook.name,
                    author: value!,
                    description: _editedBook.description,
                    coverImageUrl: _editedBook.coverImageUrl,
                    createdAt: _editedBook.createdAt,
                    updatedAt: DateTime.now().toIso8601String(),
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入作者';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _initValues['description'],
                decoration: InputDecoration(labelText: '描述'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                onSaved: (value) {
                  _editedBook = Book(
                    id: _editedBook.id,
                    name: _editedBook.name,
                    author: _editedBook.author,
                    description: value!,
                    coverImageUrl: _editedBook.coverImageUrl,
                    createdAt: _editedBook.createdAt,
                    updatedAt: DateTime.now().toIso8601String(),
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入描述';
                  }
                  return null;
                },
              ),
              TextFormField(
                initialValue: _initValues['coverImageUrl'],
                decoration: InputDecoration(labelText: '封面图片URL'),
                keyboardType: TextInputType.url,
                textInputAction: TextInputAction.done,
                onSaved: (value) {
                  _editedBook = Book(
                    id: _editedBook.id,
                    name: _editedBook.name,
                    author: _editedBook.author,
                    description: _editedBook.description,
                    coverImageUrl: value!,
                    createdAt: _editedBook.createdAt,
                    updatedAt: DateTime.now().toIso8601String(),
                  );
                },
                validator: (value) {
                  if (value!.isEmpty) {
                    return '请输入封面图片的URL';
                  }
                  return null;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
