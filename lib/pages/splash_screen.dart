import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:news_app/controllers/news_controller.dart';
import 'package:news_app/routes/route_name.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);
  final NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = Theme.of(context).textTheme;
    Future.delayed(const Duration(seconds: 3), () {
      Get.offNamed(RouteName.homePage);
    });
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: theme.scaffoldBackgroundColor,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset("assets/lottie/splash_screen.json", repeat: false),
          Text(
            "Getting Data...",
            style: textTheme.bodyText1,
          )
        ],
      ),
    );
  }
}
