import 'package:news_app/utils/constant_value.dart';

class API {
  static Uri apiMobileUser(url) => Uri.parse(baseUrl + url);

  static Map<String, String> headerValue = {"X-Api-Key": apiKey};
}
