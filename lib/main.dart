import 'package:edtech/Screens/dashboard.dart';
import 'package:edtech/Screens/signup_screen.dart';
import 'package:edtech/Screens/welcome_screen.dart';
import 'package:edtech/graphQLConf.dart';
import 'package:edtech/graphql.dart';
import 'package:flutter/material.dart';
import 'package:edtech/Screens/login_screen.dart';
import 'package:edtech/Screens/change_password_screen.dart';
import 'package:edtech/Screens/verify_opt_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';


// GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() {
  // WidgetsFlutterBinding.ensureInitialized();


  runApp(

        MyApp(),

  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  static final Future<SharedPreferences> prefs = SharedPreferences.getInstance();
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFC50253),
        accentColor: Color(0xFF003049),
        // fontFamily: GoogleFonts.poppins(textStyle: headlin4),
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
      home:  GraphQLProvider(
            client: client,
            child: LoginScreen(),
      ),
      routes: {
        LoginScreen.routeName : (ctx) => LoginScreen(),
        Dashboard.routeName : (ctx) => Dashboard(),
        SignUpScreen.routeName : (ctx) => SignUpScreen(),
      },
    );
  }
}

