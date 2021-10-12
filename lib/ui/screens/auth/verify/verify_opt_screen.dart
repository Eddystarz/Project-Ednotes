// import 'package:edtech/core/graphql.dart';
// import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/ui/screens/auth/verify/verify_otp_screen_view_model.dart';

import 'package:flutter/material.dart';
import 'package:flutter_countdown_timer/current_remaining_time.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
// import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:stacked/stacked.dart';

class VerifyEmailOtp extends StatefulWidget {
  final bool timerOff;
  final String email;

  const VerifyEmailOtp({Key key, this.timerOff, this.email}) : super(key: key);

  @override
  _VerifyEmailOtpState createState() => _VerifyEmailOtpState();
}

class _VerifyEmailOtpState extends State<VerifyEmailOtp> {
  // Future<String> validateOtp(String otp) async {
  //   await Future.delayed(Duration(milliseconds: 2000));
  //   if (otp == "1234") {
  //     return null;
  //   } else {
  //     return "The entered Otp is wrong";
  //   }
  // }

  // void moveToNextScreen(context) {
  //   Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => Dashboard()));
  // }

  // final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    //  double c_width = MediaQuery.of(context).size.width*0.8;
    final size = MediaQuery.of(context).size;

    return ViewModelBuilder<VerifyOtpScreenViewModel>.reactive(
      onModelReady: (h) {
        if (widget.timerOff) h.setTimmerStopped(true);
      },
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
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
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
                  model.timerStopped
                      ? Padding(
                          padding: EdgeInsets.only(top: 19, bottom: 19),
                          child: Wrap(
                            children: <Widget>[
                              new Container(
                                width: 500,
                                child: Text(
                                    'If you haven\'t received any code yet ,',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                    )),
                              ),
                              Row(
                                children: [
                                  Text('or the code expired please',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 17,
                                      )),
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
                                      model.resendCode(context, widget.email);
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                        )
                      : Container(
                          child: SizedBox(
                          height: size.height * 0.1,
                          child: CountdownTimer(
                            // controller: controller
                            endTime: model.endTime,
                            onEnd: () {
                              model.setTimmerStopped(true);
                            },
                            widgetBuilder: (_, CurrentRemainingTime time) {
                              if (time == null) {
                                return Center(
                                    child: Text('Code sent has expired',
                                        style: TextStyle(
                                            fontSize: 18.0,
                                            color: Colors.white)));
                              }
                              return Center(
                                child: Text('${time.min ?? 0} : ${time.sec}',
                                    style: TextStyle(
                                        fontSize: 18.0, color: Colors.white)),
                              );
                            },
                            textStyle:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                            // onEnd: onEnd,
                            // endTime: endTime,
                          ),
                        )),
                  // OTPTextField(
                  //   length: 6,
                  //   width: MediaQuery.of(context).size.width,
                  //   fieldWidth: 20,
                  //   style: TextStyle(
                  //     fontSize: 17,
                  //     color: Colors.white,
                  //   ),
                  //   onChanged: (val) {

                  //   },
                  //   textFieldAlignment: MainAxisAlignment.spaceAround,
                  //   // fieldStyle: FieldStyle.underline,
                  //   onCompleted: (pin) {
                  //     model.confirmMail(context, widget.email, pin);
                  //     pin = " ";
                  //     model.setTimmerStopped(true);
                  //   },
                  // ),

                  OtpTextField(
                    numberOfFields: 6,
                    styles: [
                      TextStyle(color: Colors.white),
                      TextStyle(color: Colors.white),
                      TextStyle(color: Colors.white),
                      TextStyle(color: Colors.white),
                      TextStyle(color: Colors.white),
                      TextStyle(color: Colors.white),
                    ],
                    borderColor: Color(0xFF512DA8),
                    keyboardType: TextInputType.number,
                    //set to true to show as box or false to show as dash
                    showFieldAsBox: true,
                    //runs when a code is typed in
                    onCodeChanged: (String code) {
                      //handle validation or checks here
                    },
                    //runs when every textfield is filled
                    onSubmit: (String verificationCode) {
                      model.confirmMail(
                          context, widget.email, verificationCode);

                      model.setTimmerStopped(true);
                      // verificationCode = "";
                    }, // end onSubmit
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  model.isLoading
                      ? Center(
                          child: CircularProgressIndicator(
                          backgroundColor: Colors.white,
                        ))
                      : Container()
                ],
              ),
            ),
          )),
    );
  }
}
