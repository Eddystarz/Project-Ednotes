// import 'package:edtech/Screens/view_memory_lab_screen.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  @override
  SettingsScreenState createState(){
    return SettingsScreenState();
  }
}

class SettingsScreenState extends State<SettingsScreen>
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
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          // transform: Matrix4.translationValues(0.0, -50.0, 0.0),
          // margin: EdgeInsets.only(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                transform: Matrix4.translationValues(0, -50, 0),
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/images/profile.png'),
                        fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.circular(3)
                ),
                height: 200,
                width: MediaQuery.of(context).size.width,
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(right: 20,top:16),
                child: Icon(
                    Icons.edit_outlined,
                  color: Colors.white38,
                ),
              ),
              Container(
                margin: EdgeInsets.only(right: 30, left: 30),
                padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(.25),
                      blurRadius: 3
                    )
                  ]
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Amanda Cerny',
                              style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600,),
                            ),
                            Text('23 years old',
                              style: TextStyle(height: 1.6,),)
                          ],
                        ),
                        Icon(
                          Icons.edit_outlined
                        )
                      ],
                    ),
                    SizedBox(height:8),
                    Row(
                      children: [
                        Text('Department:',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),
                        ),
                        SizedBox(width:2),
                        Text('Physics',
                          style: TextStyle(height: 1.6,),)
                      ],
                    ),
                    SizedBox(height:4),
                    Row(
                      children: [
                        Text('Faculty:',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),
                        ),
                        SizedBox(width:2),
                        Text('Science',
                          style: TextStyle(height: 1.6,),)
                      ],
                    ),
                    SizedBox(height:4),
                    Row(
                      children: [
                        Text('University:',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),
                        ),
                        SizedBox(width:2),
                        Text('Obafemi Awolowo University',
                          style: TextStyle(height: 1.6,),)
                      ],
                    ),
                    SizedBox(height:4),
                    Row(
                      children: [
                        Text('State:',
                          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500,),
                        ),
                        SizedBox(width:2),
                        Text('Newyork',
                          style: TextStyle(height: 1.6,),)
                      ],
                    )
                  ],
                ),
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