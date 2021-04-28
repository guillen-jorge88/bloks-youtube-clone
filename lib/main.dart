import 'package:flutter/material.dart';

import '../src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '57Blocks YouTube Clone',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: TextTheme(
            bodyText1: TextStyle(
              fontSize: 14.0,
              color: Color.fromRGBO(33, 33, 33, 1.0),
            ),
            bodyText2: TextStyle(
              fontSize: 14.0,
              color: Color.fromRGBO(33, 33, 33, 1.0),
              fontWeight: FontWeight.bold,
            ),
            headline6: TextStyle(
              color: Color.fromRGBO(33, 33, 33, 1.0),
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/',
      routes: appRoutes(),
    );
  }
}
