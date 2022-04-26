import 'dart:io';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../models/news_model.dart';
import '../utils/navigation/navigation.dart';
import '../utils/style/color_constant.dart';

class ArticlesWeb extends StatefulWidget {
  final News? news;
  const ArticlesWeb({Key? key, this.news}) : super(key: key);

  @override
  State<ArticlesWeb> createState() => _ArticlesWebState();
}

class _ArticlesWebState extends State<ArticlesWeb> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundWhite,
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            IconButton(
              iconSize: 19,
              color: greyPrimary,
              onPressed: () {
                pop(context);
              },
              icon: const Icon(Icons.arrow_back),
            ),
            Expanded(
              child: Stack(
                children: [
                  WebView(
                    initialUrl: widget.news?.url,
                    javascriptMode: JavascriptMode.unrestricted,
                    onPageFinished: (finish) => setState(() {
                      isLoading = false;
                    }),
                  ),
                  isLoading
                      ? const Center(
                          child: CircularProgressIndicator.adaptive(),
                        )
                      : Stack(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
