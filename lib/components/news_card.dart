import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:www/helpers/helper.dart';

class NewsCard extends StatelessWidget {
  final height;
  final width;
  final snapshot;
  final index;
  NewsCard(
      {super.key,
      required this.height,
      required this.width,
      required this.snapshot,
      required this.index});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        alignment: Alignment.bottomCenter,
        height: height * 0.22,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //crossAxisAlignment: CrossAxisAlignment.,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              width: width * 0.7,
              child: Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                snapshot.data!.articles![index].title.toString(),
                style: GoogleFonts.poppins(
                    fontSize: 15, fontWeight: FontWeight.w700),
              ),
            ),
            Spacer(),
            Container(
              padding: EdgeInsets.all(10),
              width: width * 0.7,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(snapshot.data!.articles![index].source!.name.toString(),
                      style: GoogleFonts.poppins(
                          fontSize: 12,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold)),
                  Text(
                      formatTimestamp(
                        snapshot.data!.articles![index].publishedAt ?? "",
                      ),
                      style: GoogleFonts.poppins(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w700))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
