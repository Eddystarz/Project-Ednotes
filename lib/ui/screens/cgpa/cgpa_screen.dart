// import 'package:edtech/Screens/view_memory_lab_screen.dart';
import 'package:flutter/material.dart';

class CgpaScreen extends StatefulWidget {
  @override
  CgpaScreenState createState(){
    return CgpaScreenState();
  }
}

class CgpaScreenState extends State<CgpaScreen>
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
          // padding: EdgeInsets.only(right: 23, left: 23),
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
                    Text('GPA Calulator',
                      style: TextStyle(color: Colors.white, fontSize: 25,fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height:6),
                    Container(
                      width: 350,
                      child: Text('See Saved GPA\'s or Calculate a New One',
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
                    Container(
                        // margin: EdgeInsets.only(top: 24,bottom: 17, left: 20, right: 20),
                        padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Overall GPA',
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text('3.636',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('22/02/2021'),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                    Icons.keyboard_arrow_right_rounded
                                )
                              ],
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        // margin: EdgeInsets.only( left: 20, right: 20),
                        padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Overall GPA',
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text('3.636',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('22/02/2021'),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                    Icons.keyboard_arrow_right_rounded
                                )
                              ],
                            )
                          ],
                        )
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Container(
                        // margin: EdgeInsets.only( left: 20, right: 20),
                        padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                        decoration: BoxDecoration(
                            color: Color(0xFFF2F2F2),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Overall GPA',
                                ),
                                SizedBox(
                                  height: 7,
                                ),
                                Text('3.636',
                                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500,),
                                )
                              ],
                            ),
                            Row(
                              children: [
                                Text('22/02/2021'),
                                SizedBox(
                                  width: 3,
                                ),
                                Icon(
                                    Icons.keyboard_arrow_right_rounded
                                )
                              ],
                            )
                          ],
                        )
                    ),
                  ]
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
        child: Icon(Icons.add),
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