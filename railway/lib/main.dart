import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'screens/homepage.dart' as hp;
import 'screens/login_/registration.dart';
// ignore: unused_import
import 'screens/search.dart';
import 'screens/login_/auth.dart';
import 'screens/login_/root_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        title: Text("Railway Reservation"),
      ),*/
      //body: RootPage(auth: new Auth()),
      body: hp.Page(),
    );
  }
}

//class _Homepage
