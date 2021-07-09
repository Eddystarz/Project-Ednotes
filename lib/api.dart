import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QueryMutation {

  String getCountry(){
    return """
      query{
        countries {
          name,
          code,
        }
      }
    """;
  }

  String getTasksQuery(){
    return """
      query{
        users {
          firstName,
          lastName,
          email
        }
      }
    """;
  }


  String login(String email, String password) {
   return """
      mutation signIn(\$email: String!, \$password: String!){
        login(input: {email: \$email, password: \$password}) {
          token
        }
      }
    """;
  }

   String studentSignup(){
      return """
mutation signup(\$firstName: String!, \$lastName: String!, \$phoneNumber: String!, \$username: String!, \$state: String!, \$school: String!, \$dept: String!, \$faculty: String!, \$level: String!, \$email: String!, \$password: String!) {
  studentSignup(input: {email: \$email, password: \$password,firstName: \$firstName, lastName: \$lastName, phoneNumber: \$phoneNumber, username: \$username, state: \$state, school: \$school, dept:\$dept, level: \$level, faculty: \$faculty}) {
    user,
    state
  }
}
""";
   }

  String updateTaskMutation(){
  return """
mutation UpdateTodo(\$id: ID!, \$completed: Boolean!) {
  updateTodo(id: \$id, completed: \$completed) {
    id
  }
}
""";
  }

}