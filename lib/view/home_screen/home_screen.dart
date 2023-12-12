import 'package:flutter/material.dart';
import 'package:news_app_with_api/controller/home-screen_controller.dart';
import 'package:news_app_with_api/model/news_model.dart';
import 'package:news_app_with_api/view/home_screen/widgets/news_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    fetchData();
  }

  void fetchData() async {
    Provider.of<HomeScreenController>(context, listen: false).fetchData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text("News Today 📰"),
      ),
      body: Provider.of<HomeScreenController>(context).isLoading == true
          ? Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(10),
              child: ListView.separated(
                  itemBuilder: (context, index) => NewsCard(
                        title: Provider.of<HomeScreenController>(context)
                                .newsModel
                                .articles?[index]
                                .title
                                .toString() ??
                            "",
                        description: Provider.of<HomeScreenController>(context)
                                .newsModel
                                .articles?[index]
                                .description
                                .toString() ??
                            "",
                        date: Provider.of<HomeScreenController>(context)
                            .newsModel
                            .articles?[index]
                            .publishedAt,
                        imageUrl: Provider.of<HomeScreenController>(context)
                                .newsModel
                                .articles?[index]
                                .urlToImage
                                .toString() ??
                            "",
                        contant: Provider.of<HomeScreenController>(context)
                                .newsModel
                                .articles?[index]
                                .content
                                .toString() ??
                            "",
                        sourceName: Provider.of<HomeScreenController>(context)
                                .newsModel
                                .articles?[index]
                                .source
                                ?.name
                                .toString() ??
                            "",
                        url: Provider.of<HomeScreenController>(context)
                                .newsModel
                                .articles?[index]
                                .url
                                .toString() ??
                            "",
                      ),
                  separatorBuilder: (context, index) => Divider(
                        height: 20,
                      ),
                  itemCount: Provider.of<HomeScreenController>(context)
                          .newsModel
                          .articles
                          ?.length ??
                      0),
            ),
    );
  }
}
