import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app_with_api/controller/home-screen_controller.dart';

class NewsViewScreen extends StatelessWidget {
  const NewsViewScreen(
      {super.key,
      required this.title,
      required this.description,
      this.date,
      required this.imageUrl,
      required this.contant,
      required this.sourceName,
      required this.url});
  final String title;
  final String description;
  final DateTime? date;
  final String imageUrl;
  final String contant;
  final String sourceName;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                title,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                      "$sourceName | ${DateFormat('dd/MM/yyyy').format(date!).toString()}")
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: MediaQuery.sizeOf(context).height * 25 / 100,
                decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(10),
                    image: DecorationImage(
                        image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                """ $description $contant""",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () {
                  HomeScreenController().launchURL(url);
                },
                child: Text(
                  "Click heare to Read more",
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
