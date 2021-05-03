import 'package:design_ui/base/base_view.dart';
import 'package:design_ui/src/view_models/news_new_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class TabNews extends StatefulWidget {
  @override
  _TabNewsState createState() => _TabNewsState();
}

class _TabNewsState extends State<TabNews> {
  NewsViewModel model = NewsViewModel();
  
    @override
    void initState() {
      super.initState();
    }
  
    @override
    Widget build(BuildContext context) {
      return BaseView<NewsViewModel> (
          model: NewsViewModel(),
          builder:(_, model, Widget widget){
            if (model.isLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (!model.isLoading && model.allNews.length == 0) {
              return Center(
                child: Text('NoData'),
              );
            }
            return SmartRefresher(
                enablePullDown: true,
                enablePullUp: true,
                controller: model.refreshController,
                onRefresh: model.onRefresh,
                onLoading: model.onLoading,
                child: ListView.builder(
                    itemCount: model.allNews.length,
                    itemBuilder: (_, index) {
                      return ListTile(
                        title: Text('${model.allNews[index].title}'),
                        subtitle: Text('${model.allNews[index].timeAgo}'),
                      );
                    }));
          });
    }

}
