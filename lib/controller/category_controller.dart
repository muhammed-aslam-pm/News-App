import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:news_app_with_api/model/news_model.dart';

class CategoryController with ChangeNotifier {
  List<String> categoryList = [
    "Business",
    "Entertainment",
    "General",
    "Health",
    "Science",
    "Sports",
    "Technology"
  ];

  String category = "business";

  onTap({required int index}) {
    category = categoryList[index].toLowerCase();
    fetchData();

    notifyListeners();
  }

  late NewsModel newsModel;
  bool isLoading = false;
  fetchData() async {
    isLoading = true;
    notifyListeners();
    final url = Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=in&category=$category&apiKey=8fa00ba1169d491bb7a76a8a2e9c7cfe");

    final response = await http.get(url);

    Map<String, dynamic> decodedData = {};

    if (response.statusCode == 200) {
      decodedData = jsonDecode(response.body);
    } else {}
    newsModel = NewsModel.fromJson(decodedData);
    isLoading = false;
    notifyListeners();
  }
}
