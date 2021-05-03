import 'package:flutter/cupertino.dart';

abstract class BaseModel extends ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;
  set setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }  

  void initState();
}