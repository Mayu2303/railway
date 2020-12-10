//to be
import 'package:flutter/material.dart';
import 'auth.dart';

class HomePage extends StatelessWidget {
  HomePage({this.auth, this.onSignedOut});
  BaseAuth auth;
  VoidCallback onSignedOut;

  void _signOut() async {
    try {
      await auth.signOut();
      onSignedOut();
    } catch (e) {}
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome"),
        actions: <Widget>[
          FlatButton(
            child: Text("Log out",
                style: TextStyle(
                  fontSize: 17.0,
                  color: Colors.white,
                )),
            onPressed: _signOut,
          )
        ],
      ),
      body: Container(
        child: Text("Welcome"),
      ),
    );
  }
}
