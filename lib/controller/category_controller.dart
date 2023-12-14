import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_with_api/model/news_model.dart';

class CategoryController with ChangeNotifier {
  List<String> categoryList = [
    "business",
    "entertainment",
    "general",
    "health",
    "science",
    "sports",
    "technology"
  ];

  String category = "business";

  onTap({required int index}) {
    category = categoryList[index];
    fetchData();
    print(category);
    notifyListeners();
  }

  late NewsModel newsModel;
  bool isLoading = false;
  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=8fa00ba1169d491bb7a76a8a2e9c7cfe");
    print(category);
    final response = await http.get(url);
    print(response.statusCode);
    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {
      print("Api failed");
    }
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
