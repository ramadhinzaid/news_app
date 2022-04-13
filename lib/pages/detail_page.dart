import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  bool isLoading = true;

  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  final Set<JavascriptChannel> jsChannels = {
    JavascriptChannel(
        name: 'Print',
        onMessageReceived: (JavascriptMessage message) {
          // ignore: avoid_print
          print({message, "MS"});
        }),
  };

  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = AndroidWebView();
    }
    super.initState();
  }

  String? url = Get.arguments;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: theme.scaffoldBackgroundColor,
        title: Text("Detail", style: textTheme.headline5),
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Stack(
        children: [
          WebView(
            initialUrl: url,
            javascriptChannels: jsChannels,
            gestureNavigationEnabled: true,
            javascriptMode: JavascriptMode.unrestricted,
            backgroundColor: theme.scaffoldBackgroundColor,
            onWebViewCreated: (cont) {
              _controller.complete(cont);
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
          ),
          if (isLoading || url == null)
            const Center(
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }
}
