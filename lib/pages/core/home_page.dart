import 'package:flutter/material.dart';
import 'package:nuntium_news_app/models/response.dart';
import 'package:nuntium_news_app/services/api/api_test.dart';
import 'package:nuntium_news_app/services/api/news_api.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:nuntium_news_app/utils/widgets/category_card.dart';
import 'package:nuntium_news_app/utils/widgets/top_news_card.dart';
import 'package:provider/provider.dart';

import '../../models/news_model.dart';
import '../../provider/dark_theme_provider.dart';
import '../../utils/style/status_bar_color.dart';
import '../../utils/widgets/custom_tabBar.dart';
import '../../utils/widgets/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  Client client = Client();
  NewsDataCategory clientCategory = NewsDataCategory();

  late Future<ServiceResponse<List<News>>> newsData;
  late Future<ServiceResponse<List<News>>> general;
  late Future<ServiceResponse<List<News>>> sports;
  late Future<ServiceResponse<List<News>>> tech;
  late Future<ServiceResponse<List<News>>> business;

  @override
  void initState() {
    getData();
    super.initState();

    _tabController = TabController(length: 4, vsync: this);
    _listenToTabController();
  }

  _listenToTabController() {
    _tabController.addListener(() {
      setState(() {
        currentIndex = _tabController.index;
      });
    });
  }

  Future<void> getData() async {
    newsData = client.requestNewsData();
    general = client.requestNewsCategory('general');
    sports = client.requestNewsCategory('sports');
    tech = client.requestNewsCategory('technology');
    business = client.requestNewsCategory('business');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    // provider bool value for theme preference
    final _themeChange = Provider.of<DarkThemeProvider>(context);
    _themeChange.darkTheme
        ? setStatusBarColor(color: BarColor.white)
        : setStatusBarColor(color: BarColor.black);
    return FutureBuilder<ServiceResponse<List<News>>>(
      future: newsData,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ServiceResponse<List<News>> articles = snapshot.data!;
          if (articles.status != false) {
            List<News>? news = articles.data;
            return RefreshIndicator(
              color: purplePrimary,
              onRefresh: getData,
              child: Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  width: double.maxFinite,
                  margin: const EdgeInsets.only(left: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // browse text
                      Text(
                        'Browse',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 24),
                      ),

                      //

                      const SizedBox(height: 10),

                      // discover text
                      Text(
                        'Discover things of the world',
                        style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Theme.of(context).primaryColorLight,
                            fontSize: 16),
                      ),

                      // tab bar
                      const SizedBox(height: 10),
                      CustomTabBar(
                        tabController: _tabController,
                        currentIndex: currentIndex,
                        themeChange: _themeChange,
                      ),

                      //tab bar view

                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.22,
                        child: TabBarView(
                          physics: const NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: [
                            futureCategory(general),
                            futureCategory(sports),
                            futureCategory(tech),
                            futureCategory(business),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),

                      // top news text

                      Text(
                        'Top News',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Theme.of(context).primaryColorDark,
                            fontSize: 24),
                      ),

                      // top news card

                      Expanded(
                        child: ListView.builder(
                          itemCount: news!.length,
                          scrollDirection: Axis.vertical,
                          physics: const AlwaysScrollableScrollPhysics(),
                          itemBuilder: (context, int index) {
                            return TopNewsCard(
                              news: news[index],
                            );
                          },
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            // properly display the error widget here
            return Container(
              width: double.maxFinite,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.warning,
                    color: Colors.red,
                    size: 25.0,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    articles.message!,
                    style: TextStyle(
                      color: Theme.of(context).primaryColorDark,
                    ),
                  ),
                ],
              ),
            );
          }
        }
        return const ShimmerEffect();
      },
    );
  }

  // future builder that returns data from api call future
  FutureBuilder<dynamic> futureCategory(Future category) {
    return FutureBuilder<dynamic>(
      future: category,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          ServiceResponse<List<News>> response = snapshot.data!;
          if (response.status != false) {
            // get data here
            List<News>? articles = response.data;
            return ListView.builder(
              itemCount: articles!.length,
              scrollDirection: Axis.horizontal,
              physics: const AlwaysScrollableScrollPhysics(),
              itemBuilder: (context, int index) {
                return TabsCard(
                  news: articles[index],
                );
              },
            );
          } else {
            // throw error here
            return Container(
              color: Colors.white,
              child: Center(
                child: Text(response.message!),
              ),
            );
          }
        }
        return const SizedBox.shrink();
      },
    );
  }
}
