import 'package:edtech/main.dart';
import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GraphQLConfiguration {

  static String token;
  Future <void>  getToken() async {
    SharedPreferences prefs = await MyApp.prefs;
     token = prefs.getString('token');
  }

  static HttpLink httpLink = HttpLink(
      uri: 'https://countries.trevorblades.com/',
  );


  ValueNotifier<GraphQLClient> client = ValueNotifier(
    GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
    ),
  );

  GraphQLClient clientToQuery() {
    return GraphQLClient(
      link: httpLink,
      cache: OptimisticCache(dataIdFromObject: typenameDataIdFromObject),
      // cache: InMemoryCache(),
    );
  }
}