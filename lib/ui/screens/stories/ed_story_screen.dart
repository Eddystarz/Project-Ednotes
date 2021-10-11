
import 'package:flutter/material.dart';

class EdStoryScreen extends StatefulWidget {
  @override
  EdStoryScreenState createState(){
    return EdStoryScreenState();
  }
}

class EdStoryScreenState extends State<EdStoryScreen>
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
                    Text('EdStories',
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
                          padding: EdgeInsets.only(top:2),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: new BoxDecoration(
                                        color: Colors.white, borderRadius: BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/status_1.png'),
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
                                      margin: EdgeInsets.only(left:14, right:14),
                                      padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                                      height: 65,
                                      width: 65,
                                    ),
                                    SizedBox(height: 10,),
                                    Text('All')
                                  ],
                                ),
                                SizedBox(width:12),
                                Column(
                                  children: [
                                    Container(
                                      decoration: new BoxDecoration(
                                        color: Colors.white, borderRadius: BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/status_2.png'),
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
                                      margin: EdgeInsets.only(left:14, right:14),
                                      padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                                      height: 65,
                                      width: 65,
                                    ),
                                    SizedBox(height: 10,),
                                    Text('State')
                                  ],
                                ),
                                SizedBox(width:12),
                                Column(
                                  children: [
                                    Container(
                                      decoration: new BoxDecoration(
                                        color: Colors.white, borderRadius: BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/status_3.png'),
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
                                      margin: EdgeInsets.only(left:14, right:14),
                                      padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                                      height: 65,
                                      width: 65,
                                    ),
                                    SizedBox(height: 10,),
                                    Text('University')
                                  ],
                                ),
                                SizedBox(width:12),
                                Column(
                                  children: [
                                    Container(
                                      decoration: new BoxDecoration(
                                        color: Colors.white, borderRadius: BorderRadius.circular(100),
                                        image: DecorationImage(
                                          image: AssetImage('assets/images/status_4.png'),
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
                                      margin: EdgeInsets.only(left:14, right:14),
                                      padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                                      height: 65,
                                      width: 65,
                                    ),
                                    SizedBox(height: 10,),
                                    Text('Faculty')
                                  ],
                                ),
                                SizedBox(width:12),
                                Column(
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
                                      margin: EdgeInsets.only(left:14, right:14),
                                      padding: EdgeInsets.only(top:17.0,bottom: 17.0,right:17, left: 17),
                                      height: 65,
                                      width: 65,
                                    ),
                                    SizedBox(height: 10,),
                                    Text('Level')
                                  ],
                                ),

                              ],
                            ),
                          )
                      ),
                      SizedBox(
                        height: 18,
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