import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_news_app/pages/articles_page.dart';
import 'package:nuntium_news_app/utils/navigation/navigation.dart';

import '../../models/news_model.dart';

class TabsCard extends StatelessWidget {
  final News? news;
  const TabsCard({Key? key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        pushTo(
          context,
          ArticlePage(news: news),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 30),
        height: 256.7,
        width: 256.86,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
            image: CachedNetworkImageProvider(news!.image),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 10, right: 20),
              child: Text(
                news!.authorName,
                maxLines: 2,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, top: 5, bottom: 20),
              child: Text(
                news!.descriptionName,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
