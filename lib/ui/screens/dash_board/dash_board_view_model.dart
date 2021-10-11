
import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';
//import 'package:edtech/router/router.gr.dart';
import 'package:edtech/ui/screens/auth/login/login_screen.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardViewModel extends BaseModel {
  final AuthService authService = locator<AuthService>();

  String firstname = '';
  User get user => authService.currentUser!;

  Future<void> fetchLoggedInUser() async {
    firstname = authService.currentUser!.firstName!;
    notifyListeners();

    // print(firstname);
  }

  logout(context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
    //prefs.setString('token', null);
    Get.to(() => LoginScreen());
    //ex.ExtendedNavigator.of(context)
    //    .pushAndRemoveUntil(Routes.loginScreen, (route) => false);
  }
}
