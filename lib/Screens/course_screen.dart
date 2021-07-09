import 'package:edtech/Screens/view_course_screen.dart';
import 'package:flutter/material.dart';

class CourseScreen extends StatefulWidget {
  @override
  CourseScreenState createState(){
    return CourseScreenState();
  }
}

class CourseScreenState extends State<CourseScreen>
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
                    Text('Courses!',
                      style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height:6),
                    Container(
                      width: 350,
                      child: Text('Lorem ipsum dolor sit amet consectetur, adipisicing elit.eveniet dolore maiores.adipisicing. Quos.',
                        style: TextStyle(color: Colors.white,),
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

                    SizedBox(height: 40,),
                    Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/aeror.png'),
                              fit: BoxFit.cover
                          ),
                        borderRadius: BorderRadius.circular(30)
                      ),
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 22,right: 22),
                      padding: EdgeInsets.only(top:17,bottom: 17),
                      transform: Matrix4.translationValues(0, -50, 0),
                      decoration: BoxDecoration(
                        color: Color(0xFFF1F1F1),
                        borderRadius: BorderRadius.circular(19)
                      ),
                      // height: 120,
                      width: MediaQuery.of(context).size.width,
                      child:GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ViewCourseScreen())
                          );
                        },
                        child:  Column(
                          children: [
                            Container(
                              width: 200,
                              child: Wrap(
                                children: [
                                  Text('Discovery of biological system',
                                    style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(height:10),
                            Container(
                              width: 255,
                              child: Wrap(
                                children: [
                                  Text('Lorem ipsum dolor sit amet consectetur,  Quos.ipsum dolor sit amet consectetur,  Quos.',
                                    textAlign: TextAlign.center,),
                                ],
                              ),
                            ),
                          ],
                        ),
                      )
                    )
                  ],
                )
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