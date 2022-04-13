import 'package:flutter/material.dart';
import 'package:news_app/models/article_model.dart';

class CardBusinessArticle extends StatelessWidget {
  final ArticleModel businessArticle;
  const CardBusinessArticle({Key? key, required this.businessArticle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    TextTheme textTheme = Theme.of(context).textTheme;

    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Container(
        width: size.width * 0.8,
        height: double.infinity,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 100 / 100,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  businessArticle.urlToImage!,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(
              width: 8,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(
                  businessArticle.author ?? "No Author",
                  style: textTheme.bodyText2,
                ),
                Text(
                  businessArticle.title ?? "",
                  style: textTheme.subtitle2,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  businessArticle.publishedAt.toString(),
                  style: textTheme.overline,
                ),
              ],
            ))
          ],
        ),
      ),
    );
  }
}
