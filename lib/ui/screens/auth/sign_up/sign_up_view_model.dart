import 'package:auto_route/auto_route.dart';
import 'package:edtech/base_model.dart';
import 'package:edtech/router/router.gr.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends BaseModel {
  bool autovalidate = false;
  bool isLoading = false;

  String errorMessage;

  setIsLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  setErrorMessage(val) {
    errorMessage = val;
    notifyListeners();
  }

  setAutovalidate(val) {
    autovalidate = true;
    notifyListeners();
  }

  getSignupResult(result, context) {
    print(result);
    setIsLoading(false);

    if (result['studentSignup']['value'] == false) {
      print(result);
      showDialogue(
          context: context,
          title: 'An error occured',
          message: result['studentSignup']['message']);
    } else if (result['studentSignup']['value'] == true) {
      ExtendedNavigator.of(context).replace(Routes.loginScreen);
    }
  }

  showDialogue({BuildContext context, title, message}) {
    showDialog(
        context: context,
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
