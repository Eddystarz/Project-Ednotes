import 'package:flutter/material.dart';

class BaseModel extends ChangeNotifier {
  bool _busy = false;
  bool get busy => _busy;

  setBusy(val) {
    _busy = val;
    notifyListeners();
    if (val == true) {
      return CircularProgressIndicator();
    }
  }
}
