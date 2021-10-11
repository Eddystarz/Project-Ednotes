import 'package:flutter/material.dart';

class ProtectedScreenState extends StatelessWidget
{
  @override

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' Ednotes',
            style: TextStyle(color: Colors.black )),
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.black),
        // leading: Icon(Icons.menu, color: Colors.black)
      ),
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          children: <Widget>[
            Container(
              height:90,
              padding: EdgeInsets.all(0.0),
              child: ColoredBox(
                color: Colors.blue[900]!,
                child: Center(
                  child: Text('ED Tech',
                      style: TextStyle(color: Colors.white, fontSize: 20)),
                ),
              ),
            ),
            ListTile(
              title: Text('Dashboard'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Analytics'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: Text('Logout'),
              onTap: () {
                // Update the state of the app
                // ...
                // Then close the drawer
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}