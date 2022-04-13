import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/card_international_article.dart';
import 'package:news_app/components/circular_loading.dart';
import 'package:news_app/components/error_message_view.dart';
import 'package:news_app/controllers/news_controller.dart';

class IndonesianArticle extends StatelessWidget {
  const IndonesianArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      sliver: GetBuilder<NewsController>(builder: (news) {
        if (news.isLoadingIndonesianArticle) {
          return const SliverFillRemaining(child: CircularLoading());
        } else if (news.errorMessageIndonesianArticle != null) {
          return ErrorMessageView(news.errorMessageIndonesianArticle);
        }
        return SliverGrid(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              childAspectRatio: 180 / 230,
            ),
            delegate: SliverChildBuilderDelegate(
              (ct, id) {
                return CardInternationalArticle(
                    article: news.listIndonesianArticle[id]);
              },
              childCount: news.listIndonesianArticle.length,
            ));
      }),
    );
  }
}
