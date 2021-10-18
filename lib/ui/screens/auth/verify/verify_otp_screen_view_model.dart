import 'package:auto_route/auto_route.dart';
import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/error_model.dart';
// import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/core/services/user_service.dart';
import 'package:edtech/locator.dart';
import 'package:edtech/router/router.gr.dart';
// import 'package:edtech/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtpScreenViewModel extends BaseModel {
  // final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();
  bool isLoading = false;

  String authToken = '';
  bool timerStopped = false;
  int endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('token')!;
    notifyListeners();
  }

  setTimmerStopped(val) {
    timerStopped = val;
    notifyListeners();
  }

  resendCode(context, email) async {
    var payload = {"email": email};
    final result = await _userService.resendCode(payload);
    if (result is ErrorModel) {
      // Utils(context).showToast(result.error, context);
    }
    setTimmerStopped(false);
    endTime = DateTime.now().millisecondsSinceEpoch + 1000 * 60;

    notifyListeners();
  }

  confirmMail(context, email, code) async {
    setLoading(true);
    var payload = {"code": code, "email": email};
    final result = await _userService.confirmMail(payload);

    if (result is ErrorModel) {
      setLoading(false);
      showErrorDialogue(message: result.error, context: context, onTap: () {});
    } else if (result.data['confirmEmail']['value'] == true) {
      // createStudentProfile(context);
      setLoading(false);
      showDialogue(
          message: result.data['confirmEmail']['message'],
          context: context,
          onTap: () {
            // ExtendedNavigator.of(context).replace(Routes.loginScreen);
                // ExtendedNavigator.of(context).replace(Routes.loginScreen);
         AutoRouter.of(context).replace(const LoginScreenRoute());
          });
    }

    notifyListeners();
  }

  createStudentProfile(context) async {
    var payload = {
      'state': "",
      "school": "",
      "faculty": "",
      "dept": "",
      "level": ""
    };
    var result = await _userService.createStudentProfile(payload);
    if (result is ErrorModel) {
      showErrorDialogue(
        message: result.error,
        context: context,
        onTap: () {},
      );
    }
    showDialogue(
        message: result.data['createStudentProfile']['message'],
        context: context,
        onTap: () {});
  }
}
