import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/exception_model.dart';
import 'package:news_app/services/api.dart';
import 'package:news_app/utils/constant_value.dart';
import "package:http/http.dart" as http;

class NewsServices {
  static Future<List<ArticleModel>> getTopHeadlinesNews(String url) async {
    try {
      Response response = await http
          .get(API.apiMobileUser("top-headlines?$url"),
              headers: API.headerValue)
          .timeout(const Duration(seconds: 10));
      var data = jsonDecode(response.body);
      if (response.statusCode == 200 &&
          data["status"] == "ok" &&
          data["articles"] != null) {
        return data["articles"]
            .cast<Map<String, dynamic>>()
            .map<ArticleModel>((json) => ArticleModel.fromJson(json))
            .toList();
      } else {
        throw data["message"];
      }
    } on TimeoutException catch (_) {
      throw ExceptionModel(timeoutmsg);
    } on SocketException catch (_) {
      throw ExceptionModel(noInternetmsg);
    } on FormatException catch (_) {
      throw ExceptionModel(errorFormatmsg);
    } catch (e) {
      throw ExceptionModel("$e");
    }
  }

  static Future<List<ArticleModel>?> searchNews(String query) async {
    try {
      http
          .get(API.apiMobileUser("everything?q=$query"))
          .timeout(const Duration(seconds: 10));

      return [];
    } on TimeoutException catch (_) {
      throw ExceptionModel(timeoutmsg);
    } on SocketException catch (_) {
      throw ExceptionModel(noInternetmsg);
    } on FormatException catch (_) {
      throw ExceptionModel(errorFormatmsg);
    } catch (e) {
      throw ExceptionModel("$e");
    }
  }
}
