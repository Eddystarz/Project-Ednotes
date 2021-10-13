import 'dart:convert';

import 'package:edtech/core/graphql.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/ui/screens/dash_board/dashboard.dart';
import 'package:edtech/ui/widgets/toastshow.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginProvider with ChangeNotifier {
  String? _token;
  User? _currentUser;


  String? get token => _token;
  User? get currentUser => _currentUser;
  String loginMutation = """
      mutation signIn(\$email: String!, \$password: String!) {
        login(input: {email: \$email, password: \$password}) {
          message,
          value,
          user{
            _id
            firstName
            lastName
            username
            email
            phoneNumber
            userType
            isVerified
            isActive
            createdAt
            updatedAt
        }
        }
      }
    """;

  setCurrentUser(User user) {
    _currentUser = user;
    print(_currentUser);
  }

  saveToken(String token) async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    _token = token;
    prefs.setString('token', token);

  }

  saveUser() async {
    SharedPreferences prefs;
    //_authModel = AuthToken.fromJson(val);
    prefs = await SharedPreferences.getInstance();
    var s = json.encode(_currentUser);
    await prefs.setString('profile', s);
  }

  getLoginResult(result) {
    print(result['login']['user']);
    if (result == null) {
      showErrorToast("request failed. check your internet and try again");
      return;
    }

    if(result['login'] == null){
      showErrorToast("request failed. try again");
      return;
    }

    if(result['login']['value'] != null && result['login']['value'] == false){
      showErrorToast(result['login']['message']);
      return;
    }

    if(result['login']['user'] == null){
      print("where is it here again");
      showErrorToast(result['login']['message']);
      return;
    }

    try{
      User user = User.fromJson(result['login']['user']);
      setCurrentUser(user);
      saveToken(result['login']['message']);
      saveUser();
      GraphQLConfiguration.getToken();
      notifyListeners();
    }catch(e){
      print(e);
    }

    Get.offAll(() => Dashboard());
  }
}