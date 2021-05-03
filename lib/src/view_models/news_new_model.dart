import 'package:design_ui/base/base_list_model.dart';
import 'package:design_ui/data/repository/news_repository.dart';
import 'package:design_ui/src/models/news.dart';

class NewsViewModel extends BaseListModel {
  NewsRepository _newsRepository = NewsRepository();
  List<News> _allNews = [];
  List<News> get allNews => _allNews;
  int _page = 1;

  /*NewsViewModel()
  {
    this.loadNews();
  }*/

  void loadNews() async {
    setLoading = true;      
    List<News> news = await _newsRepository.fetchNews();
    _allNews.addAll(news);
    setLoading = false;    
  }  

  @override
  Future<void> onRefresh() async {
    _allNews = [];
    notifyListeners();
    _page = 1;
    List<News> news = await _newsRepository.fetchNews(page: _page);
    _allNews.addAll(news);
    notifyListeners();
    return super.onRefresh();
  }

   @override
  Future<void> onLoading() async {
     _page += 1;
     List<News> news = await _newsRepository.fetchNews(page: _page);
     _allNews.addAll(news);
     notifyListeners();
    return super.onLoading();
  }

  @override
  void initState() {
    // TODO: implement initState
     this.loadNews();
  }
}
