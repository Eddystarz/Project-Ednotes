
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RequestAssistanceScreen extends StatefulWidget {
  @override
  RequestAssistanceScreenState createState(){
    return RequestAssistanceScreenState();
  }
}

class RequestAssistanceScreenState extends State<RequestAssistanceScreen> {
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
              Text('Request Assistance,',
                style: TextStyle(fontSize: 30),
              ),
              SizedBox(height: 24,),
              Form(
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
                          onSaved: (String? value) {
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
                          onSaved: (String? value) {
                            // _email = value;
                          },
                        ),
                      ),
                      SizedBox(height: 13,),
                      Text('Duration',
                        style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w400),),
                      Container(
                        padding: EdgeInsets.only(top:10,bottom: 20),
                        child: TextFormField(
                          // The validator receives the text that the user has entered.
                          cursorColor: Colors.black,
                          style: GoogleFonts.poppins(color: Colors.black),
                          decoration: InputDecoration(
                            hintStyle: GoogleFonts.poppins(color: Colors.black),
                            hintText: '2 days',
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
                          onSaved: (String? value) {
                            // _email = value;
                          },
                        ),
                      ),
                      SizedBox(height: 13,),
                      Text('Level of Study',
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

                              items: <String>['Moderate', 'Advance','Basic'].map((String value) {
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Budget',
                                style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w400),),
                              Container(
                                padding: EdgeInsets.only(top:10,bottom: 10),
                                // width: 150,
                                child: TextFormField(
                                  // The validator receives the text that the user has entered.
                                  cursorColor: Colors.black,
                                  style: GoogleFonts.poppins(color: Colors.black),
                                  decoration: InputDecoration(
                                    hintStyle: GoogleFonts.poppins(color: Colors.black),
                                    hintText: r'$5',
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
                                  onSaved: (String? value) {
                                    // _email = value;
                                  },
                                ),
                              ),
                            ],
                          ),),
                          SizedBox(width: 13,),
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Faculty',
                                style: GoogleFonts.poppins( fontSize: 16, fontWeight: FontWeight.w400),),
                              Container(
                                  // width: 150,
                                  padding: EdgeInsets.only(top:7,bottom: 7),
                                  margin: EdgeInsets.only(top: 9),
                                  decoration: BoxDecoration(
                                      color: Color(0xFFF1F1F1),
                                      borderRadius: BorderRadius.circular(5)
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
                            ],
                          ))
                        ],
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
                                Text('Request',style: GoogleFonts.poppins( color: Colors.white)),
                              ],
                            ),
                            onTap: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => RequestAssistanceScreen())
                              );
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
        child: Icon(Icons.chat_bubble_outline_rounded),
        backgroundColor: Color(0xFFF7B928),
      ),
    );
  }

}