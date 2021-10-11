
import 'package:edtech/ui/screens/auth/login/login_screen.dart';
import 'package:edtech/ui/screens/auth/verify/verify_opt_screen.dart';
import "package:flutter/material.dart";

// import "pac"

class ChangePassword extends StatefulWidget {
  @override
  ChangePasswordState createState() {
    return ChangePasswordState();
  }
}

class ChangePasswordState extends State<ChangePassword> {
  // static const routeName = "/login";
  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    // String email, phone;

    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Theme.of(context).accentColor,
          elevation: 0,
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20.0, left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Forgot Password',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0),
              child: Text('Enter Your Affiliated E-mail ro Receive a Codes',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                  )),
            ),
            Form(
              key: _formKey,
              child: Column(children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(top: 20, bottom: 20),
                  child: enailForm(),
                ),
                Padding(
                    padding: EdgeInsets.only(right: 20),
                    child: MaterialButton(
                      color: Colors.black38,
                      child: Container(
                        padding: const EdgeInsets.only(
                            top: 26.0, bottom: 26, right: 70),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                margin: const EdgeInsets.only(left: 75.0),
                                child: Text(
                                  'Next',
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => VerifyEmailOtp()),
                        );
                      },
                    )),
                // Add TextFormFields and ElevatedButton here.
              ]),
            )
          ],
        ),
      ),
    );
  }
}

Widget enailForm() {
  return Padding(
    padding: EdgeInsets.only(top: 14, right: 20, bottom: 10),
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
        if (value!.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
    ),
  );
}

passwordForm() {
  return TextFormField(
    // The validator receives the text that the user has entered.
    decoration: const InputDecoration(
      labelText: 'password',
    ),
    validator: (value) {
      if (value!.isEmpty) {
        return 'Please enter some text';
      }
      return null;
    },
  );
}

submitButton(context) {
  return Padding(
      padding: EdgeInsets.only(right: 20, bottom: 30),
      child: MaterialButton(
        color: Colors.black38,
        child: Container(
          padding: const EdgeInsets.only(top: 26.0, bottom: 26, right: 70),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                  margin: const EdgeInsets.only(left: 75.0),
                  child: Text(
                    'Sign in',
                    style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.normal),
                  ))
            ],
          ),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => LoginScreen()),
          );
        },
      ));
}
