import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SubscriptionScreen extends StatefulWidget {
  @override
  SubscriptionScreenState createState(){
    return SubscriptionScreenState();
  }
}

class SubscriptionScreenState extends State<SubscriptionScreen> {
  String _amount = r"$100";
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
              Text('Subscriptions',
                style: GoogleFonts.poppins(fontSize: 25),
              ),
              SizedBox(height: 24,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // transform: Matrix4.translationValues(0, -50, 0),
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/sub.png'),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(3)
                    ),
                    height: 230,
                    width: MediaQuery.of(context).size.width*0.8,
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top:16,left: 30),
                  ),
                ],
              ),
              SizedBox(height:14),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 300,
                    child: Text('Choose the best plan that best suite you.',
                      style: GoogleFonts.poppins(fontSize: 20,),
                      textAlign: TextAlign.center,
                    ),
                  )
                ],
              ),
              SizedBox(height:24),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 20,bottom: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      color: Colors.white
                    ),
                    width: 110,
                    child: Column(
                      children: [
                        Text('Daily',
                          style: GoogleFonts.poppins(fontSize: 15,),
                        ),
                        SizedBox(height:8),
                        Text(_amount,
                          style: GoogleFonts.poppins(fontSize: 25,),
                        ),
                        SizedBox(height:8),
                        Text('Lorem ipsum',
                          style: GoogleFonts.poppins(color:Colors.blue,fontSize: 15,),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width:15),
                  Container(
                    padding: EdgeInsets.only(top: 20,bottom: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white
                    ),
                    width: 110,
                    child: Column(
                      children: [
                        Text('Daily',
                          style: GoogleFonts.poppins(fontSize: 15,),
                        ),
                        SizedBox(height:8),
                        Text(_amount,
                          style: GoogleFonts.poppins(fontSize: 25,),
                        ),
                        SizedBox(height:8),
                        Text('Lorem ipsum',
                          style: GoogleFonts.poppins(color:Colors.blue,fontSize: 15,),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width:15),
                  Container(
                    padding: EdgeInsets.only(top: 20,bottom: 20, left: 10, right: 10),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Theme.of(context).accentColor
                    ),
                    width: 110,
                    child: Column(
                      children: [
                        Text('Daily',
                          style: GoogleFonts.poppins(color:Colors.white,fontSize: 15,),
                        ),
                        SizedBox(height:8),
                        Text(_amount,
                          style: GoogleFonts.poppins(color:Colors.white,fontSize: 25,),
                        ),
                        SizedBox(height:8),
                        Text('Lorem ipsum',
                          style: GoogleFonts.poppins(color:Colors.white,fontSize: 15,),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),

                ],
              ),
              SizedBox(height:14),
              Text('Lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed ',
                style: GoogleFonts.poppins(color:Colors.blue,fontSize: 15,),
                textAlign: TextAlign.center,
              ),
              SizedBox(height:14),
              GestureDetector(
                onTap: () => _openModal(),
                child: Container(
                  height:60,
                  width:MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Color(0xFFF7B928),
                    borderRadius: BorderRadius.circular(5)
                  ),
                  alignment: Alignment.center,
                  child: Text('Choose a plan',
                  style: GoogleFonts.poppins(color: Colors.white),),
                ),
              ),
              SizedBox(height:24),
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

  void _openModal(){
    showModalBottomSheet(context: context, builder: (context) {
      return Container(
        // margin: EdgeInsets.only(right: 15, left: 15),
        padding: EdgeInsets.only(top: 24,bottom: 17, left: 29, right: 29),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(14),
                topLeft: Radius.circular(14)
            ),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(.25),
                  blurRadius: 3
              )
            ]
        ),
        height: 180,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text('Pay Via',
              style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w600),),
            SizedBox(height:17),
            Container(
              padding: EdgeInsets.only(bottom: 20),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Colors.black.withOpacity(.25), width: 1.0)
                )
              ),
              child: GestureDetector(
                onTap: () {
                    _openPopup();
                    // Navigator.of(context).pop();
                },
                child: Row(
                  children: [
                    ImageIcon(AssetImage('assets/images/wallet_2.png'),color: Theme.of(context).primaryColor, ),
                    SizedBox(width:10,),
                    Text('Wallet',
                      style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w400),)
                  ],
                ),
              )
            ),
            SizedBox(height:10),
            Row(
              children: [
                ImageIcon(AssetImage('assets/images/card.png'),color: Color(0xFFF7B928) ),
                SizedBox(width:17,),
                Text('Credit Card',
                  style: GoogleFonts.poppins(fontSize: 17,fontWeight: FontWeight.w400),)
              ],
            ),
          ],
        ),
      );
    });
  }

  void _openPopup(){
    showDialog(context: context, builder: (context) {
      return AlertDialog(
        title: Text('Are you sure?'),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
          TextButton(
            child: Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    });
  }
}