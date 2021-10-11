

import 'package:edtech/ui/screens/assistance/request_assistance_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AssistanceScreen extends StatefulWidget {
  @override
  AssistanceScreenState createState(){
    return AssistanceScreenState();
  }
}

class AssistanceScreenState extends State<AssistanceScreen>
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
                    Text('Assistance',
                      style: GoogleFonts.poppins(color: Colors.white, fontSize: 25,fontWeight: FontWeight.normal),
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
                    children: [
                      searchWidget(),
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
                                  child: Text('All',style: GoogleFonts.poppins(color: Colors.white),),
                                ),
                                SizedBox(width:12),
                                Container(
                                  padding: EdgeInsets.only(top: 12, right:27,left:27, bottom: 12),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Text('Physics',style: GoogleFonts.poppins(color: Colors.black),),
                                ),
                                SizedBox(width:12),
                                Container(
                                  padding: EdgeInsets.only(top: 12, right:27,left:27, bottom: 12),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Text('Mathematics',style: GoogleFonts.poppins(color: Colors.black),),
                                ),
                                SizedBox(width:12),
                                Container(
                                  padding: EdgeInsets.only(top: 12, right:27,left:27, bottom: 12),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(6)
                                  ),
                                  child: Text('Chemistry',style: GoogleFonts.poppins(color: Colors.black),),
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                   Image(image: AssetImage('assets/images/ass.png'),width: 50,),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Text('Assignments',style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),)
                                  ],

                                ),
                              ),
                              Container(
                                height: 40,
                                width: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFF0D93C6),
                                  borderRadius: BorderRadius.circular(9)
                                ),
                                child: GestureDetector(
                                  child:  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text('Request',style: GoogleFonts.poppins( color: Colors.white)),
                                    ],
                                  ),
                                  onTap: () {
                                    Navigator.push(context,
                                        MaterialPageRoute(builder: (context) => RequestAssistanceScreen())
                                    );
                                  },
                                )
                              )
                            ],
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    Image(image: AssetImage('assets/images/research.png'),width: 50,),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Text('Research Projects',style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),)
                                  ],

                                ),
                              ),
                              Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF0D93C6),
                                      borderRadius: BorderRadius.circular(9)
                                  ),
                                  child: GestureDetector(
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Request',style: GoogleFonts.poppins( color: Colors.white)),
                                        ],
                                      ),
                                    onTap: () {
                                      Navigator.push(context,
                                          MaterialPageRoute(builder: (context) => RequestAssistanceScreen())
                                      );
                                    },
                                  )
                              )
                            ],
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
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(
                                child: Row(
                                  children: [
                                    Image(image: AssetImage('assets/images/paper.png'),width: 50,),
                                    SizedBox(
                                      width: 9,
                                    ),
                                    Text('Term paper',style: GoogleFonts.poppins(fontSize: 14, color: Colors.black),)
                                  ],

                                ),
                              ),
                              Container(
                                  height: 40,
                                  width: 100,
                                  decoration: BoxDecoration(
                                      color: Color(0xFF0D93C6),
                                      borderRadius: BorderRadius.circular(9)
                                  ),
                                  child: GestureDetector(
                                      child:  Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Request',style: GoogleFonts.poppins( color: Colors.white)),
                                        ],
                                      ),
                                      onTap: () {
                                        Navigator.push(context,
                                            MaterialPageRoute(builder: (context) => RequestAssistanceScreen())
                                        );
                                      },
                                  )
                              )
                            ],
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

  Widget searchWidget()
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