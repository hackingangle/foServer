import 'package:http/http.dart' as http;

void fetchData() async {
  final response = await http
      .get(Uri.parse('http://127.0.0.1:8080/books?page=1&pageSize=10'));

  if (response.statusCode == 200) {
    print('Response data: ${response.body}');
  } else {
    print('Failed to load data: ${response.statusCode}');
  }
}

// 调用fetchData
void main() {
  fetchData();
}
