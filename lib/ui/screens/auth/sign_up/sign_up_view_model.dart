import 'package:auto_route/auto_route.dart';
import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/error_model.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';
import 'package:edtech/router/router.gr.dart';
import 'package:flutter/material.dart';

class SignupViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();
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
      showErrorDialogue(
          context: context, message: result['studentSignup']['message']);
    } else if (result['studentSignup']['value'] == true) {
      ExtendedNavigator.of(context).replace(Routes.loginScreen);
    }
  }

  signUp(
      {String firstName,
      String lastName,
      String userName,
      String email,
      String phone,
      String password,
      context}) async {
    var payload = {
      'firstName': firstName,
      'lastName': lastName,
      'username': userName,
      'phoneNumber': phone,
      'email': email,
      'password': password
    };
    setBusy(true);
    final result = await _authService.signUp(payload);

    if (result is ErrorModel) {
      print(result.error);
      setBusy(false);
      return showErrorDialogue(
          context: context, message: result.error, onTap: () {});
    } else if (result.data['signup']['value'] == true) {
      print(result.data);
      setBusy(false);
      // showDialogue(
      //     context: context,
      //     message: result.data['signup']['message'],
      //     onTap: () {
      ExtendedNavigator.of(context).replace(Routes.verifyEmailOtp,
          arguments: VerifyEmailOtpArguments(timerOff: false, email: email));
      // });
    }
  }

  // showDialogue({BuildContext context, title, message}) {
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           title: Text(title),
  //           content: SingleChildScrollView(
  //             child: ListBody(
  //               children: <Widget>[
  //                 Text('$message'),
  //               ],
  //             ),
  //           ),
  //           actions: <Widget>[
  //             TextButton(
  //               child: Text('Close'),
  //               onPressed: () {
  //                 Navigator.of(context).pop();
  //               },
  //             ),
  //           ],
  //         );
  //       });
  // }
}
