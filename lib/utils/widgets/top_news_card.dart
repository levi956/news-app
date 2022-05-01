import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_news_app/pages/articles_page.dart';
import 'package:nuntium_news_app/provider/dark_theme_provider.dart';
import 'package:nuntium_news_app/utils/navigation/navigation.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:provider/provider.dart';

import '../../models/news_model.dart';

class TopNewsCard extends StatelessWidget {
  final News? news;
  const TopNewsCard({Key? key, this.news}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // provider bool value for theme preference
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    return InkWell(
      onTap: () {
        pushTo(context, ArticlePage(news: news));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child:
                  CachedNetworkImage(imageUrl: news!.image, fit: BoxFit.fill),
            ),
            Container(
              padding: const EdgeInsets.only(top: 10, left: 10, right: 10),
              color: _themeChange.darkTheme ? blackLighter : greyLighter,
              child: Text(
                news!.titleName,
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 12,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
              decoration: BoxDecoration(
                color: _themeChange.darkTheme ? blackLighter : greyLighter,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15),
                ),
              ),
              child: Text(
                news!.descriptionName,
                overflow: TextOverflow.ellipsis,
                maxLines: 3,
                style: TextStyle(
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
