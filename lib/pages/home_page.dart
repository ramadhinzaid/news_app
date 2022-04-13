import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/card_business_article.dart';
import 'package:news_app/components/card_international_article.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/pages/search_page.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    ThemeData theme = Theme.of(context);
    Size size = MediaQuery.of(context).size;
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
            onPressed: () => showGeneralDialog(
                context: context,
                pageBuilder: (ctx, animation, secondAnimation) {
                  return SearchPage();
                }),
            icon: Icon(
              Icons.search_rounded,
              color: theme.indicatorColor,
            ),
          )
        ],
      ),
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Container(
              width: size.width,
              padding: const EdgeInsets.only(top: 30),
              height: 250,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 8, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "International",
                          style: textTheme.headline6,
                        ),
                        Text(
                          "See All",
                          style:
                              textTheme.subtitle2?.copyWith(color: Colors.grey),
                        ),
                      ],
                    ),
                  ),
                  Expanded(child: GetBuilder<NewsController>(builder: (news) {
                    if (news.isLoadingInternationalArticle) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    } else if (news.errorMessageInternationalArticle != null) {
                      return Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Center(
                          child: Text(
                            news.errorMessageInternationalArticle ?? "",
                            style: textTheme.bodyText2,
                            textAlign: TextAlign.center,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
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
          ),
          SliverToBoxAdapter(
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(top: 16),
              height: 200,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, bottom: 8, right: 16),
                    child: Text(
                      "Business",
                      style: textTheme.headline6,
                    ),
                  ),
                  Expanded(child: GetBuilder<NewsController>(builder: (news) {
                    if (news.isLoadingBusinessArticle) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
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
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            sliver: GetBuilder<NewsController>(builder: (news) {
              if (news.isLoadingIndonesianArticle) {
                return const SliverFillRemaining(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
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
          )
        ],
      ),
    );
  }
}
