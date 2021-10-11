
// import 'package:edtech/graphQLConf.dart';
import 'package:edtech/core/graphql.dart';
import "package:flutter/material.dart";
import 'package:dio/dio.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  WelcomeScreenState createState() {
    return WelcomeScreenState();
  }
}

class WelcomeScreenState extends State<WelcomeScreen> {
  // var Client = http.Client();
  bool loaded = false;
 
  // @override
  var container;

  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
    if(loaded == false) {
      doFetch();
      setState(() {
      
        loaded = true;
        // print(loaded.toString());
      });
      // print(loaded.toString());
    }
  }
  doFetch() {
      var content = Query(
          options: QueryOptions(
              document: gql(getCountry), pollInterval: Duration(seconds: 1)
              // document: getUsers.getCountry(),pollInterval: 10
              ),
          builder: (QueryResult result,
              {VoidCallback? refetch, FetchMore? fetchMore}) {
            // return ListView.builder(
            //     itemCount: result.data.length,
            // );

            if (result.isLoading) {
              return Text('Loading');
            }
            if (result.hasException) {
              print(result.exception.toString());
              return Container(
                padding: EdgeInsets.only(top: 90),
                child: Text(
                  result.exception.toString(),
                  style: TextStyle(color: Colors.white),
                ),
              );
            }
            // prefs.getString('token')
            print(result.data);
            var people = result.data!['schools'];

            // setState(() {
              loaded = true;
            // });
            return ListView.builder(
                itemCount: people.length,
                itemBuilder: (context, index) {
                  dynamic repository = people[index];

                  return Text(
                    repository['name'],
                    style: TextStyle(color: Colors.white),
                  );
                });
            // Container(
            //   padding: EdgeInsets.only(top: 90),
            //   child: Text(result.data['countries'][0],style: TextStyle(color: Colors.white),),
            // );

            // if (result.loading) {
            //   return SizedBox(height: 300,
            //     child: Text('loading',style: TextStyle(color: Colors.white),),);
            // }
            // if(result.hasException){
            //   return SizedBox(
            //     height: 100,
            //     child: Text(result.exception.toString(),style: TextStyle(color: Colors.white),),
            //   );
            // }else {
            //   return Text(result.data);
            // }

            // print(result.data.data);
            // return Container(
            //   padding: EdgeInsets.only(top: 90),
            //   child: Text('Grapql',style: TextStyle(color: Colors.white),),
            // );

            //       // if (result.hasException) {
            //       //   return Text(result.exception.toString());
            //       // }
            //       //
            //       // if (result.loading) {
            //       //   return Text('Loading');
            //       // }
            //     // return ListView.builder(itemBuilder: null);
          });
          container = content;
      return container;
    
  }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).accentColor,
      body: container,
    );
  }
}
