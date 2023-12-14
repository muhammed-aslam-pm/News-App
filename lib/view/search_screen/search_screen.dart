import 'package:flutter/material.dart';
import 'package:news_app_with_api/controller/search_screen_controller.dart';
import 'package:news_app_with_api/view/widgets/news_card.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController textController = TextEditingController();
    SearchScreenController provider =
        Provider.of<SearchScreenController>(context);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    height: 45,
                    width: MediaQuery.sizeOf(context).width * 2 / 3,
                    child: TextField(
                      controller: textController,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide:
                                BorderSide(color: Colors.black, width: 3)),
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      provider.searchData(
                          searchText: textController.text.toLowerCase());
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Text("Search"),
                    style: ButtonStyle(
                        backgroundColor:
                            MaterialStatePropertyAll(Colors.black)),
                  )
                ],
              ),
              ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) => NewsCard(
                      title: provider.newsModel?.articles?[index].title ?? "",
                      description:
                          provider.newsModel?.articles?[index].description ??
                              "",
                      date: provider.newsModel?.articles?[index].publishedAt,
                      imageUrl:
                          provider.newsModel?.articles?[index].urlToImage ?? "",
                      contant:
                          provider.newsModel?.articles?[index].content ?? "",
                      sourceName:
                          provider.newsModel?.articles?[index].source?.name ??
                              "",
                      url: provider.newsModel?.articles?[index].url ?? ""),
                  separatorBuilder: (context, index) => Divider(height: 20),
                  itemCount: provider.newsModel?.articles?.length ?? 0)
            ],
          ),
        ),
      )),
    );
  }
}
