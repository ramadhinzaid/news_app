import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/pages/home/business_article.dart';
import 'package:news_app/pages/home/indonesian_article.dart';
import 'package:news_app/pages/home/international_article.dart';
import 'package:news_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeData theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        // automaticallyImplyLeading: false,
        backgroundColor: theme.scaffoldBackgroundColor,
        centerTitle: true,
        title: Text(
          "News",
          style: textTheme.headline5,
        ),
        actions: [
          IconButton(
            onPressed: () {
              newsController.resetSearchValue();
              showGeneralDialog(
                  context: context,
                  transitionDuration: const Duration(milliseconds: 300),
                  pageBuilder: (ctx, animation, secondAnimation) {
                    return FadeTransition(
                      opacity: animation,
                      child: SearchPage(),
                    );
                  });
            },
            icon: Icon(
              Icons.search_rounded,
              color: theme.indicatorColor,
            ),
          )
        ],
      ),
      body: const CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          InternationalArticle(),
          BusinessArticle(),
          IndonesianArticle()
        ],
      ),
    );
  }
}
