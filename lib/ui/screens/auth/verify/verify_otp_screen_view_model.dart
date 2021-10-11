import 'package:edtech/base_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class VerifyOtpScreenViewModel extends BaseModel {
  String authToken = '';

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    authToken = prefs.getString('token')!;
    notifyListeners();
  }
}
