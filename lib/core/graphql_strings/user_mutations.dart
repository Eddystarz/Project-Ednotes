class UserMutations {
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

  String resendCode = """
      mutation resendCode(\$email:String!){
        resendCode(email:\$email){
          message,
          value
        }
      }
""";

  String createStudenProfile = """
   mutation createStudentProfile(\$state: String!, \$school: ID!, \$faculty: ID!, \$dept: ID!, \$level: ID!) {
      createStudentProfile(input:{state: \$state, school: \$school, faculty: \$faculty,dept: \$dept,level: \$level}){
      message,
      value,
      student{
        _id,
        user{
            firstName,
            lastName,
            username,
            email,
            phoneNumber,
            userType,
        },
        state,
        school{
          _id
        },
        faculty{
          _id,
        },
        dept{
          _id,
        },
        level{
          _id
        }
      },
      token
    }
  }
""";

  String getStudent = """
query{
student
{
  _id,
  state
  dept{
    _id,
    name
  },
  faculty{
_id,
  name
  },
school{
  _id,
  name
}
  user{
    _id
    userType
    firstName,
   lastName
    username,
    email
  }
}
}
""";
}
