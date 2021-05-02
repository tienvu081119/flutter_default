import 'package:design_ui/data/repository/news_repository.dart';
import 'package:design_ui/src/models/news.dart';
import 'package:flutter/cupertino.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class NewsViewModel extends ChangeNotifier {
  NewsRepository _newsRepository = NewsRepository();
  List<News> _allNews = [];
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  List<News> get allNews => _allNews;
  int _page = 1;
  RefreshController refreshController = RefreshController(initialRefresh: false);
      
  NewsViewModel() {
    this.loadNews();
  }

  onRefresh() async {
    _allNews = [];
    notifyListeners();
    _page = 1;
    List<News> news = await _newsRepository.fetchNews(page: _page);
    _allNews.addAll(news);
    notifyListeners();
    refreshController.refreshCompleted();
  }

  onLoading() async {
     _page += 1;
    List<News> news = await _newsRepository.fetchNews(page: _page);
    _allNews.addAll(news);
    notifyListeners();
    refreshController.loadComplete();
  }

  loadNews() async {
    _isLoading = true;
    notifyListeners();
    List<News> news = await _newsRepository.fetchNews();
    _allNews.addAll(news);
    _isLoading = false;
    notifyListeners();
  }
}
