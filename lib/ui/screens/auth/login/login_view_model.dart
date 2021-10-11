
import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/core/services/auth_state.dart';
import 'package:edtech/locator.dart';
//import 'package:edtech/router/router.gr.dart';
import 'package:edtech/ui/screens/dash_board/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class LoginViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();

  bool isLoading = false;
  String? errorMessage;

  setIsLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  setErrorMessage(val) {
    errorMessage = val;
    notifyListeners();
  }

  getLoginResult(result, context) {
    if (result == null) {
      setIsLoading(false);
    }
    if (result['login']['message'] == 'Incorrect login details' ||
        result['login']['user'] == null) {
      setErrorMessage('Incorrect login details');

      setIsLoading(false);

      return showDialogue(
          context: context,
          title: 'Could not sign in',
          message: result['login']['message']);
    }

    User user = User.fromJson(result['login']['user']);
    // Provider.of<AuthenticationState>(context)
    //     .chnageAuthState(result['login']['message']);
    _authService.setCurrentUser(user);
    _authService.setAndSaveToken(
        val: result['login']['message'],
        firstname: result['login']['user']['firstName']);
    setIsLoading(false);
    //ExtendedNavigator.of(context).replace(Routes.dashboard);
    Get.to(() => Dashboard());
  }

  showDialogue({BuildContext? context, title, message}) {
    showDialog(
        context: context!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('$message'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}
