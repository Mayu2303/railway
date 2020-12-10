import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:railway/data/trains.dart';
import 'package:railway/screens/payment.dart';
import 'package:railway/widgets/input.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';
import 'package:railway/data/passenger.dart';
import 'package:railway/widgets/text.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railway/widgets/button.dart';

//val db = Firebase.firestore;
//val db = Firebase.firestore;
DocumentReference dr;

class BookTicket extends StatefulWidget {
  BookTicket(this.train);
  final Trains train;

  @override
  _BookTicketState createState() => _BookTicketState(this.train);
}

class _BookTicketState extends State<BookTicket> {
  _BookTicketState(this.train);
  Trains train;
  //include train details in ui
  Passenger passenger;
  TextEditingController name = new TextEditingController();
  TextEditingController age = new TextEditingController();
//TextEditingController from = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        /*InputField(
                  hint: "From", controller: from, obscure: false, text: _from),
           */
        InputField(hint: "Enter Name", controller: name, obscure: false),

        InputField(
          hint: "Enter Age",
          controller: age,
          obscure: false,
        ),
        //InputField(hint: null, controller: null, obscure: null, text: null)
        /* DropDownFormField(
          hintText: "Gender",
          onChanged: (value) {
            setState(() {
              passenger.gender = value;
            });
          },
          dataSource: [
            {"display": "Female", "value": "F"},
            {"display": "Male", "value": "M"}
          ],
        ),*/
        /*DropDownFormField(
          hintText: "Select Payment method",
          //onSaved: (value) {
          //    setState(() {
          //    passenger.paymentmode = value;
          //});
          //},
          onChanged: (value) {
            setState(() {
              passenger.paymentmode = value;
            });
          },
          dataSource: [
            {"display": "Card", "value": "Card"},
            {"display": "Net Banking", "value": "Net Banking"},
            //{
            //"display":"Net Banking",
            //"value":""
            //}
          ],
        ),*/
        //CustomText("$fare"),
        CustomButton("Pay", Payment(passenger, train))
      ],
    ));
  }
}
