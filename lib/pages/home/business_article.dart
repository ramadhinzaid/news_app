import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/card_business_article.dart';
import 'package:news_app/components/circular_loading.dart';
import 'package:news_app/components/error_message_view.dart';
import 'package:news_app/controllers/news_controller.dart';

class BusinessArticle extends StatelessWidget {
  const BusinessArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.only(top: 16),
        height: 200,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8, right: 16),
              child: Text(
                "Business",
                style: textTheme.headline6,
              ),
            ),
            Expanded(child: GetBuilder<NewsController>(builder: (news) {
              if (news.isLoadingBusinessArticle) {
                return const CircularLoading();
              } else if (news.errorMessageBusinessArticle != null) {
                return ErrorMessageView(news.errorMessageBusinessArticle);
              }
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                      ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: news.listBusinessArticle.length,
                  itemBuilder: (ct, id) => CardBusinessArticle(
                      businessArticle: news.listBusinessArticle[id]));
            })),
            Padding(
              padding: const EdgeInsets.only(
                  left: 16, right: 16, top: 16, bottom: 8),
              child: Text(
                "Top In Indonesia",
                style: textTheme.headline6,
              ),
            )
          ],
        ),
      ),
    );
  }
}
