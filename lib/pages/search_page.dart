import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/card_international_article.dart';
import 'package:news_app/components/search_field.dart';
import 'package:news_app/controllers/news_controller.dart';

class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: theme.scaffoldBackgroundColor,
          title: const SizedBox(
            height: 50,
            // padding:
            //     const EdgeInsets.only(left: 8, top: 16, right: 8, bottom: 8),
            child: Center(
              child: SearchField(),
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            onPressed: () => Get.back(),
            icon: const Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
          ),
        ),
        body: GetBuilder<NewsController>(builder: (news) {
          if (news.isLoadingSearchArticle) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (news.errorMessageSearchArticle != null) {
            return Center(
              child: Text(news.errorMessageSearchArticle ?? ""),
            );
          }
          return GridView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 180 / 230,
            ),
            itemCount: news.listSearchArticle.length,
            itemBuilder: (ct, id) {
              return CardInternationalArticle(
                  article: news.listSearchArticle[id]);
            },
          );
        }));
  }
}
