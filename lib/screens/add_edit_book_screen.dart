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
  var _editedBook = Book(id: 0, name: '', author: '', description: '', coverImageUrl: '');
  var _initValues = {
    'name': '',
    'author': '',
    'description': '',
    'coverImageUrl': '',
  };
  var _isInit = true;
  var _isLoading = false;

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
      _isInit = false;
    }
    super.didChangeDependencies();
  }

  Future<void> _saveForm() async {
    final isValid = _formKey.currentState?.validate();
    if (!isValid!) {
      return;
    }
    _formKey.currentState?.save();
    setState(() {
      _isLoading = true;
    });

    if (_editedBook.id != 0) {
      await Provider.of<BookProvider>(context, listen: false).updateBook(_editedBook);
    } else {
      try {
        await Provider.of<BookProvider>(context, listen: false).addBook(_editedBook);
      } catch (error) {
        await showDialog(
          context: context,
          builder: (ctx) => AlertDialog(
            title: Text('发生错误！'),
            content: Text('添加图书失败，请重试。'),
            actions: [
              TextButton(
                child: Text('确定'),
                onPressed: () {
                  Navigator.of(ctx).pop();
                },
              )
            ],
          ),
        );
      }
    }

    setState(() {
      _isLoading = false;
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_editedBook.id != 0 ? '编辑图书' : '添加图书'),
        actions: [
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          ),
        ],
      ),
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : Padding(
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
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
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
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
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
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
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
                  );
                },
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return '请输入封面图片URL';
                  }
                  final uri = Uri.tryParse(value);
                  if (uri == null || !uri.hasAbsolutePath) {
                    return '请输入有效的URL';
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