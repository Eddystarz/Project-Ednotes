// import 'package:edtech/Screens/single_lab_screen.dart';

import 'package:edtech/ui/screens/memory_lab/single_lab_screen.dart';
import 'package:flutter/material.dart';

class ViewMemoryLabScreen extends StatefulWidget {
  @override
  ViewMemoryLabScreenState createState(){
    return ViewMemoryLabScreenState();
  }
}

class ViewMemoryLabScreenState extends State<ViewMemoryLabScreen> {
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
                  Text('8 Jottings',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text('4 Unread',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              SizedBox(
                  height:10
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SingleLabScreen())
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.only(top:13, left:15.0,bottom: 6,right: 15),
                        child: Column(
                          children: [
                            Text('Intro',
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
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
                    )
                  ),
                  SizedBox(width: 9,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.only(top:10, left:15.0,bottom: 10,right: 15),
                      child: Column(
                        children: [
                          Text('Important',
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
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
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
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
                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
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