import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:www/models/news_channel_headlines_model.dart';

class NewsRepo {
  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
    String url =
        "https://newsapi.org/v2/top-headlines?sources=bbc-news&apiKey=14c2f60bce7b4ffeba0cf4664f15b15c";

    final response = await http.get(Uri.parse(url));
    print(response.body);

    if (response.statusCode == 200) {
      final body = jsonDecode(response.body);

      return NewsChannelHeadlinesModel.fromJson(body);
    }
    throw Exception('error');
  }
}
