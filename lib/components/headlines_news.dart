import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class TopNews extends StatelessWidget {
  final height;
  final width;
  final snapshot;
  final index;
  TopNews(
      {super.key,
      required this.height,
      required this.width,
      required this.snapshot,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Container(
        height: height * 0.6,
        width: width * .9,
        padding: EdgeInsets.symmetric(horizontal: height * .02),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: CachedNetworkImage(
            imageUrl: snapshot.data!.articles![index].urlToImage.toString(),
            fit: BoxFit.cover,
            placeholder: (context, url) => Container(
              child: SpinKitFadingCircle(
                color: Colors.blue,
              ),
            ),
            errorWidget: (context, url, error) => Icon(Icons.error),
          ),
        ));
  }
}
