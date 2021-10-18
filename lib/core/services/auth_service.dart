import 'dart:convert';

// import 'package:edtech/core/graphql.dart';
// import 'package:edtech/core/models/error_model.dart';
// import 'package:edtech/core/models/success_model.dart';
import 'package:edtech/core/graphql.dart';
import 'package:edtech/core/graphql_strings/auth_mutations.dart';
import 'package:edtech/core/models/error_model.dart';
import 'package:edtech/core/models/student.dart';
import 'package:edtech/core/models/success_model.dart';
import 'package:edtech/core/models/user.dart';
import 'package:edtech/locator.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final GraphQLConfiguration config = locator<GraphQLConfiguration>();

  Student _currentUser = Student();
  AuthToken _authModel = AuthToken(token: '');

  Student get currentUser => _currentUser;
  AuthToken get authModel => _authModel;

  setCurrentUser(User user) {
    _currentUser.user = user;
    print(currentUser);
  }

  setCurrentStudent(Student student) {
    _currentUser = student;
  }

  setAndSaveToken({val, firstname}) async {
    SharedPreferences prefs;
    _authModel = AuthToken.fromJson(val);
    prefs = await SharedPreferences.getInstance();
    prefs.setString('token', authModel.token!);
    var s = json.encode(_currentUser);
    prefs.setString('profile', s);
    //   prefs.setString('token', result['login']['message']);
    prefs.setString('firstname', firstname);
    print("AuthToken from login :::::::" + authModel.token!);
  }

  alreadyLoggedIn() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    var d = prefs.getString('profile');
    Student student = Student.fromJson(json.decode(d!));
    _currentUser = student;
    print(_currentUser);
    var t = prefs.getString('token');
    final AuthToken auth = AuthToken.fromJson(t!);
    print("TOKEN AGBA::::::::: ${auth.token}");
    _authModel = auth;
    print('refresh');
  }

  // getSchoolList() async {
  //   GraphQLConfiguration config = GraphQLConfiguration();
  //   GraphQLClient client = config.clientToQuery();
  //   QueryResult result =
  //       await client.query(QueryOptions(documentNode: gql(fetchSchools)));
  //   if (result.hasException) {
  //     print(result.exception);
  //     return ErrorModel(result.exception);
  //   } else {
  //     print(result.data);
  //     return SuccessModel(result.data);
  //   }
  // }

  // getSchoolList() async {
  //   GraphQLConfiguration config = GraphQLConfiguration();
  //   QueryResult result = await config.gpQuery(queryDocumnet: fetchSchools);
  //   if (result.hasException) {
  //     print(result.exception);
  //     return ErrorModel(result.exception);
  //   } else {
  //     print(result.data);
  //     return SuccessModel(result.data);
  //   }
  // }

  signUp(Map<String, dynamic> payload) async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result = await config.gpMutate(
        mutationDOcument: AuthMutations().studentSignup, data: payload);
    if (result is ErrorModel) {
      // print(result.error.toString());
      return ErrorModel(result.error);
    } else {
      // print(result.data.toString());
      if (result.data['signup']['value'] == false) {
        return ErrorModel(result.data['signup']['message']);
      }

      return SuccessModel(result.data);
    }
  }

  login(Map<String, dynamic> payload) async {
    GraphQLConfiguration config = GraphQLConfiguration();

    var result = await config.gpMutate(
        mutationDOcument: AuthMutations().login, data: payload);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      if (result.data['login']['user'] == null) {
        return ErrorModel(result.data['login']['message']);
      }
      User user = User.fromJson(result.data['login']['user']);
      setCurrentUser(user);
      setAndSaveToken(
          val: result.data['login']['message'],
          firstname: result.data['login']['user']['firstName']);
      return SuccessModel(result.data);
    }
  }

  logout() async {
      GraphQLConfiguration config = GraphQLConfiguration();
    var result =
        await config.gpMutate(mutationDOcument: AuthMutations().logout);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      return SuccessModel(result.data);
    }
  }
}
