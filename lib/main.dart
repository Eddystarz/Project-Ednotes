import 'package:edtech/core/graphql.dart';
// import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';
import 'package:edtech/ui/screens/auth/login/login_screen.dart';
import 'package:edtech/ui/screens/auth/login/loginprovider.dart';
import 'package:edtech/ui/screens/courses/courses_screen/courseprovider.dart';
import 'package:edtech/ui/screens/courses/ttsprovider.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:provider/provider.dart';
// import 'package:edtech/Screens/login_screen.dart';
// import 'package:edtech/Screens/change_password_screen.dart';
// import 'package:edtech/Screens/verify_opt_screen.dart';
// import 'package:google_fonts/google_fonts.dart';

import 'package:shared_preferences/shared_preferences.dart';
//import 'package:edtech/router/router.gr.dart' as app_router;

// GraphQLConfiguration graphQLConfiguration = GraphQLConfiguration();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  await initHiveForFlutter();

  setUp();

  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (context) => LoginProvider()),
        ChangeNotifierProvider(create: (context) => CourseProvider()),
        ChangeNotifierProvider(create: (context) => TTSProvider()),

      ],
        child: MyApp(),
      )
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  static final Future<SharedPreferences> prefs =
      SharedPreferences.getInstance();

  static String temporaryToken = '';

  static bool tokenTempState = false;

  const MyApp({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    
    return GraphQLProvider(
      client: GraphQLConfiguration.initailizeClient(),
      child: CacheProvider(
        child: GetMaterialApp(
          theme: ThemeData(
            primaryColor: Color(0xFFC50253),
            accentColor: Color(0xFF003049),
            // fontFamily: GoogleFonts.poppins(textStyle: headlin4),
            visualDensity: VisualDensity.adaptivePlatformDensity,

          ),
          debugShowCheckedModeBanner: false,
          home: LoginScreen(),
          // home:  GraphQLProvider(
          //       client: client,
          //       child: LoginScreen(),
          // ),

          //builder: ExtendedNavigator(router: app_router.Router()),
        ),
      ),
    );
  }
}
