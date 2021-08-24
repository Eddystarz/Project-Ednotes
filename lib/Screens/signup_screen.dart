import 'package:edtech/Screens/dashboard.dart';
import 'package:edtech/graphql.dart';
import 'package:flutter/material.dart';
import 'package:edtech/Screens/login_screen.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

class SignUpScreen extends StatefulWidget {
  static const routeName = "/register";
  @override
  SignUpScreenState createState() {
    return SignUpScreenState();
  }
}

class SignUpScreenState extends State<SignUpScreen> {
  @override
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController firstNameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  String _email,
      _password,
      _passwordConfirm,
      _userName,
      school,
      state,
      faculty,
      department,
      gender,
      level,
      _number,
      _dateOfBirth;

      bool loading = false;
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).accentColor,
        body: SingleChildScrollView(
          child: GraphQLProvider(
            client: client,
            child: Container(
              margin: EdgeInsets.only(top: 70.0, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'Create an account',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 55.0),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'First Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Enter First Name',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none),
                                  fillColor: Color(0xFF003A58),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 22, bottom: 22, left: 15),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your First name';
                                  }
                                  // if(!RegExp())
                                  return null;
                                },
                                onSaved: (String value) {
                                  _email = value;
                                },
                                controller: firstNameController,
                              ),
                            ),
                            SizedBox(
                              height: 19,
                            ),
                            Text(
                              'Last Name',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Enter Last Name',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none),
                                  fillColor: Color(0xFF003A58),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 22, bottom: 22, left: 15),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your Last name';
                                  }
                                  // if(!RegExp())
                                  return null;
                                },
                                onSaved: (String value) {
                                  _email = value;
                                },
                                controller: lastNameController,
                              ),
                            ),
                            SizedBox(
                              height: 19,
                            ),
                            Text(
                              'E-mail',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Enter Email',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none),
                                  fillColor: Color(0xFF003A58),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 22, bottom: 22, left: 15),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  // if(!RegExp())
                                  return null;
                                },
                                onSaved: (String value) {
                                  _email = value;
                                },
                                controller: emailController,
                              ),
                            ),
                            Text(
                              'Username',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 10, bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                // keyboardType: ,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Username',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none),
                                  fillColor: Color(0xFF003A58),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 22, bottom: 22, left: 15),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  // if(!RegExp())
                                  return null;
                                },
                                onSaved: (String value) {
                                  _userName = value;
                                },
                                controller: usernameController,
                              ),
                            ),
                            Text(
                              'Phone Number',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 14, bottom: 35),
                              child: IntlPhoneField(
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: '80******',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none),
                                  fillColor: Color(0xFF003A58),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 22, bottom: 22, left: 15),
                                ),
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your phone number';
                                  }
                                  // if(!RegExp())
                                  return null;
                                },
                                onChanged: (phone) {
                                  _number = phone.completeNumber;
                                  print(phone.completeNumber);
                                },
                                controller: phoneController,
                              ),
                            ),
                            // Text(
                            //   'Date Of Birth',
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 17,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // Container(
                            //   padding: EdgeInsets.only(top: 20, bottom: 20),
                            //   child: TextFormField(
                            //     // The validator receives the text that the user has entered.
                            //     cursorColor: Colors.black,
                            //     style: TextStyle(color: Colors.white),
                            //     decoration: InputDecoration(
                            //       hintStyle: TextStyle(color: Colors.white),
                            //       hintText: '21 December 1991',
                            //       focusedBorder: InputBorder.none,
                            //       enabledBorder: OutlineInputBorder(
                            //           borderRadius: BorderRadius.circular(5),
                            //           borderSide: BorderSide.none),
                            //       fillColor: Color(0xFF003A58),
                            //       filled: true,
                            //       contentPadding: EdgeInsets.only(
                            //           top: 22, bottom: 22, left: 15),
                            //     ),
                            //     validator: (value) {
                            //       if (value.isEmpty) {
                            //         return 'Please enter your date of birth';
                            //       }
                            //       // if(!RegExp())
                            //       return null;
                            //     },
                            //     onSaved: (String value) {
                            //       _dateOfBirth = value;
                            //     },
                            //   ),
                            // ),
                            // Text(
                            //   'Gender',
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 17,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // Container(
                            //     padding: EdgeInsets.only(
                            //         top: 15, bottom: 10, right: 20, left: 12),
                            //     width: MediaQuery.of(context).size.width,
                            //     height: 60,
                            //     decoration:
                            //         BoxDecoration(color: Color(0xFF003A58)),
                            //     child: DropdownButtonHideUnderline(
                            //       child: new DropdownButton<String>(
                            //         isExpanded: true,
                            //         value: gender,
                            //         iconSize: 15,
                            //         icon: Icon(Icons.keyboard_arrow_down_sharp),
                            //         // itemHeight: 300,
                            //         elevation: 0,
                            //         style: TextStyle(color: Colors.white),
                            //         dropdownColor:
                            //             Theme.of(context).accentColor,
                            //         // style: new TextStyle(
                            //         //   color: Colors.white,
                            //         // ),
                            //         items: <String>[
                            //           'Female',
                            //           'Male',
                            //           'Not specified'
                            //         ].map((String value) {
                            //           return new DropdownMenuItem<String>(
                            //             value: value,
                            //             child: new Text(
                            //               value,
                            //               style: TextStyle(color: Colors.white),
                            //             ),
                            //           );
                            //         }).toList(),
                            //         onChanged: (newValue) {
                            //           setState(() {
                            //             gender = newValue;
                            //           });
                            //         },
                            //       ),
                            //     )),
                            // SizedBox(
                            //   height: 19,
                            // ),
                            Text(
                              'Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 14, bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Password',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none),
                                  fillColor: Color(0xFF003A58),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 22, bottom: 22, left: 15),
                                ),
                                obscureText: true,
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  return null;
                                },
                                onSaved: (String value) {
                                  _password = value;
                                },
                                controller: passwordController,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Confirm Password',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 14, bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                style: TextStyle(color: Colors.white),
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: 'Password',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none),
                                  fillColor: Color(0xFF003A58),
                                  filled: true,
                                  contentPadding: EdgeInsets.only(
                                      top: 22, bottom: 22, left: 15),
                                ),
                                obscureText: true,
                                // validator: (value) {
                                //   if (value != _password) {
                                //     return 'Password does not match';
                                //   }
                                //   return null;
                                // },
                                onSaved: (String value) {
                                  _passwordConfirm = value;
                                },
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            // Text(
                            //   'School',
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 17,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // Container(
                            //     padding: EdgeInsets.only(
                            //         top: 15, bottom: 10, right: 20, left: 12),
                            //     width: MediaQuery.of(context).size.width,
                            //     height: 60,
                            //     decoration:
                            //         BoxDecoration(color: Color(0xFF003A58)),
                            //     child: DropdownButtonHideUnderline(
                            //       child: new DropdownButton<String>(
                            //         isExpanded: true,
                            //         value: school,
                            //         iconSize: 15,
                            //         icon: Icon(Icons.keyboard_arrow_down_sharp),
                            //         // itemHeight: 300,
                            //         elevation: 0,
                            //         style: TextStyle(color: Colors.white),
                            //         dropdownColor:
                            //             Theme.of(context).accentColor,
                            //         items: <String>[
                            //           'University of Lagos',
                            //           'Obafemi Awolowo University'
                            //         ].map((String value) {
                            //           return new DropdownMenuItem<String>(
                            //             value: value,
                            //             child: new Text(
                            //               value,
                            //               style: TextStyle(color: Colors.white),
                            //             ),
                            //           );
                            //         }).toList(),
                            //         onChanged: (newValue) {
                            //           setState(() {
                            //             school = newValue;
                            //           });
                            //         },
                            //       ),
                            //     )),
                            // SizedBox(
                            //   height: 19,
                            // ),
                            // Text(
                            //   'Department',
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 17,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // Container(
                            //     padding: EdgeInsets.only(
                            //         top: 15, bottom: 10, right: 20, left: 12),
                            //     width: MediaQuery.of(context).size.width,
                            //     height: 60,
                            //     decoration:
                            //         BoxDecoration(color: Color(0xFF003A58)),
                            //     child: DropdownButtonHideUnderline(
                            //       child: new DropdownButton<String>(
                            //         isExpanded: true,
                            //         value: department,
                            //         iconSize: 15,
                            //         icon: Icon(Icons.keyboard_arrow_down_sharp),
                            //         // itemHeight: 300,
                            //         elevation: 0,
                            //         style: TextStyle(color: Colors.white),
                            //         dropdownColor:
                            //             Theme.of(context).accentColor,
                            //         items: <String>[
                            //           'Physics',
                            //           'Chemistry',
                            //           'Mechanical Engineering'
                            //         ].map((String value) {
                            //           return new DropdownMenuItem<String>(
                            //             value: value,
                            //             child: new Text(
                            //               value,
                            //               style: TextStyle(color: Colors.white),
                            //             ),
                            //           );
                            //         }).toList(),
                            //         onChanged: (newValue) {
                            //           setState(() {
                            //             department = newValue;
                            //           });
                            //         },
                            //       ),
                            //     )),
                            SizedBox(
                              height: 19,
                            ),
                            // Text(
                            //   'Level Of Study',
                            //   style: TextStyle(
                            //       color: Colors.white,
                            //       fontSize: 17,
                            //       fontWeight: FontWeight.bold),
                            // ),
                            // Container(
                            //     padding: EdgeInsets.only(
                            //         top: 15, bottom: 10, right: 20, left: 12),
                            //     width: MediaQuery.of(context).size.width,
                            //     height: 60,
                            //     decoration:
                            //         BoxDecoration(color: Color(0xFF003A58)),
                            //     child: DropdownButtonHideUnderline(
                            //       child: new DropdownButton<String>(
                            //         isExpanded: true,
                            //         value: level,
                            //         iconSize: 15,
                            //         icon: Icon(Icons.keyboard_arrow_down_sharp),
                            //         // itemHeight: 300,
                            //         elevation: 0,
                            //         style: TextStyle(color: Colors.white),
                            //         dropdownColor:
                            //             Theme.of(context).accentColor,
                            //         items: <String>[
                            //           '100',
                            //           '200',
                            //           '300',
                            //           '400',
                            //           '500',
                            //           '600'
                            //         ].map((String value) {
                            //           return new DropdownMenuItem<String>(
                            //             value: value,
                            //             child: new Text(
                            //               value,
                            //               style: TextStyle(color: Colors.white),
                            //             ),
                            //           );
                            //         }).toList(),
                            //         onChanged: (newValue) {
                            //           setState(() {
                            //             level = newValue;
                            //           });
                            //         },
                            //       ),
                            //     )),
                            // SizedBox(
                            //   height: 19,
                            // ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 10),
                              child: Mutation(
                                options: MutationOptions(
                                    onCompleted: (result) {
                                      print(result);
                                      setState(() {
                                        loading = false;
                                      });
                                      if (result != null) {
                                        print(result);
                                        Navigator.of(context)
                                          .pushReplacementNamed(LoginScreen.routeName);
                                      }
                                    },
                                    documentNode: gql(
                                  studentSignup,
                                )),
                                builder:
                                    (RunMutation insert, QueryResult result) {
                                  return RaisedButton(
                                    color: Colors.black38,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          top: 26.0, bottom: 26, right: 70),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                              margin: const EdgeInsets.only(
                                                  left: 75.0),
                                              child: loading ? 
                                              Container(
                                                height: 20,
                                                width: 20,
                                                child: Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                  backgroundColor: Colors.white,
                                              )))

                                              : Text(
                                                'Sign up',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              )
                                            )
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                              
                                      if (!_formKey.currentState.validate()) {
                                        return true;
                                      }
                                      _formKey.currentState.save();

                                      setState(() {
                                        loading = true;
                                      });
                                      print(emailController.text);
                                      print(passwordController.text);
                                      print(usernameController.text);
                                      print(phoneController.text);
                                      print(firstNameController.text);
                                      print(lastNameController.text);
                                    
                                      insert(<String, dynamic>{
                                        'email': emailController.text,
                                        'password': passwordController.text,
                                        'username': usernameController.text,
                                        'phoneNumber': phoneController.text,
                                        'firstName': firstNameController.text,
                                        'lastName': lastNameController.text,
                                      });

                                      if (result != null &&
                                          result.hasException) {
                                        print(result.exception.toString());
                                        return _errorDialog();
                                      }

                                      if (result != null) {
                                        print('atleast it log');
                                        print(result);
                                        // Navigator.of(context)
                                        //     .pushNamed(LoginScreen.routeName);
                                      }
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //       builder: (context) => Dashboard()),
                                      // );
                                    },
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 19,
                            ),
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ),
        ));
  }

  Widget _errorDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Email has been taken'),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('The email already exist, please use another email.'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: Text('Close'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        });
  }
}

Widget EmailForm(lastNameController) {
  return Padding(
    padding: EdgeInsets.only(top: 14, bottom: 10),
    child: TextFormField(
      // The validator receives the text that the user has entered.
      cursorColor: Colors.black,
      // keyboardType: ,
      controller: lastNameController,
      style: TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Enter Email',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          fillColor: Color(0xFF003A58),
          filled: true
          // contentPadding: new EdgeInsets.fromLTRB(30.0, 45.0, 20.0, 10.0),
          ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  );
}

Widget UsernameForm() {
  return Padding(
    padding: EdgeInsets.only(top: 14, bottom: 10),
    child: TextFormField(
      // The validator receives the text that the user has entered.
      cursorColor: Colors.black,
      // keyboardType: ,
      style: TextStyle(color: Colors.white),
      decoration: const InputDecoration(
          labelStyle: TextStyle(color: Colors.white),
          labelText: 'Enter Email',
          border: InputBorder.none,
          focusedBorder: InputBorder.none,
          enabledBorder: InputBorder.none,
          fillColor: Color(0xFF003A58),
          filled: true
          // contentPadding: new EdgeInsets.fromLTRB(30.0, 45.0, 20.0, 10.0),
          ),
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  );
}
