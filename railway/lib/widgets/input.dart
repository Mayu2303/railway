import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

class InputField extends StatelessWidget {
  const InputField({
    @required this.hint,
    // this.hint=
    Key key,
    @required this.controller,
    @required this.obscure,
    //@required this.text
  }) : super(key: key);

  /*void _setText() { 
    setState(() { 
      text= titleController.text; 
    }); 3
  }*/
  //final SearchTrain line;
  //final String text;
  final TextEditingController controller;
  final String hint;
  final bool obscure;
  @override
  Widget build(BuildContext context) {
    var container = Container(
      // color: Colors.blue,
      // alignment: ,
      width: 200,
      height: 60,
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: Colors.blueGrey)),
        // borderRadius: BorderRadius.circular(10),
        // color: Colors.blue,
      ),
      padding: EdgeInsets.all(10),
      child: TextField(
        controller: controller,
        obscureText: obscure,
       // textDirection: TextDirection.ltr,
        decoration: InputDecoration(
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(5),
          hintText: '$hint',
        ),
        //onChanged: (value) => controller.text = value,
      ),
    );
    return container;
  }
}
