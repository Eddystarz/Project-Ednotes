import 'package:edtech/core/graphql.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/core/validators/auth_validator.dart';
//import 'package:edtech/ui/Screens/auth/login/login_screen.dart';
import 'package:edtech/ui/screens/auth/sign_up/sign_up_view_model.dart';
//import 'package:edtech/ui/widgets/auth_widget.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:stacked/stacked.dart';

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
  TextEditingController confirmPassword = TextEditingController();

  String? _email,
      _password,
      _passwordConfirm,
      _userName,
      _number
      ;

  bool loading = false;
  Widget build(BuildContext context) {
    return ViewModelBuilder<SignupViewModel>.reactive(
      viewModelBuilder: () => SignupViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          body: SingleChildScrollView(
            child: GraphQLProvider(
              //client: client,
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
                          //autovalidate: model.autovalidate,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              // Text(
                              //   'First Name',
                              //   style: TextStyle(
                              //       color: Colors.white,
                              //       fontSize: 17,
                              //       fontWeight: FontWeight.bold),
                              // ),
                              /*AuthTextField(
                                  controller: firstNameController,
                                  label: 'First Name',
                                  validator: RegisterValidators().firstName,
                                  onChanged: (val) {},
                                  hintText: 'Enter first name'), */
                              SizedBox(
                                height: 19,
                              ),

                             /* AuthTextField(
                                  controller: lastNameController,
                                  label: 'Last Name',
                                  validator: RegisterValidators().lastName,
                                  onChanged: (val) {},
                                  hintText: 'Enter last name'), */

                              SizedBox(
                                height: 19,
                              ),
                              /*AuthTextField(
                                  controller: emailController,
                                  label: 'E-mail',
                                  validator: RegisterValidators().email,
                                  onChanged: (val) {},
                                  hintText: 'Enter email'), */


                              SizedBox(
                                height: 19,
                              ),

                              /*AuthTextField(
                                  label: 'Username',
                                  controller: usernameController,
                                  hintText: ' Enter username',
                                  onChanged: (val) {},
                                  validator: RegisterValidators().userName), */

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
                                    if (value!.isEmpty) {
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

                              /* AuthTextField(
                                  label: 'Password',
                                  controller: passwordController,
                                  hintText: ' Password',
                                  obscureText: true,
                                  onChanged: (val) {},
                                  validator: RegisterValidators().password), */

                              SizedBox(
                                height: 10,
                              ),

                              /*AuthTextField(
                                label: 'Confirm Password',
                                hintText: ' Confirm Password',
                                validator: (value) => RegisterValidators()
                                    .confirmPassword(passwordController.text,
                                        confirmPassword.text, 'Password'),
                                obscureText: true,
                                controller: confirmPassword,
                                onSaved: (String value) {
                                  _passwordConfirm = value;
                                },
                                onChanged: (val) {},
                              ), */

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
                                        model.getSignupResult(result, context);
                                      },
                                      document: gql(
                                        AuthService().studentSignup,
                                      )),
                                  builder:
                                      (RunMutation? insert, QueryResult? result) {
                                    return MaterialButton(
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
                                                child: model.isLoading
                                                    ? Container(
                                                        height: 20,
                                                        width: 20,
                                                        child: Center(
                                                            child:
                                                                CircularProgressIndicator(
                                                          backgroundColor:
                                                              Colors.white,
                                                        )))
                                                    : Text(
                                                        'Sign up',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            color: Colors.white,
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal),
                                                      ))
                                          ],
                                        ),
                                      ),
                                      onPressed: () {
                                        if (!_formKey.currentState!.validate()) {
                                          model.setAutovalidate(true);
                                          //return true;
                                          return;
                                        }
                                        // _formKey.currentState.save();

                                        model.setIsLoading(true);
                                        print(emailController.text);
                                        print(passwordController.text);
                                        print(usernameController.text);
                                        print(phoneController.text);
                                        print(firstNameController.text);
                                        print(lastNameController.text);

                                        insert!(<String, dynamic>{
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
                                          model.setErrorMessage(
                                              result.exception.toString());
                                          model.showDialogue(
                                              context: context,
                                              title: 'Could not sign you up',
                                              message: model.errorMessage);
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
          )),
    );
  }

  _errorDialog() {
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
