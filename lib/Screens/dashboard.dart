import 'package:edtech/Screens/TestScreen.dart';
import 'package:edtech/Screens/assistance_screen.dart';
import 'package:edtech/Screens/cgpa_screen.dart';
import 'package:edtech/Screens/challenge_screen.dart';
import 'package:edtech/Screens/course_screen.dart';
import 'package:edtech/Screens/forum_screen.dart';
import 'package:edtech/Screens/login_screen.dart';
import 'package:edtech/Screens/memory_lab_screen.dart';
import 'package:edtech/Screens/ed_story_screen.dart';
import 'package:edtech/Screens/reward_screen.dart';
import 'package:edtech/Screens/settings_screen.dart';
import 'package:edtech/Screens/subscription_screen.dart';
import 'package:edtech/Screens/support_screen.dart';
import 'package:edtech/Screens/timetable_screen.dart';
import 'package:edtech/Screens/voice_screen.dart';
import 'package:edtech/Screens/wallet_screen.dart';
import 'package:edtech/main.dart';
import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Dashboard extends StatefulWidget {
  static const routeName = "/dashboard";
  @override
  DashboardState createState() {
    return DashboardState();
  }
}

class DashboardState extends State<Dashboard> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  String firstname = '';
  Future<void> fetchLoggedInUser() async {
    SharedPreferences prefs = await MyApp.prefs;
    setState(() {
      firstname = prefs.getString('firstname');
    });
    // print(firstname);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchLoggedInUser();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      // backgroundColor: Colors.blue[900],
      key: _scaffoldKey,
      backgroundColor: Color(0xFFF9F9F9),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(' Ednotes',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(color: Colors.black ),
          ),
        ),
        leading: new IconButton(
          icon: ImageIcon(AssetImage('assets/images/menu.png'),color: Theme.of(context).primaryColor,),
          onPressed: () {
            _scaffoldKey.currentState.openDrawer();
          },
        ),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        // leading: Icon(Icons.menu, color: Colors.black)
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 20.0,left: 10,right: 10,bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget> [
             Text('Hey $firstname',
                style: GoogleFonts.poppins(fontSize: 25),
              ),
              SizedBox(height:10),
              SearchWidget(),
              SizedBox(height:20),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  // scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => WalletScreen())
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFFCCCCCC),
                                    blurRadius: 3.0,
                                    offset: Offset(0,3)
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(left:14, right:14),
                            padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                            child: ImageIcon(AssetImage('assets/images/wallet_2.png'),color: Theme.of(context).primaryColor, ),
                            height: 65,
                            width: 65,
                          ),
                          SizedBox(height: 10,),
                          Text('Wallet')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SupportScreen())
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFFCCCCCC),
                                    blurRadius: 3.0,
                                    offset: Offset(0,3)
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(left:14, right:14),
                            padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                            child: ImageIcon(AssetImage('assets/images/headphones.png'),color: Theme.of(context).primaryColor, ),
                            height: 65,
                            width: 65,
                          ),
                          SizedBox(height: 10,),
                          Text('Support')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RewardScreen())
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFFCCCCCC),
                                    blurRadius: 3.0,
                                    offset: Offset(0,3)
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(left:14, right:14),
                            padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                            child: ImageIcon(AssetImage('assets/images/r-p.png'),color: Theme.of(context).primaryColor, ),
                            height: 65,
                            width: 65,
                          ),
                          SizedBox(height: 10,),
                          Text('R.P')
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => RewardScreen())
                        );
                      },
                      child: Column(
                        children: [
                          Container(
                            decoration: new BoxDecoration(
                              color: Colors.white, borderRadius: BorderRadius.circular(100),
                              boxShadow: [
                                new BoxShadow(
                                    color: Color(0xFFCCCCCC),
                                    blurRadius: 3.0,
                                    offset: Offset(0,3)
                                ),
                              ],
                            ),
                            margin: EdgeInsets.only(left:14, right:14),
                            padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                            child: ImageIcon(AssetImage('assets/images/news.png'),color: Theme.of(context).primaryColor, ),
                            height: 65,
                            width: 65,
                          ),
                          SizedBox(height: 10,),
                          Text('News')
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          decoration: new BoxDecoration(
                            color: Colors.white, borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              new BoxShadow(
                                  color: Color(0xFFCCCCCC),
                                  blurRadius: 3.0,
                                  offset: Offset(0,3)
                              ),
                            ],
                          ),
                          margin: EdgeInsets.only(left:14, right:14),
                          padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                          child: ImageIcon(AssetImage('assets/images/news.png'),color: Theme.of(context).primaryColor, ),
                          height: 65,
                          width: 65,
                        ),
                        SizedBox(height: 10,),
                        Text('NTFN')
                      ],
                    ),

                  ],
                ),
              ),
              SizedBox(
                height:50
              ),
              Row(
                children: <Widget>[
                  Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top:10, left:15.0,bottom: 10,right: 15),
                        child: Column(
                          children: [
                            // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                            Image(image: AssetImage('assets/images/course.png'),height: 40,),
                            SizedBox(height: 13,),
                            Container(
                              width: 80,
                              child: Wrap(
                                children: [
                                  Text('View Courses',
                                    style: GoogleFonts.poppins(fontSize: 17),),
                                ],
                              ),
                            ),
                            SizedBox(height: 13,),
                            GestureDetector(
                              child: Container(
                                padding: EdgeInsets.only(top: 13,bottom: 13),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                  color: Theme.of(context).accentColor,
                                  borderRadius: BorderRadius.circular(7)
                                ),
                                child: Center(
                                  child: Text('view',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ),
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => CourseScreen())
                                );
                              },
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white
                        ),
                      ),
                    ),
                  SizedBox(width: 9,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top:10, left:15.0,bottom: 10,right: 15),
                      child: Column(
                        children: [
                          // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                          Image(image: AssetImage('assets/images/voicenote.png'),height: 40,),
                          SizedBox(height: 13,),
                          Container(
                            width: 80,
                            child: Wrap(
                              children: [
                                Text('Voice notes',style: GoogleFonts.poppins(fontSize: 17),),
                              ],
                            ),
                          ),
                          SizedBox(height: 13,),
                          GestureDetector(
                              child: Container(
                                  padding: EdgeInsets.only(top: 13,bottom: 13),
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                      color: Theme.of(context).accentColor,
                                      borderRadius: BorderRadius.circular(7)
                                  ),
                                  child: Center(
                                    child: Text('view',
                                      style: GoogleFonts.poppins(
                                        color: Colors.white,
                                      ),
                                    ),
                                  )
                              ),
                            onTap: () {
                                Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => VoiceScreen())
                                );
                            },
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height:50
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top:10, left:15.0,bottom: 10,right: 15),
                      child: Column(
                        children: [
                          // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                          Image(image: AssetImage('assets/images/question-mark.png'),height: 40,),
                          SizedBox(height: 13,),
                          Container(
                            width: 140,
                            child: Wrap(
                              children: [
                                Text('Past Questions and Answers',style: GoogleFonts.poppins(fontSize: 17),),
                              ],
                            ),
                          ),
                          SizedBox(height: 13,),
                          GestureDetector(
                            child: Container(
                                padding: EdgeInsets.only(top: 13,bottom: 13),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                child: Center(
                                  child: Text('view',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                            ),
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => CourseScreen())
                              // );
                            },
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(width: 9,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top:10, left:15.0,bottom: 10,right: 15),
                      child: Column(
                        children: [
                          // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                          Image(image: AssetImage('assets/images/exam (1).png'),height: 40,),
                          SizedBox(height: 13,),
                          Container(
                            width: 80,
                            child: Wrap(
                              children: [
                                Text('Take A test',style: GoogleFonts.poppins(fontSize: 17),),
                              ],
                            ),
                          ),
                          SizedBox(height: 13,),
                          GestureDetector(
                            child: Container(
                                padding: EdgeInsets.only(top: 13,bottom: 13),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                child: Center(
                                  child: Text('view',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => TestScreen())
                              );
                            },
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height:50
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top:26, left:15.0,bottom: 26,right: 15),
                      // height: 170,
                      child: Column(
                        children: [
                          // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                          Image(image: AssetImage('assets/images/lab.png'),height: 40,),
                          SizedBox(height: 13,),
                          Container(
                            width: 140,
                            child: Wrap(
                              children: [
                                Text('Memory Lab',style: GoogleFonts.poppins(fontSize: 17),),
                              ],
                            ),
                          ),
                          SizedBox(height: 29,),
                          GestureDetector(
                            child: Container(
                                padding: EdgeInsets.only(top: 13,bottom: 13),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                child: Center(
                                  child: Text('view',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => MemoryLabScreen())
                              );
                            },
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                    ),
                  ),
                  SizedBox(width: 9,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top:10, left:15.0,bottom: 10,right: 15),
                      child: Column(
                        children: [
                          // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                          Image(image: AssetImage('assets/images/challenge.png'),height: 40,),
                          SizedBox(height: 13,),
                          Container(
                            width: 80,
                            child: Wrap(
                              children: [
                                Text('Take A Challenge',style: GoogleFonts.poppins(fontSize: 17),),
                              ],
                            ),
                          ),
                          SizedBox(height: 13,),
                          GestureDetector(
                            child: Container(
                                padding: EdgeInsets.only(top: 13,bottom: 13),
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: Theme.of(context).accentColor,
                                    borderRadius: BorderRadius.circular(7)
                                ),
                                child: Center(
                                  child: Text('view',
                                    style: GoogleFonts.poppins(
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => ChallengeScreen())
                              );
                            },
                          )
                        ],
                        crossAxisAlignment: CrossAxisAlignment.start,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height:50
              ),
              Container(
                padding: EdgeInsets.only(top:10, left:15.0,bottom: 10,right: 15),
                width: 190,
                child: Column(
                  children: [
                    // ImageIcon(AssetImage('assets/images/course.png'),color: Theme.of(context).primaryColor, ),
                    Image(image: AssetImage('assets/images/chat-group.png'),height: 40,),
                    SizedBox(height: 13,),
                    Container(
                      width: 80,
                      child: Wrap(
                        children: [
                          Text('Check out Forum',style: GoogleFonts.poppins(fontSize: 17),),
                        ],
                      ),
                    ),
                    SizedBox(height: 13,),
                    GestureDetector(
                      child: Container(
                          padding: EdgeInsets.only(top: 13,bottom: 13),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: Center(
                            child: Text('view',
                              style: GoogleFonts.poppins(
                                color: Colors.white,
                              ),
                            ),
                          )
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => ForumScreen())
                        );
                      },
                    )
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                decoration: BoxDecoration(
                    color: Colors.white
                ),
              ),
            ],
          ),
        ),
      ),
      drawer: Container(
        width: 250,
        child: Drawer(
          child: ListView(
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.person_outline,color: Theme.of(context).primaryColor),
                  title: Text('Profile', style: GoogleFonts.poppins(color: Theme.of(context).primaryColor),),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SettingsScreen())
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading:  Icon(Icons.school),
                  title: Text('University'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.school_outlined),
                  title: Text('Add University'),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.subscriptions_outlined),
                  title: Text('Manage Subscription'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SubscriptionScreen())
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.new_releases_sharp),
                  title: Text('EdStory'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => EdStoryScreen())
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.calculate_outlined),
                  title: Text('Cgpa Calulator'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CgpaScreen())
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.timer),
                  title: Text('Timetable'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => TimetableScreen())
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.poll_outlined),
                  title: Text('Polls'),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.assistant_outlined),
                  title: Text('Assistance'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => AssistanceScreen())
                    );
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.inbox),
                  title: Text('Inbox'),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.add_shopping_cart_outlined),
                  title: Text('Advertise'),
                  onTap: () {
                    // Navigator.pop(context);
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text('Logout'),
                  onTap: () async {
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => LoginScreen()),
                    // );
                    var string = '';
                    Navigator.of(context).pushNamed(LoginScreen.routeName, arguments: 'See me');
                    print('observing');
                    SharedPreferences prefs = await MyApp.prefs;
                    // print(prefs.getString('token'));
                    // prefs.remove('token');
                    print(prefs.getString('token'));
                  },
                ),
              ),
            ],
          ),
        ),
      )

    );
  }

  Widget SearchWidget()
  {
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
                contentPadding: EdgeInsets.only(top: 20,bottom: 20,left: 35),
                suffixIcon: Container(
                  height: 50,
                  width:50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: new Icon(Icons.search, color: Colors.white),
                )
            ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter your email';
              }
              // if(!RegExp())
              return null;
            },
          ),
        )
    );
  }
}
