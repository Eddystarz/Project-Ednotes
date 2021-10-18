import 'package:auto_route/auto_route.dart';
import 'package:edtech/base_model.dart';
import 'package:edtech/core/models/department.dart';
import 'package:edtech/core/models/error_model.dart';
import 'package:edtech/core/models/faculty.dart';
import 'package:edtech/core/models/level.dart';
import 'package:edtech/core/models/school.dart';
// import 'package:edtech/core/models/success_model.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/core/services/user_service.dart';
// import 'package:edtech/core/services/user_service.dart';
import 'package:edtech/locator.dart';
import 'package:edtech/router/router.gr.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';

class EditProfileViewModel extends BaseModel {
  // final UserService _userService = locator<UserService>();
  final AuthService _authService = locator<AuthService>();
  final UserService _userService = locator<UserService>();
  int numberOfLoads = 0;
  var schoolList = <School?>[];
  var departmentList = <Department?>[];
  var facultyList = <Faculty?>[];
  var levelList = <Level?>[];

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

  updateNumber() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    numberOfLoads = prefs.getInt('loads') ?? 0;
    numberOfLoads++;
    notifyListeners();
    saveNumberOfLoads();
    print(numberOfLoads);
  }

  saveNumberOfLoads() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('loads', numberOfLoads);
  }

  User? get currentUser => _authService.currentUser.user;

  fetchSchools() async {
    final result = await _userService.getSchoolList();
    print(result);
    if (result is ErrorModel) {
      print(result.error.toString());
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
    _authService.currentUser.dept =
        departmentList.firstWhere((element) => element!.name == selectDept);
    _authService.currentUser.faculty =
        facultyList.firstWhere((element) => element!.name == selectedFaculty);
    _authService.currentUser.school =
        schoolList.firstWhere((element) => element!.name == selectedSchool);
    _authService.currentUser.level =
        levelList.firstWhere((element) => element!.name == selectedLevel);
    _authService.currentUser.state = state;
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
        schoolList.firstWhere((element) => element!.name == selectedSchool);
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
    print(payload);
    setLoading(true);
    final result = await _userService.saveProfileEdit(payload);
    if (result is ErrorModel) {
      setLoading(false);
      return showErrorDialogue(
          context: context, message: result.error, onTap: () {});
    } else if (result.data['updateStudentProfile']['value'] == true) {
      setLoading(true);
      setUserHere(state);
      // setLoading(false);
      showDialogue(
          context: context,
          message: result.data['updateStudentProfile']['message'],
          onTap: () {});

      AutoRouter.of(context).replace(const DashboardRoute());
    }
  }

  createStudentProfile(String state, context) async {
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
    print(payload);
    setLoading(true);
    var result = await _userService.createStudentProfile(payload);
    if (result is ErrorModel) {
      setLoading(false);
      showErrorDialogue(
        message: result.error,
        context: context,
        onTap: () {},
      );
    }
    setLoading(false);
    showDialogue(
        message: result.data['createStudentProfile']['message'],
        context: context,
        onTap: () {});
  }
}


//  List<Group> groups =
            // List<Group>.from(data.map((item) => Group.fromJson(item)));  