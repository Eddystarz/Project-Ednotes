import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';

class ProfileViewModel extends BaseModel {
  final AuthService _authService = locator<AuthService>();

  User get user => _authService.currentUser!;

  
}
