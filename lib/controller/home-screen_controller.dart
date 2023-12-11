import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_with_api/model/news_model.dart';

class HomeScreenController {
  Future<NewsModel> fetchData() async {
    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=apple&from=2023-12-10&to=2023-12-10&sortBy=popularity&apiKey=8fa00ba1169d491bb7a76a8a2e9c7cfe");
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    return NewsModel.fromJson(decodedData);
  }
}
