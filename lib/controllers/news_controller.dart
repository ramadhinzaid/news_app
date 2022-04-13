import 'package:get/get.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/exception_model.dart';
import 'package:news_app/services/news_services.dart';

class NewsController extends GetxController {
  List<ArticleModel> listInternationalArticle = [];
  bool isLoadingInternationalArticle = true;
  String? errorMessageInternationalArticle;

  List<ArticleModel> listBusinessArticle = [];
  bool isLoadingBusinessArticle = true;
  String? errorMessageBusinessArticle;

  List<ArticleModel> listIndonesianArticle = [];
  bool isLoadingIndonesianArticle = true;
  String? errorMessageIndonesianArticle;

  @override
  void onInit() {
    super.onInit();

    getInternationalArticle();
    getBusinessArticle();
    getIndonesianArticle();
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

  void getBusinessArticle() async {
    print("ok");
    try {
      isLoadingBusinessArticle = true;
      listBusinessArticle =
          await NewsServices.getTopHeadlinesNews("country=us&category=business")
              .catchError((onError) {
        errorMessageBusinessArticle = (onError as ExceptionModel).message;
      });
      update();
    } finally {
      isLoadingBusinessArticle = false;
      update();
    }
  }

  void getIndonesianArticle() async {
    print("ok");
    try {
      isLoadingIndonesianArticle = true;
      listIndonesianArticle =
          await NewsServices.getTopHeadlinesNews("country=id")
              .catchError((onError) {
        errorMessageIndonesianArticle = (onError as ExceptionModel).message;
      });
      update();
    } finally {
      isLoadingIndonesianArticle = false;
      update();
    }
  }
}
