// import 'package:edtech/Screens/view_course_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WalletScreen extends StatefulWidget {
  @override
  WalletScreenState createState(){
    return WalletScreenState();
  }
}

class WalletScreenState extends State<WalletScreen>
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
                  height:250,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height:9),
                      Text('Wallet',
                        style: GoogleFonts.poppins(color: Colors.white, fontSize: 25,fontWeight: FontWeight.normal),
                      ),
                      SizedBox(height:6),
                      Text('Balance',
                        style: GoogleFonts.poppins(color: Colors.white,fontSize: 14),
                        textAlign: TextAlign.center,),
                      SizedBox(height:6),
                      Text(r'122$',
                        style: GoogleFonts.poppins(color: Colors.white,fontSize: 30),
                        textAlign: TextAlign.center,),
                      SizedBox(height:6),
                      Container(
                          height: 40,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Color(0xFF0D93C6),
                              borderRadius: BorderRadius.circular(9)
                          ),
                          child: GestureDetector(
                              child:  Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text('Add Funds',style: TextStyle( color: Colors.white)),
                                ],
                              )
                          )
                      )
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
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Details',
                              style: GoogleFonts.poppins(fontSize: 15,),
                            ),
                            Text('View all',
                              style: GoogleFonts.poppins(fontSize: 15),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF1F1F1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              width: MediaQuery.of(context).size.width*0.92,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_upward,
                                        color:  Color(0xFFF7B928),
                                      ),
                                      SizedBox(width:4),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 180,
                                            child: Text('Referral Bonus',
                                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text('May 12, 2020',
                                            style: GoogleFonts.poppins(fontSize: 13,),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 7),
                                        child: Text(r'$',
                                          style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text('12',
                                        style: GoogleFonts.poppins(fontSize: 26,fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 24,bottom: 17, left: 12, right: 12),
                              decoration: BoxDecoration(
                                  color: Color(0xFFF1F1F1),
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              width: MediaQuery.of(context).size.width*0.92,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.arrow_downward,
                                        color:  Colors.red,
                                      ),
                                      SizedBox(width:4),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Container(
                                            width: 180,
                                            child: Text('Referral Bonus',
                                              style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.w500,),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 2,
                                          ),
                                          Text('May 12, 2020',
                                            style: GoogleFonts.poppins(fontSize: 13,),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Container(
                                        padding: EdgeInsets.only(bottom: 7),
                                        child: Text(r'$',
                                          style: GoogleFonts.poppins(fontSize: 10,fontWeight: FontWeight.w600),
                                        ),
                                      ),
                                      Text('121',
                                        style: GoogleFonts.poppins(fontSize: 26,fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    )
                ),
              ],
            ),
          ),
        )
    );
  }
}