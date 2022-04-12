import 'package:get/get.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/exception_model.dart';
import 'package:news_app/services/news_services.dart';

class NewsController extends GetxController {
  List<ArticleModel> listInternationalArticle = [];
  bool isLoadingInternationalArticle = true;
  String? errorMessageInternationalArticle;

  @override
  void onInit() {
    super.onInit();

    getInternationalArticle();
  }

  void getInternationalArticle() async {
    print("ok");
    try {
      isLoadingInternationalArticle = true;
      listInternationalArticle =
          await NewsServices.getTopHeadlinesNews("country=us")
              .catchError((onError) {
        errorMessageInternationalArticle = (onError as ExceptionModel).message;
      });
      update();
    } finally {
      isLoadingInternationalArticle = false;
      update();
    }
  }
}
