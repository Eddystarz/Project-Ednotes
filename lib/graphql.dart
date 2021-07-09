import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:edtech/main.dart';

//  String token = '';
// Future <void>  getToken() async {
//   SharedPreferences prefs = await MyApp.prefs;
//   token = prefs.getString('token');
// }

String userToken = '';
bool tokenState = false;

Future<void> savedToken() async {
  // var test;
  SharedPreferences prefs = await MyApp.prefs;

  // test = prefs.getString('token');
  userToken = prefs.getString('token');
  // print('I am calling token');
  // print(userToken);
  if(userToken != ''){ tokenState = true; }
}

Map<String, String> map = {};

Map<String, String> headersTest(String authTest) {
  if(tokenState == true) {
     map.putIfAbsent('Authorization', () => "Bearer $authTest");
  }

  return map;
} 

// Map<String, String> headers(String authTest,bool tokenRequired) {
//   return {
//    tokenRequired == true ? "Authorization": "Bearer $authTest" : '',
//   };
// }

HttpLink link = HttpLink(
  uri: 'https://ednotes.herokuapp.com/graphql/',
   headers: headersTest(userToken)
);

ValueNotifier<GraphQLClient> client = ValueNotifier(
  GraphQLClient(
    cache: InMemoryCache(),
    link: link,
  ),
);

 String getCountry =  """
      query{
        schools {
          name
        }
        faculties {
          name
        }
        depts {
          name
        }
        levels {
          name
        }
      }
    """;


    String login = """
      mutation signIn(\$email: String!, \$password: String!) {
        login(input: {email: \$email, password: \$password}) {
          token
        }
      }
    """;
  

   String studentSignup = """
    mutation signup(\$firstName: String!, \$lastName: String!, \$phoneNumber: String!, \$username: String!, \$state: String!, \$school: String!, \$dept: String!, \$faculty: String!, \$level: String!, \$email: String!, \$password: String!) {
      studentSignup(input: {email: \$email, password: \$password,firstName: \$firstName, lastName: \$lastName, phoneNumber: \$phoneNumber, username: \$username, state: \$state, school: \$school, dept:\$dept, level: \$level, faculty: \$faculty}) {
        dept
      }
    }
    """;

