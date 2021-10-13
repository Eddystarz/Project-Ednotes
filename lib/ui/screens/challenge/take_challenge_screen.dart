// import 'package:edtech/Screens/single_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TakeChallengeScreen extends StatefulWidget {
  @override
  TakeChallengeScreenState createState(){
    return TakeChallengeScreenState();
  }
}

class TakeChallengeScreenState extends State<TakeChallengeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F1),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.0),
        child: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.of(context).pop(),
          ),
          backgroundColor: Color(0xFFF1F1F1),
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(right: 25, left: 25),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text('Challenge Name,',
                style: GoogleFonts.poppins(fontSize: 30),
              ),
              SizedBox(height: 24,),
              Form(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 17, right: 17, top: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Who is the First Lady Of United States of America?',
                              style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w700),),
                            Container(
                              padding: EdgeInsets.only(top:10,bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                style: GoogleFonts.poppins(color: Colors.black),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(color: Colors.black),
                                  hintText: 'Type Answer',
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
                                onSaved: (String? value) {
                                  // _email = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13,),
                      Container(
                        padding: EdgeInsets.only(left: 17, right: 17, top: 14),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(9),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Who is the First Lady Of United States of America?',
                              style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w700),),
                            Container(
                              padding: EdgeInsets.only(top:10,bottom: 20),
                              child: TextFormField(
                                // The validator receives the text that the user has entered.
                                cursorColor: Colors.black,
                                style: GoogleFonts.poppins(color: Colors.black),
                                decoration: InputDecoration(
                                  hintStyle: GoogleFonts.poppins(color: Colors.black),
                                  hintText: 'Type Answer',
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
                                onSaved: (String? value) {
                                  // _email = value;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 13,),
                      Container(
                          height: 80,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: Theme.of(context).accentColor,
                              borderRadius: BorderRadius.circular(7)
                          ),
                          child: GestureDetector(
                            child:  Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Submit',style: GoogleFonts.poppins( color: Colors.white)),
                              ],
                            ),
                            onTap: () {
                              // Navigator.push(context,
                              //     MaterialPageRoute(builder: (context) => RequestAssistanceScreen())
                              // );
                            },
                          )
                      ),
                      SizedBox(height: 23,),
                    ]
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your onPressed code here!
        },
        child: Icon(Icons.check),
        backgroundColor: Color(0xFFF7B928),
      ),
    );
  }

}