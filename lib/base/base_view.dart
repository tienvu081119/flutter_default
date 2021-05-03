import 'package:design_ui/base/base_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {  
  final T model;
  final Widget Function (
    BuildContext context,
    T value,
    Widget child ) builder;
  const BaseView({Key key, this.model, this.builder})
      : super(key: key);
  @override
  _BaseViewState<T> createState()=> _BaseViewState<T>();
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>>{
  T currentModel;  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentModel = widget.model;
    currentModel.initState();
  }

  @override
  Widget build(BuildContext context) {
   return ChangeNotifierProvider<T>(
          create: (_) => widget.model,
          child: Consumer<T>(builder: widget.builder));
  }
}