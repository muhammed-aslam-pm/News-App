import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:news_app_with_api/model/news_model.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

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

  // Function to launch a URL
  Future<void> launchURL(String url) async {
    try {
      if (await canLaunchUrl(Uri.parse(url))) {
        await launchUrl(Uri.parse(url));
      } else {
        throw 'Could not launch $url';
      }
    } catch (e) {
      print('Error launching URL: $e');
    }
  }

  void shareText({String textToShare = ""}) {
    try {
      Share.share(textToShare);
    } catch (e) {
      print('Error sharing: $e');
    }
  }
}
