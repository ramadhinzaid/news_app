import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/routes/route_name.dart';

import 'image_handler.dart';

class CardInternationalArticle extends StatelessWidget {
  final ArticleModel article;
  const CardInternationalArticle({Key? key, required this.article})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: () => Get.toNamed(RouteName.detailPage, arguments: article.url),
      child: AspectRatio(
        aspectRatio: 180 / 230,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: NewsImage.network(
                    article.urlToImage ?? "",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      // color: Colors.black.withOpacity(0.3),
                      gradient: LinearGradient(
                          colors: [
                            Colors.black,
                            Colors.grey.withOpacity(0.2),
                          ],
                          begin: Alignment.bottomCenter,
                          end: Alignment.topCenter),
                      borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16))),
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        article.title ?? "",
                        style:
                            textTheme.subtitle1?.copyWith(color: Colors.white),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        article.publishedAt.toString(),
                        style:
                            textTheme.overline?.copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
