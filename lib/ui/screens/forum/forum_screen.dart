// import 'package:edtech/Screens/view_forum_screen.dart';

import 'package:edtech/ui/screens/forum/view_forum_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ForumScreen extends StatefulWidget {
  @override
  ForumScreenState createState(){
    return ForumScreenState();
  }
}

class ForumScreenState extends State<ForumScreen>
{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
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
        child: Container(
          transform: Matrix4.translationValues(0.0, -15.0, 0.0),
          // margin: EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Theme.of(context).accentColor
                ),
                height:200,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height:9),
                    Text('Forum',
                      style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height:6),
                    Container(
                      width: 350,
                      child: Text('Lorem ipsum dolor sit amet consectetur, adipisicing elit.eveniet dolore maiores. Quos.',
                        style: GoogleFonts.poppins(color: Colors.white,),
                        textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
              Container(
                  transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                  margin: EdgeInsets.only(right: 10,left:10),

                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30)
                  ),
                  padding: EdgeInsets.only(left: 12,right: 12),
                  // height:300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SearchWidget(),
                      Padding(
                          padding: EdgeInsets.only(top:12),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(top: 12, right:27,left:27, bottom: 12),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlueAccent,
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Text('All',style: TextStyle(color: Colors.white),),
                                ),
                                SizedBox(width:12),
                                Container(
                                  padding: EdgeInsets.only(top: 12, right:27,left:27, bottom: 12),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Text('Physics',style: TextStyle(color: Colors.black),),
                                ),
                                SizedBox(width:12),
                                Container(
                                  padding: EdgeInsets.only(top: 12, right:27,left:27, bottom: 12),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Text('Mathematics',style: TextStyle(color: Colors.black),),
                                ),
                                SizedBox(width:12),
                                Container(
                                  padding: EdgeInsets.only(top: 12, right:27,left:27, bottom: 12),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Text('Chemistry',style: TextStyle(color: Colors.black),),
                                ),
                              ],
                            ),
                          )
                      ),
                      SizedBox(
                        height: 18,
                      ),
                      Text('Trending Posts',
                        style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.w500,),),
                      SizedBox(
                        height: 8,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ViewForumScreen()),
                          );
                        },
                        child: Container(
                            padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                            decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: <Widget>[
                                    Row(
                                      children: [
                                        Container(
                                            decoration: new BoxDecoration(
                                              color: Colors.white, borderRadius: BorderRadius.circular(100),
                                              image: DecorationImage(
                                                image: AssetImage('assets/images/status_5.png'),
                                                fit: BoxFit.cover,
                                              ),
                                              boxShadow: [
                                                new BoxShadow(
                                                    color: Color(0xFFCCCCCC),
                                                    blurRadius: 3.0,
                                                    offset: Offset(0,3)
                                                ),
                                              ],
                                            ),
                                            height: 45,
                                            width: 45
                                        ),
                                        SizedBox(width:8),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Container(
                                              width: 180,
                                              child: Text('Vijay Maliya',
                                                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),
                                            Text('2 days ago',
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                    Icon(
                                        Icons.keyboard_arrow_right_rounded
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore',
                                  style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w300,),),
                                SizedBox(
                                  height: 5,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Icon(Icons.comment, size: 19,color: Colors.grey,),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Text('23 Replies',
                                      style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w300,),),
                                  ],
                                )
                              ],
                            )

                        ),
                      ),
                      SizedBox(
                        height: 9,
                      ),
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.chat_bubble_outline_rounded),
        backgroundColor: Color(0xFFF7B928),
      ),
    );
  }

  Widget SearchWidget()
  {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.25),
              spreadRadius: 2,
              blurRadius: 100,
              offset: Offset(0, -3),
            )
          ]
      ),
      transform: Matrix4.translationValues(0,-30, 0),
      // width: 310,
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
            if (value!.isEmpty) {
              return 'Please enter your email';
            }
            // if(!RegExp())
            return null;
          },
        ),
      ),
    );
  }
}