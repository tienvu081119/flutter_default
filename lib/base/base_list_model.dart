
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_model.dart';

abstract class BaseListModel extends BaseModel {
  RefreshController refreshController =
      RefreshController(initialRefresh: false);

  Future<void> onRefresh()async {
    refreshController.refreshCompleted();
  }
  Future<void> onLoading()async {
    refreshController.loadComplete();
  }
}
