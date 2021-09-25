// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../ui/screens/assistance/assistance_screen.dart';
import '../ui/screens/auth/login/login_screen.dart';
import '../ui/screens/auth/sign_up/signup_screen.dart';
import '../ui/screens/auth/verify/verify_opt_screen.dart';
import '../ui/screens/courses/courses_screen/course_screen.dart';
import '../ui/screens/dash_board/dashboard.dart';
import '../ui/screens/profile/edit_profile/edit_profile.dart';
import '../ui/screens/profile/profile.dart';
import '../ui/screens/settings/settings_screen.dart';
import '../ui/screens/splash_screen/splash_screen.dart';

class Routes {
  static const String loginScreen = '/login-screen';
  static const String dashboard = '/Dashboard';
  static const String signUpScreen = '/sign-up-screen';
  static const String splashScreen = '/';
  static const String assistanceScreen = '/assistance-screen';
  static const String verifyEmailOtp = '/verify-email-otp';
  static const String settingsScreen = '/settings-screen';
  static const String profilePage = '/profile-page';
  static const String editProfile = '/edit-profile';
  static const String courseScreen = '/course-screen';
  static const all = <String>{
    loginScreen,
    dashboard,
    signUpScreen,
    splashScreen,
    assistanceScreen,
    verifyEmailOtp,
    settingsScreen,
    profilePage,
    editProfile,
    courseScreen,
  };
}

class Router extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.loginScreen, page: LoginScreen),
    RouteDef(Routes.dashboard, page: Dashboard),
    RouteDef(Routes.signUpScreen, page: SignUpScreen),
    RouteDef(Routes.splashScreen, page: SplashScreen),
    RouteDef(Routes.assistanceScreen, page: AssistanceScreen),
    RouteDef(Routes.verifyEmailOtp, page: VerifyEmailOtp),
    RouteDef(Routes.settingsScreen, page: SettingsScreen),
    RouteDef(Routes.profilePage, page: ProfilePage),
    RouteDef(Routes.editProfile, page: EditProfile),
    RouteDef(Routes.courseScreen, page: CourseScreen),
  ];
  @override
  Map<Type, AutoRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, AutoRouteFactory>{
    LoginScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => LoginScreen(),
        settings: data,
      );
    },
    Dashboard: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => Dashboard(),
        settings: data,
      );
    },
    SignUpScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SignUpScreen(),
        settings: data,
      );
    },
    SplashScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const SplashScreen(),
        settings: data,
      );
    },
    AssistanceScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => AssistanceScreen(),
        settings: data,
      );
    },
    VerifyEmailOtp: (data) {
      final args = data.getArgs<VerifyEmailOtpArguments>(
        orElse: () => VerifyEmailOtpArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => VerifyEmailOtp(
          key: args.key,
          timerOff: args.timerOff,
          email: args.email,
        ),
        settings: data,
      );
    },
    SettingsScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => SettingsScreen(),
        settings: data,
      );
    },
    ProfilePage: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const ProfilePage(),
        settings: data,
      );
    },
    EditProfile: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const EditProfile(),
        settings: data,
      );
    },
    CourseScreen: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => CourseScreen(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Navigation helper methods extension
/// *************************************************************************

extension RouterExtendedNavigatorStateX on ExtendedNavigatorState {
  Future<dynamic> pushLoginScreen() => push<dynamic>(Routes.loginScreen);

  Future<dynamic> pushDashboard() => push<dynamic>(Routes.dashboard);

  Future<dynamic> pushSignUpScreen() => push<dynamic>(Routes.signUpScreen);

  Future<dynamic> pushSplashScreen() => push<dynamic>(Routes.splashScreen);

  Future<dynamic> pushAssistanceScreen() =>
      push<dynamic>(Routes.assistanceScreen);

  Future<dynamic> pushVerifyEmailOtp({
    Key key,
    bool timerOff,
    String email,
  }) =>
      push<dynamic>(
        Routes.verifyEmailOtp,
        arguments:
            VerifyEmailOtpArguments(key: key, timerOff: timerOff, email: email),
      );

  Future<dynamic> pushSettingsScreen() => push<dynamic>(Routes.settingsScreen);

  Future<dynamic> pushProfilePage() => push<dynamic>(Routes.profilePage);

  Future<dynamic> pushEditProfile() => push<dynamic>(Routes.editProfile);

  Future<dynamic> pushCourseScreen() => push<dynamic>(Routes.courseScreen);
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// VerifyEmailOtp arguments holder class
class VerifyEmailOtpArguments {
  final Key key;
  final bool timerOff;
  final String email;
  VerifyEmailOtpArguments({this.key, this.timerOff, this.email});
}
