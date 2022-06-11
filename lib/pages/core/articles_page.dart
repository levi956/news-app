import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:nuntium_news_app/pages/web/articles_web_page.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:nuntium_news_app/utils/style/custom_icons_icons.dart';
import 'package:provider/provider.dart';

import '../../models/news_model.dart';
import '../../provider/dark_theme_provider.dart';
import '../../utils/navigation/navigation.dart';
import '../../utils/shared/share_content.dart';
import '../../utils/style/status_bar_color.dart';

class ArticlePage extends StatefulWidget {
  final News? news;
  const ArticlePage({Key? key, this.news}) : super(key: key);

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  @override
  Widget build(BuildContext context) {
    void share() {
      ShareContent.shareUrl(widget.news?.url.toString());
    }

    // provider bool value for theme preference
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    _themeChange.darkTheme
        ? setStatusBarColor(color: BarColor.white)
        : setStatusBarColor(color: BarColor.black);
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
                    color: Theme.of(context).primaryColorLight,
                    onPressed: () {
                      pop(context);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () =>
                        pushTo(context, ArticlesWeb(news: widget.news)),
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      width: 81,
                      height: 32,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: purplePrimary),
                      child: Center(
                        child: Text(
                          'Web View',
                          style: TextStyle(
                              fontSize: 12,
                              color: backgroundWhite,
                              fontWeight: FontWeight.w600),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    iconSize: 19,
                    color: Theme.of(context).primaryColorLight,
                    onPressed: share,
                    icon: const Icon(CustomIcons3.forward),
                  ),
                  IconButton(
                    iconSize: 19,
                    color: Theme.of(context).primaryColorLight,
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
                    imageUrl: widget.news!.image,
                    errorWidget: (context, url, widget) =>
                        const Center(child: Icon(Icons.error)),
                    fit: BoxFit.fill,
                  ),
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
                widget.news!.titleName,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 20),
              ),

              const SizedBox(height: 15),

              // author name
              Text(
                widget.news!.authorName,
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    color: Theme.of(context).primaryColorDark,
                    fontSize: 16),
              ),

              // author tag
              Text(
                'Author',
                style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 14),
              ),

              const SizedBox(height: 15),

              // content
              Text(
                widget.news!.contentA,
                style: TextStyle(
                    height: 1.5,
                    fontWeight: FontWeight.w300,
                    color: Theme.of(context).primaryColorLight,
                    fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
