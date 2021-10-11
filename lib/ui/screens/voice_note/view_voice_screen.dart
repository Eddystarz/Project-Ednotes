import 'package:flutter/material.dart';

class ViewVoiceScreen extends StatefulWidget {
  @override
  ViewVoiceScreenState createState(){
    return ViewVoiceScreenState();
  }
}

class ViewVoiceScreenState extends State<ViewVoiceScreen> {


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
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 24,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('8 Voice notes',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('4 Unheard',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                  height:10
              ),
              Column(
                children: <Widget>[
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
                              Text('Today',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
                              ),
                              SizedBox(
                                height: 7,
                              ),
                              GestureDetector(
                                onTap: (){

                                },
                                child: Text('Play',
                                ),
                              )
                            ],
                          ),
                          Icon(
                              Icons.keyboard_arrow_right_rounded
                          )
                        ],
                      )
                  ),
                  SizedBox(width: 9,),
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
                              Text('Today',
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
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
                ],
              ),
              SizedBox(
                  height:10
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