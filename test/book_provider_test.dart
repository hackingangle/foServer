import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:manager_client/providers/book_provider.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

// 生成 mock 类
import 'book_provider_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group('BookProvider', () {
    late MockClient client;
    late BookProvider bookProvider;

    setUp(() {
      client = MockClient();
      bookProvider = BookProvider(client: client);
    });

    test(
        'fetchBooks returns a list of books if the http call completes successfully',
        () async {
      // 模拟返回的响应数据
      final mockResponse = [
        {
          'ID': 1,
          'name': '金刚经',
          'author': '释迦摩尼',
          'description': '金刚般若波罗蜜经',
          'cover_image_url':
              'https://pics7.baidu.com/feed/dcc451da81cb39dbf2f787d7ba3e5e2aab183036.jpeg@f_auto?token=80f6ead7e425533316441d972bf0cd5a'
        }
      ];

      // 模拟 HTTP 响应
      when(client
              .get(Uri.parse('http://127.0.0.1:8080/books?page=1&pageSize=10')))
          .thenAnswer(
              (_) async => http.Response(json.encode(mockResponse), 200));

      // 执行 fetchBooks 方法
      await bookProvider.fetchBooks();

      // 验证结果
      expect(bookProvider.books.length, 1);
      expect(bookProvider.books[0].name, '金刚经');
    });

    test(
        'fetchBooks throws an exception if the http call completes with an error',
        () async {
      // 模拟 HTTP 响应
      when(client
              .get(Uri.parse('http://127.0.0.1:8080/books?page=1&pageSize=10')))
          .thenAnswer((_) async => http.Response('Not Found', 404));

      // 执行 fetchBooks 方法并捕获异常
      try {
        await bookProvider.fetchBooks();
      } catch (error) {
        print('Caught error: $error'); // 打印捕获的异常
        expect(error, isA<Exception>());
      }
    });
  });
}
