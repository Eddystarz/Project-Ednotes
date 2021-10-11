import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewForumScreen extends StatefulWidget {
  @override
  ViewForumScreenState createState(){
    return ViewForumScreenState();
  }
}

class ViewForumScreenState extends State<ViewForumScreen> {
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
              SizedBox(height: 24,),
              Container(
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
              SizedBox(height: 12,),
              Container(
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