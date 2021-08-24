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
  print('Saved Token opening');
  SharedPreferences prefs = await MyApp.prefs;

  // test = prefs.getString('token');
  // print('I am calling token');
  userToken = prefs.getString('token');

  MyApp.temporaryToken = userToken;
  // print('I am calling token');
  // print(userToken);
  if(userToken != ''){ 
    tokenState = true;
     MyApp.tokenTempState = true;
  }

  print(MyApp.temporaryToken);
}

Map<String, String> map = {};

Map<String, String> headersTest(String authTest) {
  if(MyApp.tokenTempState == true) {
    map.putIfAbsent('Authorization', () => "bearer ${MyApp.temporaryToken}");
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
   headers: headersTest(MyApp.temporaryToken)
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

    String allCourses = """
      query{
        get_all_courses{
          edges{
            name
            description,
            _id,
            semester
          }
        }
      }
    """;

    String singleCourse = """
      query(\$courseId: String!){
        get_single_course(courseId: \$courseId){
          data{
            name
            description,
            _id,
            semester
          }
        }
      }
    """;


    String studentProfile = """
      query{
        student{
          user{
            username,
            firstName
          },
          phoneNumber
        }
      }
    """;

    String fetchSchools = """
      query{
        schools{
          name,
          _id
        }
      }
    """;
    
    String fetchFaculties = """
      query{
        faculties{
          name,
          _id
        }
      }
    """;

    String fetchLevels = """
      query{
        levels{
          name,
          _id
        }
      }
    """;

    String fetchDept = """
      query{
        depts{
          name,
          _id
        }
      }
    """;

    String login = """
      mutation signIn(\$email: String!, \$password: String!) {
        login(input: {email: \$email, password: \$password}) {
          message,
          user{
            firstName
          }
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

