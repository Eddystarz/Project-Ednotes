import 'package:auto_route/auto_route.dart';
import 'package:edtech/base_model.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';
import 'package:edtech/router/router.gr.dart';

// import 'package:edtech/locator.dart';
// import 'package:edtech/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashScreenViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();

  checkLoginStatus(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var token = prefs.getString('token');
    if (token == null || token == " ") {
      // ExtendedNavigator.of(context).replace(Routes.loginScreen);
      AutoRouter.of(context).replace(const LoginScreenRoute());
    } else {
      _authService.alreadyLoggedIn();
      // ExtendedNavigator.of(context).replace(Routes.dashboard);
      AutoRouter.of(context).replace(const DashboardRoute());
    }
  }
}
