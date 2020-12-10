//to be
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'auth.dart';

class LoginPage extends StatefulWidget {
  LoginPage({this.auth, this.onSignedIn});
  final BaseAuth auth;
  final VoidCallback onSignedIn;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return new _LoginPageState();
  }
}

enum FormType { login, register }

class _LoginPageState extends State<LoginPage> {
  final formKey = new GlobalKey<FormState>();
  String _email;
  String _password;
  FormType _formType = FormType.login;

  bool validateAndSave() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      return true;
    }

    return false;
  }

  void validateAndSubmit() async {
    if (validateAndSave()) {
      try {
        if (_formType == FormType.login) {
          String userId =
              await widget.auth.signInWithEmailAndPassword(_email, _password);
          print("signed in: $userId");
        } else {
          String userId = await widget.auth
              .createUserWithEmailAndPassword(_email, _password);
          print("Registered user: $userId");
        }
        // widget.onSignedIn;
      } catch (e) {
        print("error: $e");
      }
    }
  }

  void moveToRegister() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.register;
    });
  }

  void moveToLogin() {
    formKey.currentState.reset();
    setState(() {
      _formType = FormType.login;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("Flutter login demo"),
      ),
      body: new Container(
          padding: EdgeInsets.all(16.0),
          child: new Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: _buildInputs() + _buildSubmitButtons(),
            ),
          )),
    );
  }

  List<Widget> _buildInputs() {
    return [
      new TextFormField(
        decoration: InputDecoration(labelText: "Email"),
        validator: (value) =>
            value.isEmpty || !value.contains("@") ? "Incorrect email" : null,
        onSaved: (value) => _email = value,
      ),
      new TextFormField(
        decoration: InputDecoration(labelText: "Password"),
        obscureText: true,
        validator: (value) => value.length < 5 ? "Password too short" : null,
        onSaved: (value) => _password = value,
      ),
    ];
  }

  List<Widget> _buildSubmitButtons() {
    if (_formType == FormType.login) {
      return [
        RaisedButton(
          child: Text("Login", style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        FlatButton(
          child:
              Text("Create an account", style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToRegister,
        )
      ];
    } else {
      return [
        RaisedButton(
          child: Text("Register", style: TextStyle(fontSize: 20.0)),
          onPressed: validateAndSubmit,
        ),
        new FlatButton(
          child: Text("Already registered? Login",
              style: new TextStyle(fontSize: 20.0)),
          onPressed: moveToLogin,
        )
      ];
    }
  }
}
