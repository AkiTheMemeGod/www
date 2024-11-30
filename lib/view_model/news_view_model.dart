import 'package:www/models/news_channel_headlines_model.dart';
import 'package:www/repos/news_repo.dart';

class NewsViewModel {
  final _repo = NewsRepo();

  Future<NewsChannelHeadlinesModel> fetchNewsChannelHeadlinesApi() async {
    final response = await _repo.fetchNewsChannelHeadlinesApi();
    return response;
  }
}
