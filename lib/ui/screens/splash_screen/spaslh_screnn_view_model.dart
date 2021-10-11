import 'package:auto_route/auto_route.dart';
import 'package:edtech/base_model.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';
// import 'package:edtech/locator.dart';
//import 'package:edtech/router/router.gr.dart';
import 'package:edtech/ui/screens/auth/login/login_screen.dart';
import 'package:edtech/ui/screens/dash_board/dashboard.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();

  checkLoginStatus(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token == null) {
      //ExtendedNavigator.of(context).replace(Routes.loginScreen);
      Get.to(() => LoginScreen());
    } else {
      _authService.alreadyLoggedIn();
      //ExtendedNavigator.of(context).replace(Routes.dashboard);
      Get.to(() => Dashboard());
    }
  }
}
