import 'package:ehi_connect/core/view_model/base_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../locator.dart';
import '../colors_and_images.dart';

class BaseView<T extends BaseModel> extends StatefulWidget {
  final Widget Function(BuildContext context, T model, Widget child) builder;
  final Function(T) onModelReady;

  String a_base_value = "welcome";

  BaseView({this.builder, this.onModelReady});

  @override
  _BaseViewState<T> createState() {
    return _BaseViewState<T>();
  }
}

class _BaseViewState<T extends BaseModel> extends State<BaseView<T>> {
  T model = locator<T>();

  @override
  void initState() {
    SystemChrome.setPreferredOrientations(ColorAndImageData.getOrientation());
    if (widget.onModelReady != null) {
      widget.onModelReady(model);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<T>(
        builder: (context) {
          return model;
        },
        child: Consumer<T>(builder: widget.builder));
  }
}
