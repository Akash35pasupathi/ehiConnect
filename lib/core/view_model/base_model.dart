import 'package:ehi_connect/core/enums/viewstate.dart';
import 'package:flutter/widgets.dart';

class BaseModel extends ChangeNotifier {
  ViewState _state = ViewState.Idle;

  ViewState get state {
    return _state;
  }

  void setState(ViewState viewState) {
    _state = viewState;
    notifyListeners();
  }
}
