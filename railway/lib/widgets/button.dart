import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:railway/data/trains.dart';
import 'package:railway/screens/book_tkt.dart';

class CustomButton extends StatefulWidget {
  CustomButton(this.text, this.page);
  Widget page;
  Trains train;
  String text;
  @override
  _CustomButtonState createState() => _CustomButtonState(this.text, this.page);
}

class _CustomButtonState extends State<CustomButton> {
  _CustomButtonState(this.text, this.page);
  String text;
  Trains train;
  Widget page;
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
      ),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => page));
      },
    );
  }
}
