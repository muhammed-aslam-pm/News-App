import 'package:flutter/material.dart';
import 'package:news_app_with_api/controller/home-screen_controller.dart';
import 'package:news_app_with_api/model/news_model.dart';

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
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView.separated(
            itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                newsModel.articles![index].urlToImage
                                    .toString(),
                              ),
                              fit: BoxFit.cover),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        newsModel.articles?[index].title.toString() ?? "",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(height: 10),
                      Text(
                        newsModel.articles?[index].description.toString() ?? "",
                        overflow: TextOverflow.ellipsis,
                        maxLines: 3,
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(newsModel.articles?[index].publishedAt
                                  .toString() ??
                              "")
                        ],
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => Divider(
                  height: 20,
                ),
            itemCount: newsModel.articles?.length ?? 0),
      ),
    );
  }
}
