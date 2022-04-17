import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:nuntium_news_app/utils/style/custom_icons_icons.dart';

import '../models/news_model.dart';
import '../utils/navigation/navigation.dart';

class ArticlePage extends StatelessWidget {
  final News? news;
  const ArticlePage({Key? key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 60, left: 20, right: 20, bottom: 50),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    iconSize: 19,
                    color: greyPrimary,
                    onPressed: () {
                      pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  IconButton(
                    iconSize: 19,
                    color: greyPrimary,
                    onPressed: () {},
                    icon: const Icon(CustomIcons3.forward),
                  ),
                  IconButton(
                    iconSize: 19,
                    color: greyPrimary,
                    onPressed: () {},
                    icon: const Icon(CustomIcons3.bookmark),
                  ),
                ],
              ),

              const SizedBox(height: 10),
              // news image

              Center(
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: CachedNetworkImage(
                      imageUrl: news!.image, fit: BoxFit.fill),
                ),
              ),

              const SizedBox(height: 30),

              // article purple card
              Container(
                margin: const EdgeInsets.only(right: 15),
                width: 81,
                height: 32,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: purplePrimary),
                child: Center(
                  child: Text(
                    'Article',
                    style: TextStyle(
                        fontSize: 12,
                        color: backgroundWhite,
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),

              const SizedBox(height: 15),

              //news title
              Text(
                news!.titleName,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: blackPrimary,
                    fontSize: 20),
              ),

              const SizedBox(height: 15),

              // author name
              Text(
                news!.authorName,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: blackPrimary,
                    fontSize: 16),
              ),

              // author tag
              Text(
                'Author',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: greyPrimary,
                    fontSize: 14),
              ),

              const SizedBox(height: 15),

              // content
              Text(
                news!.contentA,
                style: TextStyle(
                    height: 1.5,
                    fontWeight: FontWeight.w300,
                    color: greyPrimary,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}