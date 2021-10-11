
import 'package:edtech/core/services/auth_service.dart';
import 'package:edtech/locator.dart';
import 'package:edtech/main.dart';
//import 'package:edtech/router/router.gr.dart';

import 'package:edtech/ui/screens/assistance/assistance_screen.dart';
import 'package:edtech/ui/screens/auth/login/loginprovider.dart';
import 'package:edtech/ui/screens/cgpa/cgpa_screen.dart';
import 'package:edtech/ui/screens/challenge/challenge_screen.dart';
import 'package:edtech/ui/screens/courses/courses_screen/course_screen.dart';
import 'package:edtech/ui/screens/courses/view_course_screen.dart';

import 'package:edtech/ui/screens/dash_board/dash_board_view_model.dart';
import 'package:edtech/ui/screens/forum/forum_screen.dart';
import 'package:edtech/ui/screens/memory_lab/memory_lab_screen.dart';
import 'package:edtech/ui/screens/profile/profile.dart';
import 'package:edtech/ui/screens/reward/reward_screen.dart';
// import 'package:edtech/ui/screens/settings/settings_screen.dart';
import 'package:edtech/ui/screens/settings/support_screen.dart';
import 'package:edtech/ui/screens/stories/ed_story_screen.dart';
import 'package:edtech/ui/screens/subscription/subscription_screen.dart';
import 'package:edtech/ui/screens/test/TestScreen.dart';
import 'package:edtech/ui/screens/time_table/timetable_screen.dart';
import 'package:edtech/ui/screens/voice_note/voice_screen.dart';
import 'package:edtech/ui/screens/wallet/wallet_screen.dart';
import "package:flutter/material.dart";
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class Dashboard extends StatefulWidget {
  static const routeName = "/dashboard";
  @override
  DashboardState createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  final AuthService authService = locator<AuthService>();

  String firstname = '';

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // fetchLoggedInUser();
  }

  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    //model.fetchLoggedInUser();
    var currentUser = Provider.of<LoginProvider>(context, listen: true).currentUser;

    return Scaffold(
      // backgroundColor: Colors.blue[900],
        key: _scaffoldKey,
        backgroundColor: Color(0xFFF9F9F9),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(
            child: Text(
              ' Ednotes',
              textAlign: TextAlign.center,
              style: GoogleFonts.poppins(color: Colors.black),
            ),
          ),
          leading: new IconButton(
            icon: ImageIcon(
              AssetImage('assets/images/menu.png'),
              color: Theme.of(context).primaryColor,
            ),
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
          ),
          backgroundColor: Colors.white,
          iconTheme: IconThemeData(color: Colors.black),
          // leading: Icon(Icons.menu, color: Colors.black)
        ),
        body: SingleChildScrollView(
          child: Container(
            margin:
            EdgeInsets.only(top: 20.0, left: 10, right: 10, bottom: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Hey, ${Provider.of<LoginProvider>(context, listen: true).currentUser != null ? Provider.of<LoginProvider>(context, listen: true).currentUser!.firstName : ""}",
                  //'Hey, ${model.firstname}',
                  style: GoogleFonts.poppins(fontSize: 25),
                ),
                SizedBox(height: 10),
                searchWidget(),
                SizedBox(height: 20),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    // scrollDirection: Axis.horizontal,
                    children: <Widget>[
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => WalletScreen()));
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color(0xFFCCCCCC),
                                      blurRadius: 3.0,
                                      offset: Offset(0, 3)),
                                ],
                              ),
                              margin: EdgeInsets.only(left: 14, right: 14),
                              padding: EdgeInsets.only(
                                  top: 17.0,
                                  bottom: 17.0,
                                  right: 17,
                                  left: 17),
                              child: ImageIcon(
                                AssetImage('assets/images/wallet_2.png'),
                                color: Theme.of(context).primaryColor,
                              ),
                              height: 65,
                              width: 65,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Wallet')
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SupportScreen()));
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color(0xFFCCCCCC),
                                      blurRadius: 3.0,
                                      offset: Offset(0, 3)),
                                ],
                              ),
                              margin: EdgeInsets.only(left: 14, right: 14),
                              padding: EdgeInsets.only(
                                  top: 17.0,
                                  bottom: 17.0,
                                  right: 17,
                                  left: 17),
                              child: ImageIcon(
                                AssetImage('assets/images/headphones.png'),
                                color: Theme.of(context).primaryColor,
                              ),
                              height: 65,
                              width: 65,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('Support')
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RewardScreen()));
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color(0xFFCCCCCC),
                                      blurRadius: 3.0,
                                      offset: Offset(0, 3)),
                                ],
                              ),
                              margin: EdgeInsets.only(left: 14, right: 14),
                              padding: EdgeInsets.only(
                                  top: 17.0,
                                  bottom: 17.0,
                                  right: 17,
                                  left: 17),
                              child: ImageIcon(
                                AssetImage('assets/images/r-p.png'),
                                color: Theme.of(context).primaryColor,
                              ),
                              height: 65,
                              width: 65,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('R.P')
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RewardScreen()));
                        },
                        child: Column(
                          children: [
                            Container(
                              decoration: new BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  new BoxShadow(
                                      color: Color(0xFFCCCCCC),
                                      blurRadius: 3.0,
                                      offset: Offset(0, 3)),
                                ],
                              ),
                              margin: EdgeInsets.only(left: 14, right: 14),
                              padding: EdgeInsets.only(
                                  top: 17.0,
                                  bottom: 17.0,
                                  right: 17,
                                  left: 17),
                              child: ImageIcon(
                                AssetImage('assets/images/news.png'),
                                color: Theme.of(context).primaryColor,
                              ),
                              height: 65,
                              width: 65,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text('News')
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFFCCCCCC),
                                    blurRadius: 3.0,
                                    offset: Offset(0, 3)),
                              ],
                            ),
                            margin: EdgeInsets.only(left: 14, right: 14),
                            padding: EdgeInsets.only(
                                top: 17.0, bottom: 17.0, right: 17, left: 17),
                            child: ImageIcon(
                              AssetImage('assets/images/news.png'),
                              color: Theme.of(context).primaryColor,
                            ),
                            height: 65,
                            width: 65,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text('NTFN')
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, left: 15.0, bottom: 10, right: 15),
                        child: Column(
                          children: [
                            // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                            Image(
                              image: AssetImage('assets/images/course.png'),
                              height: 40,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: 80,
                              child: Wrap(
                                children: [
                                  Text(
                                    'View Courses',
                                    style: GoogleFonts.poppins(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            GestureDetector(
                              child: Container(
                                  padding:
                                  EdgeInsets.only(top: 13, bottom: 13),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(
                                    child: Text(
                                      'view',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              onTap: () {
                                Get.to(() => CourseScreen());
                                //ExtendedNavigator.of(context).push(Routes.courseScreen);
                              },
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, left: 15.0, bottom: 10, right: 15),
                        child: Column(
                          children: [
                            // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                            Image(
                              image:
                              AssetImage('assets/images/voicenote.png'),
                              height: 40,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: 80,
                              child: Wrap(
                                children: [
                                  Text(
                                    'Voice notes',
                                    style: GoogleFonts.poppins(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            GestureDetector(
                              child: Container(
                                  padding:
                                  EdgeInsets.only(top: 13, bottom: 13),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(
                                    child: Text(
                                      'view',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => VoiceScreen()));
                              },
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, left: 15.0, bottom: 10, right: 15),
                        child: Column(
                          children: [
                            // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                            Image(
                              image: AssetImage(
                                  'assets/images/question-mark.png'),
                              height: 40,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: 140,
                              child: Wrap(
                                children: [
                                  Text(
                                    'Past Questions and Answers',
                                    style: GoogleFonts.poppins(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            GestureDetector(
                              child: Container(
                                  padding:
                                  EdgeInsets.only(top: 13, bottom: 13),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(
                                    child: Text(
                                      'view',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              onTap: () {
                                // Navigator.push(context,
                                //     MaterialPageRoute(builder: (context) => CourseScreen())
                                // );
                              },
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, left: 15.0, bottom: 10, right: 15),
                        child: Column(
                          children: [
                            // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                            Image(
                              image: AssetImage('assets/images/exam (1).png'),
                              height: 40,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: 80,
                              child: Wrap(
                                children: [
                                  Text(
                                    'Take A test',
                                    style: GoogleFonts.poppins(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            GestureDetector(
                              child: Container(
                                  padding:
                                  EdgeInsets.only(top: 13, bottom: 13),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(
                                    child: Text(
                                      'view',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => TestScreen()));
                              },
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 26, left: 15.0, bottom: 26, right: 15),
                        // height: 170,
                        child: Column(
                          children: [
                            // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                            Image(
                              image: AssetImage('assets/images/lab.png'),
                              height: 40,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: 140,
                              child: Wrap(
                                children: [
                                  Text(
                                    'Memory Lab',
                                    style: GoogleFonts.poppins(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 29,
                            ),
                            GestureDetector(
                              child: Container(
                                  padding:
                                  EdgeInsets.only(top: 13, bottom: 13),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(
                                    child: Text(
                                      'view',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            MemoryLabScreen()));
                              },
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 9,
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(
                            top: 10, left: 15.0, bottom: 10, right: 15),
                        child: Column(
                          children: [
                            // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                            Image(
                              image:
                              AssetImage('assets/images/challenge.png'),
                              height: 40,
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            Container(
                              width: 80,
                              child: Wrap(
                                children: [
                                  Text(
                                    'Take A Challenge',
                                    style: GoogleFonts.poppins(fontSize: 17),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 13,
                            ),
                            GestureDetector(
                              child: Container(
                                  padding:
                                  EdgeInsets.only(top: 13, bottom: 13),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(7)),
                                  child: Center(
                                    child: Text(
                                      'view',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            ChallengeScreen()));
                              },
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                Container(
                  padding: EdgeInsets.only(
                      top: 10, left: 15.0, bottom: 10, right: 15),
                  width: 190,
                  child: Column(
                    children: [
                      // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                      Image(
                        image: AssetImage('assets/images/chat-group.png'),
                        height: 40,
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      Container(
                        width: 80,
                        child: Wrap(
                          children: [
                            Text(
                              'Check out Forum',
                              style: GoogleFonts.poppins(fontSize: 17),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 13,
                      ),
                      GestureDetector(
                        child: Container(
                            padding: EdgeInsets.only(top: 13, bottom: 13),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Theme.of(context).accentColor,
                                borderRadius: BorderRadius.circular(7)),
                            child: Center(
                              child: Text(
                                'view',
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                ),
                              ),
                            )),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ForumScreen()));
                        },
                      )
                    ],
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  decoration: BoxDecoration(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        drawer: Container(
          width: 300,
          child: Drawer(
            child: Material(
              color: Theme.of(context).accentColor,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListView(
                  children: <Widget>[
                    SizedBox(height: size.height * 0.1),
                    Container(
                        height: size.height * 0.2,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: size.height * 0.08,
                                width: size.width * 0.18,
                                child: Card(
                                    child: Container(
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                              // fit: BoxFit.cover,
                                                image: AssetImage(
                                                  'assets/images/profilepicture.jpg',
                                                )))),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                        BorderRadius.circular(15))),
                              ),
                              SizedBox(height: size.height * 0.02),
                              Text(
                                "${currentUser != null ?  currentUser.firstName : ""}",
                                  //'${model.user.firstName} ${model.user.lastName}',
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600)),
                              SizedBox(height: size.height * 0.01),
                              Text(
                                "${currentUser !=  null ? currentUser.email : ""}",
                                  //'${model.user.email}',
                                  style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.grey,
                                  )),
                            ])),
                    ListTile(
                      // leading: Icon(Icons.person_outline, color: Colors.white),
                      title: Text(
                        'Profile',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        //ExtendedNavigator.of(context)!
                         //   .push(Routes.profilePage);
                        Get.to(() => ProfilePage());
                      },
                    ),
                    ListTile(
                      title: Text(
                        'University',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.school_outlined),
                      title: Text(
                        'Add University',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.subscriptions_outlined),
                      title: Text(
                        'Manage Subscription',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SubscriptionScreen()));
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.new_releases_sharp),
                      title: Text(
                        'EdStory',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => EdStoryScreen()));
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.calculate_outlined),
                      title: Text(
                        'Cgpa Calulator',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CgpaScreen()));
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.timer),
                      title: Text(
                        'Timetable',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => TimetableScreen()));
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.poll_outlined),
                      title: Text(
                        'Polls',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.assistant_outlined),
                      title: Text(
                        'Assistance',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => AssistanceScreen()));
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.inbox),
                      title: Text(
                        'Inbox',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.add_shopping_cart_outlined),
                      title: Text(
                        'Advertise',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () {
                        // Navigator.pop(context);
                      },
                    ),
                    ListTile(
                      // leading: Icon(Icons.logout),
                      title: Text(
                        'Logout',
                        style: GoogleFonts.poppins(
                            color: Colors.white, fontSize: 15.5),
                      ),
                      onTap: () async {
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => LoginScreen()),
                        // );
                        //model.logout(context);
                      },
                    ),
                    SizedBox(height: size.height * 0.1),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget searchWidget() {
    return Container(
        child: Form(
      child: TextFormField(
        decoration: InputDecoration(
            hintText: 'Search',
            filled: true,
            fillColor: Colors.white,
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(100),
              borderSide: BorderSide.none,
            ),
            // icon: new Icon(Icons.search, color: Colors.white),
            contentPadding: EdgeInsets.only(top: 20, bottom: 20, left: 35),
            suffixIcon: Container(
              height: 50,
              width: 50,
              decoration: BoxDecoration(
                color: Theme.of(context).accentColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: new Icon(Icons.search, color: Colors.white),
            )),
        validator: (value) {
          if (value!.isEmpty) {
            return 'Please enter your email';
          }
          // if(!RegExp())
          return null;
        },
      ),
    ));
  }
}
