import 'dart:convert';
import 'package:http/http.dart' as http;

class News {
  final String title;
  final String content;

  News({required this.title, required this.content});

  factory News.fromJson(Map<String, dynamic> json) {
    return News(
      title: json['title'],
      content: json['content'],
    );
  }
}

Future<List<News>> fetchNews() async {

  return Future.delayed(Duration(seconds: 1), () => getMockNews());

  /*final response = await http.get(Uri.parse('你的API地址'));

  if (response.statusCode == 200) {
    List<dynamic> newsJson = jsonDecode(response.body);
    return newsJson.map((json) => News.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load news');
  }*/
}

List<News> getMockNews() {
  return [
    News(title: '新闻标题 1', content: '这是新闻内容 1. Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
    News(title: '新闻标题 2', content: '这是新闻内容 2. Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
    News(title: '新闻标题 3', content: '这是新闻内容 3. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip.'),
    News(title: '新闻标题 4', content: '这是新闻内容 4. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat.'),
    News(title: '新闻标题 5', content: '这是新闻内容 5. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt.'),
  ];
}

