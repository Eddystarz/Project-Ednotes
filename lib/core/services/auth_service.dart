import 'dart:convert';

// import 'package:edtech/core/graphql.dart';
// import 'package:edtech/core/models/error_model.dart';
// import 'package:edtech/core/models/success_model.dart';
import 'package:edtech/core/models/user.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  User? _currentUser;
  AuthToken _authModel = AuthToken();

  User? get currentUser => _currentUser;
  AuthToken get authModel => _authModel;

  setCurrentUser(User user) {
    _currentUser = user;
    print(currentUser);
  }

  setAndSaveToken({val, firstname}) async {
    SharedPreferences prefs;
    _authModel = AuthToken.fromJson(val);
    prefs = await SharedPreferences.getInstance();
    prefs.setString('token', authModel.token!);
    var s = json.encode(_currentUser);
    await prefs.setString('profile', s);
    //   prefs.setString('token', result['login']['message']);
    prefs.setString('firstname', firstname);
    print("AuthToken from login :::::::" + authModel.token!);
  }

  alreadyLoggedIn() async {
    SharedPreferences prefs;
    prefs = await SharedPreferences.getInstance();
    var d = prefs.getString('profile');
    User user = User.fromJson(json.decode(d!));
    _currentUser = user;
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



  String login = """
      mutation signIn(\$email: String!, \$password: String!) {
        login(input: {email: \$email, password: \$password}) {
          message,
          value
        }
      }
    """;

  String studentSignup = """
    mutation signup(\$firstName: String!, \$lastName: String!, \$phoneNumber: String!, \$username: String!, \$email: String!, \$password: String!) {
      studentSignup(input: {firstName: \$firstName, lastName: \$lastName, phoneNumber: \$phoneNumber,username: \$username,email: \$email, password: \$password}) {
        message,value
      }
    }
    """;

  String confimEmail = """mutation confirmEmail(
       \$token: String!
)
{
  confirmEmail(token:\$token)
   
  
}""";
}
