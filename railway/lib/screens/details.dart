//this screen is for details of train and ui
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:railway/data/trains.dart';
import 'package:railway/screens/book_tkt.dart';
import 'package:railway/widgets/button.dart';
import 'package:railway/widgets/text.dart';

class DetailsPage extends StatefulWidget {
  Trains train;
  @override
  DetailsPage(this.train);
  _DetailsPageState createState() => _DetailsPageState(this.train);
}

class _DetailsPageState extends State<DetailsPage> {
  //final String from, to;
  Trains _train;
  _DetailsPageState(this._train);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
            child: Column(
          children: [
            Row(
              children: [
                //image

                CustomText(_train.source),
                Icon(Icons.train),
                CustomText(_train.destination),
                CustomButton("Book Ticket", BookTicket(_train))
              ],
            ),
          ],
        )),
      ),
      //appBar: AppBar(title: Text(""),),
    );
  }
}
