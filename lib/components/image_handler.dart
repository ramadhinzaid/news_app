import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class NewsImage {
  static network(String src, {double? width, double? height, BoxFit? fit}) {
    return Image.network(
      src,
      width: width,
      height: height,
      fit: fit,
      frameBuilder: (context, child, index, finish) {
        if (index == null) {
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: Container(
              height: height,
              width: width,
              color: Colors.white,
              padding: const EdgeInsets.all(15),
              // child: const Center(child: CircularProgressIndicator()),
            ),
          );
        }
        return child;
      },
      errorBuilder: (ctx, err, st) {
        return Container(
          height: height,
          width: width,
          color: Colors.white,
          padding: const EdgeInsets.all(15),
          // child: const CircularLoading(),
          child: const Center(
            child: Text("Error Image"),
          ),
        );
      },
    );
  }
}
