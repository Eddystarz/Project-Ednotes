// import 'package:edtech/Screens/view_test_screen.dart';

import 'package:edtech/ui/screens/test/view_test_screen.dart';
import 'package:flutter/material.dart';

class TestScreen extends StatefulWidget {
  @override
  TestScreenState createState(){
    return TestScreenState();
  }
}

class TestScreenState extends State<TestScreen>
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
                      Text('Take A Test!',
                        style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height:6),
                      Container(
                        width: 350,
                        child: Text('Lorem ipsum dolor sit amet consectetur, adipisicing elit.eveniet dolore maiores. Quos.',
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
                        SizedBox(
                          height: 18,
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                            decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage('assets/images/aeror.png'),
                                                  fit: BoxFit.cover
                                              ),
                                              borderRadius: BorderRadius.circular(14)
                                          ),
                                          height: 100,
                                          width: 90
                                      ),
                                      SizedBox(width:8),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 180,
                                            child: Text('Discovery of 8 Biological System',
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text('8 Voice notes',
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
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ViewTestScreen())
                                );
                              },
                            )
                        ),
                        SizedBox(
                          height: 9,
                        ),
                        Container(
                            padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                            decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1),
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: GestureDetector(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(
                                    children: [
                                      Container(
                                          decoration: BoxDecoration(
                                              image: DecorationImage(
                                                  image: AssetImage('assets/images/aeror.png'),
                                                  fit: BoxFit.cover
                                              ),
                                              borderRadius: BorderRadius.circular(14)
                                          ),
                                          height: 100,
                                          width: 90
                                      ),
                                      SizedBox(width:8),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 180,
                                            child: Text('Discovery of 8 Biological System',
                                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 7,
                                          ),
                                          Text('8 Voice notes',
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
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) => ViewTestScreen())
                                );
                              },
                            )
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