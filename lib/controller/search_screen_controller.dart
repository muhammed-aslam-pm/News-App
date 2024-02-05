import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:news_app_with_api/model/news_model.dart';
import 'package:http/http.dart' as http;

class SearchScreenController with ChangeNotifier {
  NewsModel? newsModel;
  bool isLoading = false;

  searchData({required String searchText}) async {
    isLoading = true;
    notifyListeners();

    final url = Uri.parse(
        "https://newsapi.org/v2/everything?q=$searchText&from=2023-12-12&to=2023-12-12&sortBy=popularity&apiKey=8fa00ba1169d491bb7a76a8a2e9c7cfe");
    final response = await http.get(url);

    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {}
    newsModel = NewsModel.fromJson(decodedData);
    notifyListeners();
    isLoading = false;
    notifyListeners();
  }
}
