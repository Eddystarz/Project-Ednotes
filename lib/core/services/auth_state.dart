import 'package:edtech/core/models/user.dart';
import 'package:flutter/material.dart';

class AuthenticationState extends ChangeNotifier {
  AuthToken? _token;

  dynamic get authToken => _token!.token;

  chnageAuthState(val) {
    _token!.token = val;
    notifyListeners();
  }
}
