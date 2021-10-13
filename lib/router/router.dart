// import 'package:edtech/ui/Screens/auth/verify/verify_opt_screen.dart';


import 'package:auto_route/annotations.dart';
import 'package:edtech/ui/screens/assistance/assistance_screen.dart';
import 'package:edtech/ui/screens/auth/login/login_screen.dart';
import 'package:edtech/ui/screens/auth/sign_up/signup_screen.dart';
import 'package:edtech/ui/screens/auth/verify/verify_opt_screen.dart';
import 'package:edtech/ui/screens/courses/courses_screen/course_screen.dart';
import 'package:edtech/ui/screens/dash_board/dashboard.dart';
import 'package:edtech/ui/screens/profile/edit_profile/edit_profile.dart';
import 'package:edtech/ui/screens/profile/profile.dart';
import 'package:edtech/ui/screens/settings/settings_screen.dart';
import 'package:edtech/ui/screens/splash_screen/splash_screen.dart';

@MaterialAutoRouter(
  //generateNavigationHelperExtension: true,
  routes: <AutoRoute>[
    // initial route is named "/"
    MaterialRoute(
      page: LoginScreen,
    ),
    MaterialRoute(
      page: Dashboard,
    ),
    MaterialRoute(
      page: SignUpScreen,
    ),
    MaterialRoute(page: SplashScreen, initial: true),
    MaterialRoute(
      page: AssistanceScreen,
    ),

    MaterialRoute(
      page: VerifyEmailOtp,
    ),
    MaterialRoute(page: SettingsScreen),
    MaterialRoute(page: ProfilePage),
    MaterialRoute(page: EditProfile),
    MaterialRoute(page: CourseScreen),
  ],
)
class $Router {}
