import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:www/components/headlines_news.dart';
//import 'package:intl/intl.dart';
import 'package:www/components/news_card.dart';
import 'package:www/models/news_channel_headlines_model.dart';
import 'package:www/view_model/news_view_model.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  NewsViewModel newsViewModel = NewsViewModel();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.category)),
        title: Center(
            child: Text(
          "News Today",
          style: GoogleFonts.poppins(fontSize: 24, fontWeight: FontWeight.w700),
        )),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Icon(Icons.menu),
          )
        ],
      ),
      body: SizedBox(
        height: height * .55,
        width: width,
        // color: Colors.green,
        child: FutureBuilder<NewsChannelHeadlinesModel>(
          future: newsViewModel.fetchNewsChannelHeadlinesApi(),
          builder: (BuildContext context, snapshot) {
            //print(snapshot.data!.articles!.length);
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: SpinKitCircle(
                  size: 50,
                  color: Colors.blue,
                ),
              );
            } else {
              return ListView.builder(
                  itemCount: snapshot.data!.articles!.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return SizedBox(
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          TopNews(
                              height: height,
                              width: width,
                              snapshot: snapshot,
                              index: index),
                          Positioned(
                            bottom: 20,
                            child: NewsCard(
                              height: height,
                              width: width,
                              snapshot: snapshot,
                              index: index,
                            ),
                          )
                        ],
                      ),
                    );
                  });
            }
          },
        ),
      ),
    );
  }
}
