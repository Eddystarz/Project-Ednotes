// import 'package:edtech/Screens/single_course_screen.dart';
import 'package:edtech/ui/Screens/courses/single_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewCourseScreen extends StatefulWidget {
  @override
  ViewCourseScreenState createState(){
    return ViewCourseScreenState();
  }
}

class ViewCourseScreenState extends State<ViewCourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(50.0),
          child: AppBar(
            leading: IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.black),
              onPressed: () => Navigator.of(context).pop(),
            ),
            backgroundColor: Color(0xFFF9F9F9),
            elevation: 0,
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(right: 25, left: 25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Course Name,',
                style: GoogleFonts.poppins(fontSize: 30),
                ),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Details',
                      style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    Text('4 Courses',
                      style: GoogleFonts.poppins(fontSize: 21),
                    )
                  ],
                ),
                SizedBox(
                  height: 12,
                ),
                Container(
                  padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30)
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text('Outline',
                        style: GoogleFonts.poppins(fontSize: 19, fontWeight: FontWeight.w500,),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magna aliquyam erat, sed diam voluptua. At vero eos et accusam et justo duo dolores et ea reb',
                      style: GoogleFonts.poppins(height: 1.6,),)
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Assignments',
                      style: GoogleFonts.poppins(fontSize: 21, fontWeight: FontWeight.bold),
                    ),
                    Text('3 Assignments',
                      style: GoogleFonts.poppins(fontSize: 21),
                    )
                  ],
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                  padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text('Machine Learning',
                            style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Text('14 Questions',
                          )
                        ],
                      ),
                      Icon(
                        Icons.keyboard_arrow_right_rounded
                      )
                    ],
                  )
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                    padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text('Machine Learning',
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('14 Questions',
                            )
                          ],
                        ),
                        Icon(
                            Icons.keyboard_arrow_right_rounded
                        )
                      ],
                    )
                ),
                SizedBox(
                  height: 7,
                ),
                Container(
                    padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child:GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SingleCourseScreen())
                        );
                      },
                      child:  Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Machine Learning',
                                style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              Text('14 Questions',
                              )
                            ],
                          ),
                          Icon(
                              Icons.keyboard_arrow_right_rounded
                          )
                        ],
                      ),
                    )
                ),
                SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Memory Lab',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('4 Jottings',
                      style: GoogleFonts.poppins(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                    height:10
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top:13, left:15.0,bottom: 6,right: 15),
                        child: Column(
                          children: [
                            Text('Intro',
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('Lorem ipsum dolor sit amet consectetur,  Quos.ipsum dolor sit amet consectetur,  Quos.',
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFFCEE23).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                    SizedBox(width: 9,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top:10, left:15.0,bottom: 10,right: 15),
                        child: Column(
                          children: [
                            Text('Important',
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('Lorem ipsum dolor sit amet consectetur,  Quos.ipsum dolor sit amet consectetur,  Quos.',
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFDB162C).withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height:10
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top:13, left:15.0,bottom: 6,right: 15),
                        child: Column(
                          children: [
                            Text('Nicks',
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('Lorem ipsum dolor sit amet consectetur,  Quos.ipsum dolor sit amet consectetur,  Quos.',
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFFFCEE23).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                    SizedBox(width: 9,),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.only(top:10, left:15.0,bottom: 10,right: 15),
                        child: Column(
                          children: [
                            Text('Important notes',
                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                            ),
                            SizedBox(
                              height: 7,
                            ),
                            Text('Lorem ipsum dolor sit amet consectetur,  Quos.ipsum dolor sit amet consectetur,  Quos.',
                            )
                          ],
                          crossAxisAlignment: CrossAxisAlignment.start,
                        ),
                        decoration: BoxDecoration(
                            color: Color(0xFF448FA3).withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8)
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height:30
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

}