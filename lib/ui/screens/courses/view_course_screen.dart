// import 'package:edtech/Screens/single_course_screen.dart';
//import 'package:edtech/ui/Screens/courses/single_course_screen.dart';
import 'package:edtech/core/models/course.dart';
import 'package:edtech/ui/screens/courses/course_topic_screen.dart';
import 'package:edtech/ui/screens/courses/courses_screen/courseprovider.dart';
import 'package:edtech/ui/screens/courses/single_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ViewCourseScreen extends StatefulWidget {

  @override
  ViewCourseScreenState createState(){
    return ViewCourseScreenState();
  }
}

class ViewCourseScreenState extends State<ViewCourseScreen> {

  Widget courseTopicContainer(CourseTopics ct){
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: InkWell(
        onTap: (){
          Get.to(() => CourseTopicScreen(courseTopic: ct,));
        },
        child: Container(
          width: Get.width,
            padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('${ct.name}',
                  style: GoogleFonts.poppins(fontSize: 14, fontWeight: FontWeight.w600,),
                ),
                SizedBox(
                  height: 7,
                ),
                Text('${ct.lectureNotes!.length} lecture note(s)',
                    style: GoogleFonts.poppins(fontSize: 12)
                )
              ],
            ),

        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var course = Provider.of<CourseProvider>(context, listen:false).selectedCourse;

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
                Text('${course!.name}',
                style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 24,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Details',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text('${course.courseTopics!.length} Topic(s)',
                      style: GoogleFonts.poppins(fontSize: 18),
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
                        style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text('${course.description}',
                          style: GoogleFonts.poppins(fontSize: 14, height: 1.6)
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 7,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text('Topics',
                      style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
                    ),

                  ],
                ),

                Column(
                  children: List.generate(course.courseTopics!.length, (i) {
                    var ct = course.courseTopics![i];
                    return courseTopicContainer(ct);
                  }),
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