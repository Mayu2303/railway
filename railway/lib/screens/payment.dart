//this screen is for payment page
//import 'dart:html';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:railway/data/passenger.dart';
import 'package:railway/data/trains.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:railway/widgets/button.dart';

class Payment extends StatefulWidget {
  Passenger passenger;
  Trains train;
  Payment(this.passenger, this.train);
  @override
  _PaymentState createState() => _PaymentState(this.passenger, this.train);
}

class _PaymentState extends State<Payment> {
  Trains _train;
  Passenger _passenger;
  _PaymentState(this._passenger, this._train);
  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
      children: [
        SizedBox(
          child: Text("$_passenger ->  $_train"),
          height: 150,
          width: 150,
        ),

        //addpassenger(_passenger,_train)
        //CustomButton(text, page)
        FlatButton(
            onPressed: () {
              //addpassenger(_passenger, _train);
              setState(() {
                addpassenger(_passenger, _train);
              });
            },
            child: null)
      ],
    ));
  }
}

//void check()

void addpassenger(Passenger passenger, Trains train) {
  CollectionReference collectionReference =
      Firestore.instance.collection("bookings");
  List<DocumentSnapshot> documents;
  collectionReference.snapshots().listen((snapshots) {});
  print(documents);
  //return true;
  //if(collectionReference.document.toString() == train.trainName)
  /* for (var i = 0; i < .length; i++) {
      if (_trainList[i]
          .source
          .contains(new RegExp(source, caseSensitive: false)))
*/
  //List<document>
}

class Pay extends StatefulWidget {
  @override
  _PayState createState() => _PayState();
}

class _PayState extends State<Pay> {
  CollectionReference collectionReference =
      Firestore.instance.collection("bookings");

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
