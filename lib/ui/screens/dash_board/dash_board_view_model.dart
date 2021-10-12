import 'package:auto_route/auto_route.dart';
import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';
import 'package:edtech/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardViewModel extends BaseModel {
  final AuthService authService = locator<AuthService>();

  String firstname = '';
  User get user => authService.currentUser.user;

  Future<void> fetchLoggedInUser() async {
    firstname = authService.currentUser.user.firstName;
    notifyListeners();

    // print(firstname);
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token', null);
    ExtendedNavigator.of(context)
        .pushAndRemoveUntil(Routes.loginScreen, (route) => false);
  }
}
