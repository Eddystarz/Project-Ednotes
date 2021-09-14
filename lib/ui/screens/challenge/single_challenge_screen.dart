

import 'package:edtech/ui/screens/challenge/take_challenge_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SingleChallengeScreen extends StatefulWidget {
  @override
  SingleChallengeScreenState createState(){
    return SingleChallengeScreenState();
  }
}

class SingleChallengeScreenState extends State<SingleChallengeScreen> {
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
                  Text('8 challenges',
                    style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.w400),
                  ),
                  Text('4 Untaken',
                    style: GoogleFonts.poppins(fontSize: 16),
                  )
                ],
              ),
              SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        child:  Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/q1.png'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.only(left: 12,right: 12,bottom: 12),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Name',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
                              ),
                              Text('10 Questions',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TakeChallengeScreen())
                          );
                        },
                      )
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                    child: GestureDetector(
                      child:  Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/q2.png'),
                                fit: BoxFit.cover
                            ),
                            borderRadius: BorderRadius.circular(8)
                        ),
                        padding: EdgeInsets.only(left: 12,right: 12,bottom: 12),
                        height: 150,
                        width: MediaQuery.of(context).size.width,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('Name',
                              style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
                            ),
                            Text('10 Questions',
                              style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => TakeChallengeScreen())
                        );
                      },
                    )
                  ),
                ],
              ),
              SizedBox(
                  height:15
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        child:  Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/q3.png'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.only(left: 12,right: 12,bottom: 12),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Name',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
                              ),
                              Text('10 Questions',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TakeChallengeScreen())
                          );
                        },
                      )
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: GestureDetector(
                        child:  Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/q4.png'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.only(left: 12,right: 12,bottom: 12),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Name',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
                              ),
                              Text('10 Questions',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TakeChallengeScreen())
                          );
                        },
                      )
                  ),
                ],
              ),
              SizedBox(
                  height:15
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        child:  Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/q5.png'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.only(left: 12,right: 12,bottom: 12),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Name',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
                              ),
                              Text('10 Questions',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TakeChallengeScreen())
                          );
                        },
                      )
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: GestureDetector(
                        child:  Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/q6.png'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.only(left: 12,right: 12,bottom: 12),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Name',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
                              ),
                              Text('10 Questions',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TakeChallengeScreen())
                          );
                        },
                      )
                  ),
                ],
              ),
              SizedBox(
                  height:15
              ),
              Row(
                children: [
                  Expanded(
                      child: GestureDetector(
                        child:  Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/q7.png'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.only(left: 12,right: 12,bottom: 12),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Name',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
                              ),
                              Text('10 Questions',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TakeChallengeScreen())
                          );
                        },
                      )
                  ),
                  SizedBox(
                    width: 12,
                  ),
                  Expanded(
                      child: GestureDetector(
                        child:  Container(
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/images/q8.png'),
                                  fit: BoxFit.cover
                              ),
                              borderRadius: BorderRadius.circular(8)
                          ),
                          padding: EdgeInsets.only(left: 12,right: 12,bottom: 12),
                          height: 150,
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text('Name',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w700,color: Colors.white),
                              ),
                              Text('10 Questions',
                                style: GoogleFonts.poppins(fontSize: 16,fontWeight: FontWeight.w300,color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => TakeChallengeScreen())
                          );
                        },
                      )
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