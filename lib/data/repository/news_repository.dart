import 'dart:convert';
import 'package:design_ui/src/models/news.dart';
import 'package:http/http.dart' as http;

class NewsRepository {
  List<News> parseNews(String responseBody) {
    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<News>((json) => News.fromJson(json)).toList();
  } 

  Future<List<News>> fetchNews({int page = 1}) async {
    final response = await http.get(Uri.parse('https://api.hnpwa.com/v0/news/$page.json'));
    return parseNews(response.body);
  }
}