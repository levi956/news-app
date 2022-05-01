import 'package:flutter/material.dart';
import 'package:nuntium_news_app/services/api/news_api.dart';
import 'package:nuntium_news_app/utils/style/color_constant.dart';
import 'package:nuntium_news_app/utils/widgets/category_card.dart';
import 'package:nuntium_news_app/utils/widgets/top_news_card.dart';
import 'package:provider/provider.dart';

import '../models/news_model.dart';
import '../provider/dark_theme_provider.dart';
import '../utils/style/status_bar_color.dart';
import '../utils/widgets/shimmer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;
  int currentIndex = 0;

  NewsData client = NewsData();
  NewsDataCategory clientCategory = NewsDataCategory();

  late Future<List<News>> future;
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
    future = client.fetchNews();
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
    return FutureBuilder<List<News>>(
      future: future,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          List<News> articles = snapshot.data!;
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
                    Text(
                      'Browse',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 24),
                    ),

                    //

                    const SizedBox(height: 10),
                    Text(
                      'Discover things of the world',
                      style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Theme.of(context).primaryColorLight,
                          fontSize: 16),
                    ),

                    //

                    const SizedBox(height: 10),
                    TabBar(
                      overlayColor: MaterialStateProperty.all(transparent),
                      padding: EdgeInsets.zero,
                      isScrollable: true,
                      labelPadding: const EdgeInsets.only(
                          left: 0, right: 0, top: 0, bottom: 5),
                      controller: _tabController,
                      labelColor: backgroundWhite,
                      unselectedLabelColor: Theme.of(context).primaryColorLight,
                      indicatorColor: Colors.transparent,
                      tabs: [
                        Tab(
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 81,
                            height: 32,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: currentIndex == 0
                                  ? purplePrimary
                                  : _themeChange.darkTheme
                                      ? blackLighter
                                      : greyLighter,
                            ),
                            child: const Center(
                              child: Text(
                                'General',
                                style: TextStyle(
                                    fontSize: 12,
                                    // color: Colors.orangeAccent,
                                    fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          height: 32,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 81,
                            height: 32.84,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: currentIndex == 1
                                  ? purplePrimary
                                  : _themeChange.darkTheme
                                      ? blackLighter
                                      : greyLighter,
                            ),
                            child: const Center(
                              child: Text(
                                'Sports',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          height: 32,
                          child: Container(
                            margin: const EdgeInsets.only(right: 15),
                            width: 81,
                            height: 32.84,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: currentIndex == 2
                                  ? purplePrimary
                                  : _themeChange.darkTheme
                                      ? blackLighter
                                      : greyLighter,
                            ),
                            child: const Center(
                              child: Text(
                                'Technology',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        ),
                        Tab(
                          height: 32,
                          child: Container(
                            width: 81,
                            height: 32.84,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: currentIndex == 3
                                  ? purplePrimary
                                  : _themeChange.darkTheme
                                      ? blackLighter
                                      : greyLighter,
                            ),
                            child: const Center(
                              child: Text(
                                'Business',
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    //

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

                    //

                    Text(
                      'Top News',
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 24),
                    ),

                    //

                    Expanded(
                      child: ListView.builder(
                        itemCount: articles.length,
                        scrollDirection: Axis.vertical,
                        physics: const AlwaysScrollableScrollPhysics(),
                        itemBuilder: (context, int index) {
                          return TopNewsCard(
                            news: articles[index],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
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
