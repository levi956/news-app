import 'package:flutter/material.dart';
import 'package:nuntium_news_app/models/response.dart';
import 'package:nuntium_news_app/services/api/api_test.dart';
import 'package:nuntium_news_app/services/api/news_api.dart';
import 'package:nuntium_news_app/services/network/check_connectivity.dart';
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

  // NewsData client = NewsData();
  Client client = Client();
  NewsDataCategory clientCategory = NewsDataCategory();

  late Future<ServiceResponse<List<News>>> newsData;
  late Future<List<News>> futureGeneral;
  late Future<List<News>> futureSports;
  late Future<List<News>> futureTech;
  late Future<List<News>> futureBusiness;

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
    newsData = client.request();
    futureGeneral = clientCategory.fetchNews('general');
    futureSports = clientCategory.fetchNews('sports');
    futureTech = clientCategory.fetchNews('technology');
    futureBusiness = clientCategory.fetchNews('business');
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
                            futureCategory(futureGeneral),
                            futureCategory(futureSports),
                            futureCategory(futureTech),
                            futureCategory(futureBusiness),
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
              color: Colors.white,
              child: Center(
                child: Text(articles.message!),
              ),
            );
          }
        }
        return const ShimmerEffect();
      },
    );
  }

  // future builder that returns data from api call future
  FutureBuilder<List<News>> futureCategory(Future<List<News>> category) {
    return FutureBuilder<List<News>>(
      future: category,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<News> articles = snapshot.data!;
          return ListView.builder(
            itemCount: articles.length,
            scrollDirection: Axis.horizontal,
            physics: const AlwaysScrollableScrollPhysics(),
            itemBuilder: (context, int index) {
              return TabsCard(
                news: articles[index],
              );
            },
          );
        }

        return const SizedBox.shrink();
      },
    );
  }

  //

}
