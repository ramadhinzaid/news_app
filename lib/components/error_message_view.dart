import 'package:flutter/material.dart';

class ErrorMessageView extends StatelessWidget {
  final String? message;
  const ErrorMessageView(this.message, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: Text(
          message ?? "",
          style: textTheme.bodyText2,
          textAlign: TextAlign.center,
          maxLines: 3,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
