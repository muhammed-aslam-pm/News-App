import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app_with_api/controller/category_controller.dart';
import 'package:news_app_with_api/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class CAtegoryScreen extends StatefulWidget {
  const CAtegoryScreen({super.key});

  @override
  State<CAtegoryScreen> createState() => _CAtegoryScreenState();
}

class _CAtegoryScreenState extends State<CAtegoryScreen> {
  void fetchData() async {
    Provider.of<CategoryController>(context, listen: false).fetchData();
  }

  @override
  void initState() {
    fetchData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    CategoryController provider = Provider.of<CategoryController>(context);
    return DefaultTabController(
      length: provider.categoryList.length,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          title: Text("Categories"),
          bottom: TabBar(
            isScrollable: true,
            tabs: List.generate(
              provider.categoryList.length,
              (index) => Tab(
                text: provider.categoryList[index],
              ),
            ),
            onTap: (value) {
              provider.onTap(index: value);
            },
          ),
        ),
        body: provider.isLoading == true
            ? Center(
                child: LottieBuilder.asset(
                "assets/animations/Animation - 1702395258490.json",
                fit: BoxFit.cover,
                height: 150,
                width: 150,
              ))
            : Padding(
                padding: const EdgeInsets.all(10),
                child: ListView.separated(
                    itemBuilder: (context, index) => NewsCard(
                          title: provider.newsModel.articles?[index].title
                                  .toString() ??
                              "",
                          description: provider
                                  .newsModel.articles?[index].description
                                  .toString() ??
                              "",
                          date: provider.newsModel.articles?[index].publishedAt,
                          imageUrl: provider
                                  .newsModel.articles?[index].urlToImage
                                  .toString() ??
                              "",
                          contant: provider.newsModel.articles?[index].content
                                  .toString() ??
                              "",
                          sourceName: provider
                                  .newsModel.articles?[index].source?.name
                                  .toString() ??
                              "",
                          url: provider.newsModel.articles?[index].url
                                  .toString() ??
                              "",
                        ),
                    separatorBuilder: (context, index) => Divider(
                          height: 20,
                        ),
                    itemCount: provider.newsModel.articles?.length ?? 0),
              ),
      ),
    );
  }
}
