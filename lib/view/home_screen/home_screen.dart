import 'package:flutter/material.dart';
import 'package:news_app_with_api/controller/home-screen_controller.dart';
import 'package:news_app_with_api/model/news_model.dart';
import 'package:news_app_with_api/view/home_screen/widgets/news_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late NewsModel newsModel;

  @override
  void initState() {
    super.initState();
    HomeScreenController().fetchData().then((value) {
      setState(() {
        newsModel = value; // Assign the value to your newsModel variable
      });
    }).catchError((error) {
      // Handle errors if any
      print('Error fetching data: $error');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("News Today 📰"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ListView.separated(
            itemBuilder: (context, index) => NewsCard(
                  title: newsModel.articles?[index].title.toString() ?? "",
                  description:
                      newsModel.articles?[index].description.toString() ?? "",
                  date: newsModel.articles?[index].publishedAt,
                  imageUrl:
                      newsModel.articles?[index].urlToImage.toString() ?? "",
                  contant: newsModel.articles?[index].content.toString() ?? "",
                  sourceName:
                      newsModel.articles?[index].source?.name.toString() ?? "",
                  url: newsModel.articles?[index].url.toString() ?? "",
                ),
            separatorBuilder: (context, index) => Divider(
                  height: 20,
                ),
            itemCount: newsModel.articles?.length ?? 0),
      ),
    );
  }
}
