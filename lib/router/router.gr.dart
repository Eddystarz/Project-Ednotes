// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i12;

import '../ui/screens/assistance/assistance_screen.dart' as _i5;
import '../ui/screens/auth/login/login_screen.dart' as _i1;
import '../ui/screens/auth/sign_up/signup_screen.dart' as _i3;
import '../ui/screens/auth/verify/verify_opt_screen.dart' as _i6;
import '../ui/screens/courses/courses_screen/course_screen.dart' as _i10;
import '../ui/screens/dash_board/dashboard.dart' as _i2;
import '../ui/screens/profile/edit_profile/edit_profile.dart' as _i9;
import '../ui/screens/profile/profile.dart' as _i8;
import '../ui/screens/settings/settings_screen.dart' as _i7;
import '../ui/screens/splash_screen/splash_screen.dart' as _i4;

class Router extends _i11.RootStackRouter {
  Router([_i12.GlobalKey<_i12.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    LoginScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i1.LoginScreen());
    },
    DashboardRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i2.Dashboard());
    },
    SignUpScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i3.SignUpScreen());
    },
    SplashScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i4.SplashScreen());
    },
    AssistanceScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i5.AssistanceScreen());
    },
    VerifyEmailOtpRoute.name: (routeData) {
      final args = routeData.argsAs<VerifyEmailOtpRouteArgs>(
          orElse: () => const VerifyEmailOtpRouteArgs());
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData,
          child: _i6.VerifyEmailOtp(
              key: args.key, timerOff: args.timerOff, email: args.email));
    },
    SettingsScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i7.SettingsScreen());
    },
    ProfilePageRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i8.ProfilePage());
    },
    EditProfileRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: const _i9.EditProfile());
    },
    CourseScreenRoute.name: (routeData) {
      return _i11.MaterialPageX<dynamic>(
          routeData: routeData, child: _i10.CourseScreen());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(LoginScreenRoute.name, path: '/login-screen'),
        _i11.RouteConfig(DashboardRoute.name, path: '/Dashboard'),
        _i11.RouteConfig(SignUpScreenRoute.name, path: '/sign-up-screen'),
        _i11.RouteConfig(SplashScreenRoute.name, path: '/'),
        _i11.RouteConfig(AssistanceScreenRoute.name,
            path: '/assistance-screen'),
        _i11.RouteConfig(VerifyEmailOtpRoute.name, path: '/verify-email-otp'),
        _i11.RouteConfig(SettingsScreenRoute.name, path: '/settings-screen'),
        _i11.RouteConfig(ProfilePageRoute.name, path: '/profile-page'),
        _i11.RouteConfig(EditProfileRoute.name, path: '/edit-profile'),
        _i11.RouteConfig(CourseScreenRoute.name, path: '/course-screen')
      ];
}

/// generated route for [_i1.LoginScreen]
class LoginScreenRoute extends _i11.PageRouteInfo<void> {
  const LoginScreenRoute() : super(name, path: '/login-screen');

  static const String name = 'LoginScreenRoute';
}

/// generated route for [_i2.Dashboard]
class DashboardRoute extends _i11.PageRouteInfo<void> {
  const DashboardRoute() : super(name, path: '/Dashboard');

  static const String name = 'DashboardRoute';
}

/// generated route for [_i3.SignUpScreen]
class SignUpScreenRoute extends _i11.PageRouteInfo<void> {
  const SignUpScreenRoute() : super(name, path: '/sign-up-screen');

  static const String name = 'SignUpScreenRoute';
}

/// generated route for [_i4.SplashScreen]
class SplashScreenRoute extends _i11.PageRouteInfo<void> {
  const SplashScreenRoute() : super(name, path: '/');

  static const String name = 'SplashScreenRoute';
}

/// generated route for [_i5.AssistanceScreen]
class AssistanceScreenRoute extends _i11.PageRouteInfo<void> {
  const AssistanceScreenRoute() : super(name, path: '/assistance-screen');

  static const String name = 'AssistanceScreenRoute';
}

/// generated route for [_i6.VerifyEmailOtp]
class VerifyEmailOtpRoute extends _i11.PageRouteInfo<VerifyEmailOtpRouteArgs> {
  VerifyEmailOtpRoute({_i12.Key? key, bool? timerOff, String? email})
      : super(name,
            path: '/verify-email-otp',
            args: VerifyEmailOtpRouteArgs(
                key: key, timerOff: timerOff, email: email));

  static const String name = 'VerifyEmailOtpRoute';
}

class VerifyEmailOtpRouteArgs {
  const VerifyEmailOtpRouteArgs({this.key, this.timerOff, this.email});

  final _i12.Key? key;

  final bool? timerOff;

  final String? email;
}

/// generated route for [_i7.SettingsScreen]
class SettingsScreenRoute extends _i11.PageRouteInfo<void> {
  const SettingsScreenRoute() : super(name, path: '/settings-screen');

  static const String name = 'SettingsScreenRoute';
}

/// generated route for [_i8.ProfilePage]
class ProfilePageRoute extends _i11.PageRouteInfo<void> {
  const ProfilePageRoute() : super(name, path: '/profile-page');

  static const String name = 'ProfilePageRoute';
}

/// generated route for [_i9.EditProfile]
class EditProfileRoute extends _i11.PageRouteInfo<void> {
  const EditProfileRoute() : super(name, path: '/edit-profile');

  static const String name = 'EditProfileRoute';
}

/// generated route for [_i10.CourseScreen]
class CourseScreenRoute extends _i11.PageRouteInfo<void> {
  const CourseScreenRoute() : super(name, path: '/course-screen');

  static const String name = 'CourseScreenRoute';
}
