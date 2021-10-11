import 'dart:async';

import 'package:edtech/ui/screens/splash_screen/spaslh_screnn_view_model.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return ViewModelBuilder<SplashScreenViewModel>.reactive(
      onModelReady: (h) {
        Timer(Duration(seconds: 3), () {
          h.checkLoginStatus(context);
        });
      },
      viewModelBuilder: () => SplashScreenViewModel(),
      builder: (context, model, child) => Scaffold(
          backgroundColor: Theme.of(context).accentColor,
          body: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: size.height * 0.12),
                Expanded(
                  flex: 6,
                  child: Column(
                    children: [
                      Center(
                        child: CircleAvatar(
                            radius: 70,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                                radius: 68,
                                backgroundColor: Theme.of(context).accentColor,
                                child: Text(
                                  'LOGO',
                                  style: TextStyle(
                                      fontSize: 30, color: Colors.white),
                                ))),
                      ),
                      SizedBox(
                        height: size.height * 0.06,
                      ),
                      Text(
                        'Welcome to Ednotes!',
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                      SizedBox(
                        height: size.height * 0.03,
                      ),
                      Text('Your Ultimate Learning',
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text('Assitance',
                          style: TextStyle(fontSize: 20, color: Colors.grey)),
                    ],
                  ),
                ),
                Expanded(flex: 3, child: Container()),
                Expanded(
                    flex: 1,
                    child: Text('\u00a9 Ednotes 2020',
                        style: TextStyle(color: Colors.grey)))
              ])),
    );
  }
}
