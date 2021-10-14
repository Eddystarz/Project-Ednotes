import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/error_model.dart';
import 'package:edtech/core/models/student.dart';
import 'package:edtech/core/models/success_model.dart';
// import 'package:edtech/core/models/user.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/core/services/user_service.dart';
import 'package:edtech/locator.dart';
import 'package:flutter/material.dart';

class ProfileViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();

  Student get user => _authService.currentUser;
  Student student;

  getUser({BuildContext context}) async {
    final result = await _userService.getStudent();
    if (result is ErrorModel) {
      showErrorDialogue(message: result.error, onTap: () {});
    }
    if (result is SuccessModel) {
      var data = result.data['student'];
      student = Student.fromJson(data);
      _authService.setCurrentStudent(student);
      notifyListeners();
    }
  }
}
