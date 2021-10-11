// import 'package:edtech/Screens/view_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SupportScreen extends StatefulWidget {
  @override
  SupportScreenState createState(){
    return SupportScreenState();
  }
}

class SupportScreenState extends State<SupportScreen>
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
                  padding: EdgeInsets.only(
                    left: 20,right: 20
                  ),
                  height:230,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height:9),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Text('Support',
                          style: GoogleFonts.poppins(color: Colors.white, fontSize: 25,fontWeight: FontWeight.normal),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(height:15),
                      Row(
                        children: [
                          Icon(
                            Icons.phone,
                            color: Colors.white,
                            size: 17,
                          ),
                          SizedBox(width:6),
                          Text('+92 03325 445 845',
                            style: GoogleFonts.poppins(color: Colors.white,fontSize: 14),
                            textAlign: TextAlign.center,),
                        ],
                      ),
                      SizedBox(height:6),
                      Row(
                        children: [
                          Icon(
                            Icons.mail_outline_outlined,
                            color: Colors.white,
                            size: 17,
                          ),
                          SizedBox(width:6),
                          Text('support@ednotes.com',
                            style: GoogleFonts.poppins(color: Colors.white,fontSize: 14),
                            textAlign: TextAlign.center,),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                    transform: Matrix4.translationValues(0.0, -50.0, 0.0),
                    // margin: EdgeInsets.only(right: 10,left:10),

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(23),
                            topRight: Radius.circular(23)
                        )
                    ),
                    padding: EdgeInsets.only(top:20,left: 12,right: 12),
                    // height:300,
                  width: MediaQuery.of(context).size.width,
                    child: Form(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Title',
                              style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w400),),
                            Container(
                              padding: EdgeInsets.only(top:10,bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                style: GoogleFonts.poppins(color: Colors.black),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(color: Colors.black),
                                  hintText: 'Jone Doe',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none
                                  ),
                                  fillColor: Color(0xFFF1F1F1), filled: true,
                                  contentPadding: EdgeInsets.only(top: 18,bottom: 18,left: 15),
                                ),
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  // if(!RegExp())
                                  return null;
                                },
                                onSaved: (value) {
                                  // _email = value;
                                },
                              ),
                            ),
                            SizedBox(height: 13,),
                            Text('Description',
                              style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w400),),
                            Container(
                              padding: EdgeInsets.only(top:10,bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                style: GoogleFonts.poppins(color: Colors.black),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(color: Colors.black),
                                  hintText: 'Type Here ...',
                                  focusedBorder: InputBorder.none,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                      borderSide: BorderSide.none
                                  ),
                                  fillColor: Color(0xFFF1F1F1), filled: true,
                                  contentPadding: EdgeInsets.only(top: 18,bottom: 18,left: 15),
                                ),
                                maxLines: 5,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  // if(!RegExp())
                                  return null;
                                },
                                onSaved: (value) {
                                  // _email = value;
                                },
                              ),
                            ),
                            SizedBox(height: 13,),
                            Text('Faculty',
                              style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w400),),
                            Container(
                              padding: EdgeInsets.only(top:10,bottom: 10),
                              decoration: BoxDecoration(
                                color: Color(0xFFF1F1F1)
                              ),
                              child: DropdownButtonHideUnderline(
                                child: new DropdownButton<String>(
                                  isExpanded: true,
                                  // value: gender,
                                  iconSize: 15,
                                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                                  // itemHeight: 300,
                                  elevation: 0,
                                  style: TextStyle(color: Colors.black),
                                  dropdownColor: Colors.white,

                                  items: <String>['Chemistry', 'Science',].map((String value) {
                                    return new DropdownMenuItem<String>(
                                      value: value,
                                      child: new Text(value,style: TextStyle(color: Colors.black) ,),
                                    );
                                  }).toList(),
                                  onChanged: (newValue) {
                                    setState(() {
                                      // gender = newValue;
                                    });
                                  },
                                ),
                              )
                            ),
                            SizedBox(height: 13,),
                            Text('University',
                              style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w400),),
                            Container(
                                padding: EdgeInsets.only(top:10,bottom: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xFFF1F1F1)
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: new DropdownButton<String>(
                                    isExpanded: true,
                                    // value: gender,
                                    iconSize: 15,
                                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                                    // itemHeight: 300,
                                    elevation: 0,
                                    style: TextStyle(color: Colors.black),
                                    dropdownColor: Colors.white,

                                    items: <String>['University of lagos',].map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value,style: TextStyle(color: Colors.black) ,),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        // gender = newValue;
                                      });
                                    },
                                  ),
                                )
                            ),
                            SizedBox(height: 13,),
                            Text('State',
                              style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w400),),
                            Container(
                                padding: EdgeInsets.only(top:10,bottom: 10),
                                decoration: BoxDecoration(
                                    color: Color(0xFFF1F1F1)
                                ),
                                child: DropdownButtonHideUnderline(
                                  child: new DropdownButton<String>(
                                    isExpanded: true,
                                    // value: gender,
                                    iconSize: 15,
                                    icon: Icon(Icons.keyboard_arrow_down_sharp),
                                    // itemHeight: 300,
                                    elevation: 0,
                                    style: TextStyle(color: Colors.black),
                                    dropdownColor: Colors.white,

                                    items: <String>['Osun',].map((String value) {
                                      return new DropdownMenuItem<String>(
                                        value: value,
                                        child: new Text(value,style: TextStyle(color: Colors.black) ,),
                                      );
                                    }).toList(),
                                    onChanged: (newValue) {
                                      setState(() {
                                        // gender = newValue;
                                      });
                                    },
                                  ),
                                )
                            ),
                          ]
                      ),
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}