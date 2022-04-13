import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_app/controllers/news_controller.dart';

class SearchField extends StatefulWidget {
  const SearchField({Key? key}) : super(key: key);

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  TextEditingController searchQuery = TextEditingController();
  NewsController news = Get.put(NewsController());

  @override
  void initState() {
    searchQuery.addListener(() {
      setState(() {});
    });

    super.initState();
  }

  @override
  void dispose() {
    searchQuery.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: searchQuery,
      onEditingComplete: () {
        if (searchQuery.text.isNotEmpty) {
          news.getSearchArticle(searchQuery.text);
        }
      },
      textInputAction: TextInputAction.search,
      cursorColor: Colors.grey,
      decoration: InputDecoration(
        suffixIcon: IconButton(
            onPressed: () => searchQuery.clear(),
            icon: const Icon(
              Icons.close,
              color: Colors.grey,
            )),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.grey, width: 1, style: BorderStyle.solid)),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(
                color: Colors.grey, width: 1, style: BorderStyle.solid)),
      ),
    );
  }
}
