import 'package:auto_route/auto_route.dart';
import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/error_model.dart';
import 'package:edtech/core/models/success_model.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';
import 'package:edtech/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashBoardViewModel extends BaseModel {
  final AuthService authService = locator<AuthService>();

  String firstname = '';
  User? get user => authService.currentUser.user;

  Future<void> fetchLoggedInUser() async {
    firstname = authService.currentUser.user!.firstName!;
    notifyListeners();

    // print(firstname);
  }

  logout(context) async {
    var result = await authService.logout();
    if (result is ErrorModel) {
      showErrorDialogue(message: result.error, onTap: () {}, context: context);
    }
    if (result is SuccessModel) {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString('token',' ');
    // ExtendedNavigator.of(context)
        // .pushAndRemoveUntil(Routes.loginScreen, (route) => false);
            AutoRouter.of(context).pushAndPopUntil( const LoginScreenRoute(),predicate: (route)=>false);

    }
  }
}
