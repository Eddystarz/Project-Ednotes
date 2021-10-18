import 'package:auto_route/auto_route.dart';
import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/error_model.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/core/services/auth_service.dart';

import 'package:edtech/locator.dart';
import 'package:edtech/router/router.gr.dart';

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

  // getLoginResult(result, context) {
  //   if (result == null) {
  //     setIsLoading(false);
  //   }
  //   if (result['login']['message'] == 'Incorrect login details' ||
  //       result['login']['user'] == null) {
  //     setErrorMessage('Incorrect login details');

  //     setIsLoading(false);

  //     return showDialogue(
  //         context: context,
  //         title: 'Could not sign in',
  //         message: result['login']['message']);
  //   }

  //   User user = User.fromJson(result['login']['user']);
  //   // Provider.of<AuthenticationState>(context)
  //   //     .chnageAuthState(result['login']['message']);
  //   _authService.setCurrentUser(user);
  //   _authService.setAndSaveToken(
  //       val: result['login']['message'],
  //       firstname: result['login']['user']['firstName']);
  //   setIsLoading(false);
  //   ExtendedNavigator.of(context).replace(Routes.dashboard);
  // }

//    "email":emailController.text,
  //       "password":passwordController.text

  login({String? email, String? password, context}) async {
    var payload = {
      "email": email,
      "password": password,
    };
    setBusy(true);
    final result = await _authService.login(payload);
    // print(result.data);
    if (result is ErrorModel) {
      setBusy(false);
      showErrorDialogue(
          context: context,
          // title: "An error occured",
          message: result.error,
          onTap: () {
            //  Navigator.of(context).pop
          });

      if (result.error
          .toString()
          .contains('Unverified email adress, check you email for code !')) {
        // ExtendedNavigator.of(context).replace(Routes.verifyEmailOtp,
            // arguments: VerifyEmailOtpArguments(timerOff: true, email: email!));
             AutoRouter.of(context).replace( VerifyEmailOtpRoute(timerOff:false,email:email));
      }
    } else {
      setBusy(false);

      User user = User.fromJson(result.data['login']['user']);
      _authService.setCurrentUser(user);
      _authService.setAndSaveToken(
          val: result.data['login']['message'],
          firstname: result.data['login']['user']['firstName']);
      // ExtendedNavigator.of(context).replace(Routes.dashboard);
       AutoRouter.of(context).replace( const DashboardRoute());



    }
  }
}
