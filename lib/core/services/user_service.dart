import 'package:edtech/core/graphql.dart';
import 'package:edtech/core/graphql_strings/auth_mutations.dart';
import 'package:edtech/core/graphql_strings/user_mutations.dart';
import 'package:edtech/core/models/error_model.dart';
import 'package:edtech/core/models/success_model.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';

class UserService {
  final AuthService _authService = locator<AuthService>();

  getSchoolList() async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result =
        await config.gpQuery(queryDocumnet: UserMutations().fetchSchools);
    if (result is ErrorModel) {
      print(result.error);
      return ErrorModel(result.error);
    } else {
      print(result.data);
      return SuccessModel(result.data);
    }
  }

  getFaculty() async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result =
        await config.gpQuery(queryDocumnet: UserMutations().fetchFaculties);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data);
      return SuccessModel(result.data);
    }
  }

  getDepartment() async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result = await config.gpQuery(queryDocumnet: UserMutations().fetchDept);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data);
      return SuccessModel(result.data);
    }
  }

  getLevel() async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result =
        await config.gpQuery(queryDocumnet: UserMutations().fetchLevels);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data);
      return SuccessModel(result.data);
    }
  }

  saveProfileEdit(Map<String, dynamic> payload) async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result = await config.gpMutate(
        mutationDOcument: UserMutations().editStudentProfile, data: payload);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data);
      return SuccessModel(result.data);
    }
  }

  resendCode(Map<String, dynamic> payload) async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result = await config.gpMutate(
        mutationDOcument: UserMutations().resendCode, data: payload);

    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      return SuccessModel(result.data);
    }
  }

  confirmMail(Map<String, dynamic> payload) async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result = await config.gpMutate(
        mutationDOcument: AuthMutations().confimEmail, data: payload);

    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      if (result.data['confirmEmail']['value'] == false) {
        return ErrorModel(result.data['confirmEmail']['message']);
      }
      return SuccessModel(result.data);
    }
  }

  createStudentProfile(Map<String, dynamic> payload) async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result = await config.gpMutate(
        mutationDOcument: UserMutations().createStudenProfile, data: payload);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      if (result.data['createStudentProfile']['value'] == false) {
        return ErrorModel(result.data['createStudentProfile']['message']);
      }
      var resultData = result.data['createStudentProfile'];
      _authService
          .setCurrentStudent(resultData['student']);
      _authService.setAndSaveToken(val:resultData['token']);
      return SuccessModel(result.data);
    }
  }
}
