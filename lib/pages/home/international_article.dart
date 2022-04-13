import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/card_international_article.dart';
import 'package:news_app/components/circular_loading.dart';
import 'package:news_app/components/error_message_view.dart';
import 'package:news_app/controllers/news_controller.dart';

class InternationalArticle extends StatelessWidget {
  const InternationalArticle({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;
    return SliverToBoxAdapter(
      child: Container(
        width: size.width,
        padding: const EdgeInsets.only(top: 30),
        height: 250,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16.0, bottom: 8, right: 16),
              child: Text(
                "International",
                style: textTheme.headline6,
              ),
            ),
            Expanded(child: GetBuilder<NewsController>(builder: (news) {
              if (news.isLoadingInternationalArticle) {
                return const CircularLoading();
              } else if (news.errorMessageInternationalArticle != null) {
                return ErrorMessageView(news.errorMessageInternationalArticle);
              }
              return ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  separatorBuilder: (context, index) => const Padding(
                        padding: EdgeInsets.only(right: 8.0),
                      ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  scrollDirection: Axis.horizontal,
                  itemCount: 10,
                  itemBuilder: (ctx, id) => CardInternationalArticle(
                      article: news.listInternationalArticle[id]));
            })),
          ],
        ),
      ),
    );
  }
}
