import 'package:edtech/core/graphql.dart';
import 'package:edtech/core/models/error_model.dart';
import 'package:edtech/core/models/success_model.dart';

class UserService {
  getSchoolList() async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result = await config.gpQuery(queryDocumnet: fetchSchools);
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
    var result = await config.gpQuery(queryDocumnet: fetchFaculties);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data);
      return SuccessModel(result.data);
    }
  }

  getDepartment() async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result = await config.gpQuery(queryDocumnet: fetchDept);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data);
      return SuccessModel(result.data);
    }
  }

  getLevel() async {
    GraphQLConfiguration config = GraphQLConfiguration();
    var result = await config.gpQuery(queryDocumnet: fetchLevels);
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
        mutationDOcument: editStudentProfile, data: payload);
    if (result is ErrorModel) {
      return ErrorModel(result.error);
    } else {
      print(result.data);
      return SuccessModel(result.data);
    }
  }

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
          _id,
          departments{
            name,
            _id,
            faculty{
              name,
              _id
              }
          },
          faculties{
            name,
            _id,
          }
          levels{
            name,
            _id,
              dept{
              name,
              _id
            }
          }
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

//     state: String
// school: ID
// faculty: ID
// dept: ID
// level: ID

  String editStudentProfile = """
    mutation editProfile(\$state: String!, \$school: ID!, \$faculty: ID!, \$dept: ID!, \$level: ID!) {
      updateStudentProfile(state: \$state, school: \$school, faculty: \$faculty,dept: \$dept,level: \$level) {
        message,value,student{
         
          state
        }
      }
    }
    """;
}
