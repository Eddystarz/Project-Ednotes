class AuthMutations {
  String login = """
      mutation signIn(\$email: String!, \$password: String!) {
        login(input: {email: \$email, password: \$password}) {
          message,
          user{
            _id
            firstName,
            lastName,
      username,
      email,
    userType,
    isVerified
    isActive,
    createdAt,
      updatedAt,

          }
        }
      }
    """;

  String studentSignup = """
    mutation signup(\$firstName: String!, \$lastName: String!, \$phoneNumber: String!, \$username: String!, \$email: String!, \$password: String!) {
      signup(input: {firstName: \$firstName, lastName: \$lastName, phoneNumber: \$phoneNumber,username: \$username,email: \$email, password: \$password}) {
        message,value
      }
    }
    """;

  String confimEmail = """mutation confirmEmail(
       \$code: String!
       \$email:String!){
  confirmEmail(code:\$code,email:\$email){
    message,
    value
  }
}""";
}
