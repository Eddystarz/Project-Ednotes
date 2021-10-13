
import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/department.dart';
import 'package:edtech/core/models/error_model.dart';
import 'package:edtech/core/models/faculty.dart';
import 'package:edtech/core/models/level.dart';
import 'package:edtech/core/models/school.dart';
import 'package:edtech/core/models/success_model.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/core/services/user_service.dart';
// import 'package:edtech/core/services/user_service.dart';
import 'package:edtech/locator.dart';
import 'package:edtech/ui/screens/dash_board/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EditProfileViewModel extends BaseModel {
  // final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();

  var schoolList = [];
  var departmentList = [];
  var facultyList = [];
  var levelList = [];

  String? selectDept;
  String? selectedSchool;
  String? selectedFaculty;
  String? selectedLevel;
  School? schooSelected;
  Faculty? facultySelected;
  Department? departmentSelected;
  Level? levelSelected;

  bool isLoading = false;

  setLoading(val) {
    isLoading = val;
    notifyListeners();
  }

  User get currentUser => _authService.currentUser!;

  fetchSchools() async {
    final result = await _userService.getSchoolList();
    if (result is ErrorModel) {
      print(result.error);
    }
    var data = result.data['schools'];
    List<School> schools = List.from(data.map((item) => School.fromJson(item)));

    schoolList = schools;

    notifyListeners();
    print("schoolList::::::: $schoolList");
  }

  // fetchLevel() async {
  //   final result = await _userService.getLevel();
  //   if (result is ErrorModel) {
  //     print(result.error);
  //   }
  //   var data = result.data['levels'];
  //   List<Level> lvlList = List.from(data.map((item) => Level.fromJson(item)));

  //   levelList = lvlList;

  //   notifyListeners();
  //   print("levelList::::::: $levelList");
  // }

  setUserHere(String state) {
   /* _authService.currentUser!.department =
        departmentList.firstWhere((element) => element.name == selectDept);
    _authService.currentUser!.faculty =
        facultyList.firstWhere((element) => element.name == selectedFaculty);
    _authService.currentUser!.school =
        schoolList.firstWhere((element) => element.name == selectedSchool);
    _authService.currentUser!.level =
        levelList.firstWhere((element) => element.name == selectedLevel);
    _authService.currentUser!.state = state; */
    notifyListeners();
  }

  fetchObjectFromList(String name, List objectList) {
    var school = objectList.firstWhere((element) => element.name == name);
    print(school.id);
    return school.id;
  }

  selectSchool(val) {
    selectedSchool = val;
    notifyListeners();
    selectedFaculty = null;
    schooSelected =
        schoolList.firstWhere((element) => element.name == selectedSchool);
    notifyListeners();
    fetchFaculty(selectedSchool);
  }

  selectFaculty(val) {
    selectedFaculty = val;
    notifyListeners();
    selectDept = null;
    // var faculty =
    //     facultyList.firstWhere((element) => element.name == selectedFaculty);
    fetchDepartment(selectedFaculty);
  }

  selectDepartment(val) {
    selectDept = val;
    notifyListeners();
    selectedLevel = null;
    fetchLevel(selectDept);
  }

  fetchFaculty(val) async {
    // schooSelected = schoolList.firstWhere((element) => element.name == val);
    facultyList = schooSelected!.faculties!;
    notifyListeners();
  }

  fetchDepartment(val) async {
    departmentList = schooSelected!.departments!
        .where((element) => element!.faculty!.name == val)
        .toList();
    notifyListeners();
  }

  fetchLevel(val) async {
    levelList = schooSelected!.levels!
        .where((element) => element!.department!.name == val)
        .toList();
    notifyListeners();
  }
  // getLevels(result) {
  //   if (result.loading) {
  //     // setLoading(true);
  //   }
  //   var data = result.data['levels'];
  //   List<Level> levels = List.from(data.map((item) => Level.fromJson(item)));
  //   // setLoading(false);
  //   levelList = levels;
  // }

  showDialogue({BuildContext? context, title, message}) {
    showDialog(
        context: context!,
        builder: (context) {
          return AlertDialog(
            title: Text(title),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('$message'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }

  showEditProfileResponse(result, context, state) {
    if (result['updateStudentProfile']['value'] == true) {
      setUserHere(state);
      // setLoading(false);
      showDialogue(
          context: context,
          title: 'Update Successful',
          message: result['updateStudentProfile']['message']);
      //ExtendedNavigator.of(context).replace(Routes.dashboard);
      Get.to(() => Dashboard());

    } else {
      // setLoading(false);
      return showDialogue(
          context: context,
          title: 'An error occureed',
          message: 'Could not update your profile, please try again later');
    }
  }

  editprofile(String state, context) async {
    var faculty = fetchObjectFromList(selectedFaculty!, facultyList);
    var dept = fetchObjectFromList(selectDept!, departmentList);
    var level = fetchObjectFromList(selectedLevel!, levelList);
    final payload = {
      'state': state,
      'school': schooSelected!.id,
      'faculty': faculty,
      'dept': dept,
      'level': level,
    };
    setLoading(true);
    final result = await _userService.saveProfileEdit(payload);
    if (result is ErrorModel) {
      setLoading(false);
      return showDialogue(
          context: context, title: 'An error occureed', message: result.error);
    } else if (result.data['updateStudentProfile']['value'] == true) {
      setLoading(true);
      setUserHere(state);
      // setLoading(false);
      showDialogue(
          context: context,
          title: 'Update Successful',
          message: result.data['updateStudentProfile']['message']);
      //ExtendedNavigator.of(context).replace(Routes.dashboard);
      Get.to(() => Dashboard());
    }
  }
}


//  List<Group> groups =
            // List<Group>.from(data.map((item) => Group.fromJson(item)));  