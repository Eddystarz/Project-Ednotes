import 'package:edtech/core/graphql.dart';
import 'package:edtech/core/services/auth_service.dart';

//import 'package:edtech/ui/Screens/auth/sign_up/signup_screen.dart';
import 'package:edtech/ui/screens/auth/change_password/change_password_screen.dart';
import 'package:edtech/ui/screens/auth/login/login_view_model.dart';
import 'package:edtech/ui/screens/auth/login/loginprovider.dart';
import 'package:edtech/ui/screens/auth/sign_up/signup_screen.dart';
import "package:flutter/material.dart";
// import 'package:edtech/Screens/dashboard.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';

import 'package:stacked/stacked.dart';

class LoginScreen extends StatefulWidget {
  // static const routeName = "/login";
  @override
  LoginScreenState createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> {
  // String inputValue = new InputValue(text: 'via Dei Giacinti n° 8');
  bool loading = false;
  final _formKey = GlobalKey<FormState>();
  String? message;

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  void displayDialog(context, title, text) => showDialog(
        context: context,
        builder: (context) =>
            AlertDialog(title: Text(title), content: Text(text)),
      );



  @override
  Widget build(BuildContext context) {
    // var argument = ModalRoute.of(context).settings.arguments as String;

    return Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          body: SingleChildScrollView(
            child: Container(
              // height: MediaQuery.of(context).size.height,
                margin: EdgeInsets.only(top: 70.0, left: 20),
                child: Mutation(
                  options: MutationOptions(
                      onCompleted: (result) {
                        print(result);
                        if (result != null){
                          print(result);
                          Provider.of<LoginProvider>(context, listen: false).getLoginResult(result);
                          //model.getLoginResult(result, context);

                        }

                      },
                      document: gql(Provider.of<LoginProvider>(context, listen: false).loginMutation)),
                  builder: (RunMutation? insert, QueryResult? result) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[

                        Text(
                          'Let\'s sign you in,',
                          style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 15.0),
                          child: Text('Welcome Back you\'ve been missed',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                                fontSize: 19,
                              )),
                        ),

                        Padding(
                          padding: EdgeInsets.only(top: 55.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(top: 12, bottom: 2),
                                child: Form(
                                  key: _formKey,
                                  child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          'Login',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.only(
                                              top: 3, bottom: 8),
                                          child: emailForm(),
                                        ),
                                        Text(
                                          'Password',
                                          style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 17,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Padding(
                                            padding: EdgeInsets.only(
                                                top: 3, bottom: 1),
                                            child: passwordForm()),
                                      ]),
                                ),
                              ),
                              Container(
                                  child: GestureDetector(
                                    child: Text(
                                      'Forgot Password?',
                                      style: GoogleFonts.poppins(
                                          fontSize: 16,
                                          color: Colors.white.withOpacity(.5),
                                          fontWeight: FontWeight.normal),
                                    ),
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePassword()),
                                      );
                                    },
                                  )),
                              SizedBox(
                                height: 45,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 19, bottom: 19),
                                child: Wrap(
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Text('Don\'t have an account?',
                                            style: GoogleFonts.poppins(
                                              color: Colors.white,
                                              fontSize: 17,
                                            )),
                                        SizedBox(
                                          width: 5.0,
                                        ),
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      SignUpScreen()),
                                            );
                                          },
                                          child: Text(
                                            'Sign Up!',
                                            style: GoogleFonts.poppins(
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                                fontSize: 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                  padding:
                                  EdgeInsets.only(right: 20, bottom: 30),
                                  child: FlatButton(
                                    minWidth: double.infinity,
                                    color: Colors.black38,
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                        top: 26.0,
                                        bottom: 26,
                                      ),
                                      child: result!.isLoading
                                          ? Container(
                                          height: 20,
                                          width: 20,
                                          child: Center(
                                              child:
                                              CircularProgressIndicator(
                                                backgroundColor: Colors.white,
                                              )))
                                          : Text(
                                        'Sign in',
                                        style: GoogleFonts.poppins(
                                            fontSize: 16,
                                            color: Colors.white,
                                            fontWeight:
                                            FontWeight.normal),
                                      ),
                                    ),
                                    onPressed: () {
                                      if (!_formKey.currentState!.validate()) {
                                        return null;
                                      }
                                      _formKey.currentState!.save();


                                      //model.setIsLoading(true);
                                      insert!(<String, dynamic>{
                                        'email': emailController.text,
                                        'password': passwordController.text
                                      });
                                      // return Text('Welcome');
                                      if (result.hasException) {
                                        print(result.exception.toString());
                                        //model.setIsLoading(false);
                                        // setState(() {
                                        //   loading = false;
                                        //   message =
                                        //       result.exception.toString();
                                        // });
                                        //model.setErrorMessage(
                                        //    result.exception.toString());
                                        // return _errorDialog();
                                        //model.showDialogue(
                                        //    context: context,
                                        //    title: 'Could not sign in',
                                        //    message: model.errorMessage);
                                      }
                                    },
                                  )),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    decoration: new BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(100)),
                                    margin:
                                    EdgeInsets.only(left: 14, right: 14),
                                    padding: EdgeInsets.only(
                                        top: 10.0, bottom: 10.0),
                                    child: ImageIcon(
                                      AssetImage('assets/images/google.png'),
                                      color: Colors.red,
                                    ),
                                    height: 45,
                                    width: 45,
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(100)),
                                    margin:
                                    EdgeInsets.only(left: 14, right: 14),
                                    padding: EdgeInsets.only(
                                        top: 5.0, bottom: 5.0),
                                    child: ImageIcon(
                                      AssetImage(
                                          'assets/images/facebook.png'),
                                      color: Colors.blueAccent,
                                    ),
                                    height: 45,
                                    width: 45,
                                  ),
                                  Container(
                                    decoration: new BoxDecoration(
                                        color: Colors.white,
                                        borderRadius:
                                        BorderRadius.circular(100)),
                                    margin:
                                    EdgeInsets.only(left: 14, right: 14),
                                    padding: EdgeInsets.only(
                                        top: 8.0, bottom: 8.0),
                                    child: ImageIcon(
                                      AssetImage('assets/images/image.png'),
                                      color: Colors.lightBlueAccent,
                                    ),
                                    height: 45,
                                    width: 45,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 50,
                              ),
                              // Image.asset('assets/images/image.png',
                              // height: 100,
                              // width: 100)
                            ],
                          ),
                        ),

                      ],
                    );
                  },
                )),
          )
    );
  }

  emailForm() {
    return Padding(
      padding: EdgeInsets.only(top: 15, right: 20, bottom: 15),
      child: TextFormField(
        // The validator receives the text that the user has entered.
        cursorColor: Colors.black,
        style: GoogleFonts.poppins(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(color: Colors.white),
          hintText: 'Enter Email',
          focusedBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: Color(0xFF003A58),
          filled: true,
          contentPadding: EdgeInsets.only(top: 22, bottom: 22, left: 15),
        ),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your email';
          }
          // if(!RegExp())
          return null;
        },
        onSaved: (String? value) {
          // _email = value;
        },
        controller: emailController,
      ),
    );
  }

  passwordForm() {
    return Padding(
      padding: EdgeInsets.only(top: 14, right: 20, bottom: 10),
      child: TextFormField(
        // The validator receives the text that the user has entered.
        cursorColor: Colors.black,
        style: GoogleFonts.poppins(color: Colors.white),
        decoration: InputDecoration(
          hintStyle: GoogleFonts.poppins(color: Colors.white),
          hintText: 'Password',
          focusedBorder: InputBorder.none,
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide.none),
          fillColor: Color(0xFF003A58),
          filled: true,
          contentPadding: EdgeInsets.only(top: 22, bottom: 22, left: 15),
        ),
        obscureText: true,
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your password';
          }
          return null;
        },
        onSaved: (String? value) {
          // _password = value;
        },
        controller: passwordController,
      ),
    );
  }
}
