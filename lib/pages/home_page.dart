import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/components/card_international_article.dart';
import 'package:news_app/controllers/news_controller.dart';

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
            onPressed: () {},
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
                  Expanded(
                      child: ListView.separated(
                          separatorBuilder: (context, index) => const Padding(
                                padding: EdgeInsets.only(right: 8.0),
                              ),
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          scrollDirection: Axis.horizontal,
                          itemCount: 30,
                          itemBuilder: (ct, id) => Card(
                                child: Container(
                                  width: 100,
                                  color: Colors.red,
                                  child: const Text("O"),
                                ),
                              ))),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 16),
                    child: Text(
                      "Top In Indonesia",
                      style: textTheme.headline6,
                    ),
                  )
                ],
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildBuilderDelegate(
            (ct, id) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  child: Container(
                    height: 50,
                  ),
                ),
              );
            },
            childCount: 20,
          ))
        ],
      ),
    );
  }
}
