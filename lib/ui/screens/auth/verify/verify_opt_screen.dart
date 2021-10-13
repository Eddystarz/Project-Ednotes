import 'package:edtech/core/graphql.dart';
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/ui/screens/auth/verify/verify_otp_screen_view_model.dart';
import 'package:edtech/ui/screens/dash_board/dashboard.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:stacked/stacked.dart';

class VerifyEmailOtp extends StatefulWidget {
  const VerifyEmailOtp({Key? key}) : super(key: key);

  @override
  _VerifyEmailOtpState createState() => _VerifyEmailOtpState();
}

class _VerifyEmailOtpState extends State<VerifyEmailOtp> {
  Future<String?> validateOtp(String otp) async {
    await Future.delayed(Duration(milliseconds: 2000));
    if (otp == "1234") {
      return null;
    } else {
      return "The entered Otp is wrong";
    }
  }

  void moveToNextScreen(context) {
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => Dashboard()));
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //  double c_width = MediaQuery.of(context).size.width*0.8;

    return ViewModelBuilder<VerifyOtpScreenViewModel>.reactive(
      viewModelBuilder: () => VerifyOtpScreenViewModel(),
      builder: (context, model, child) => Scaffold(
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
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 20.0, vertical: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    'We have sent you a code,',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 19, bottom: 19),
                    child: Wrap(
                      children: <Widget>[
                        new Container(
                          width: 500,
                          child:
                          Text('If you haven\'t received any code yet,',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17,
                              )),
                        ),
                        Row(
                          children: [
                            Text('please',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 17,
                                )),
                            Mutation(
                              options: MutationOptions(
                                  onCompleted: (result) {
                                    print(result);
                                  },
                                  document:
                                  gql(AuthService().confimEmail)),
                              builder:
                                  (RunMutation? insert, QueryResult? result) =>
                                  MaterialButton(
                                    color: Color(0xFF003049),
                                    elevation: 0,
                                    hoverElevation: 0,
                                    focusElevation: 0,
                                    highlightElevation: 0,
                                    child: Container(
                                      // padding: const EdgeInsets.only(),
                                      child: Row(
                                        // mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            // margin: const EdgeInsets.only( left: 0.0 ),
                                              child: Text(
                                                'Click here',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.bold),
                                              )),
                                        ],
                                      ),
                                    ),
                                    onPressed: () {
                                      insert!(<String, dynamic>{
                                        'token': model.authToken
                                      });
                                      if (result!.hasException) {
                                        print(result.exception.toString());
                                      }
                                    },
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  OTPTextField(
                    length: 5,
                    width: MediaQuery.of(context).size.width,
                    fieldWidth: 50,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.white,
                    ),
                    textFieldAlignment: MainAxisAlignment.spaceAround,
                    // fieldStyle: FieldStyle.underline,
                    onCompleted: (pin) {
                      print("Completed: " + pin);
                    },
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
