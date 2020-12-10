import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
// ignore: unused_import
import 'package:http/http.dart' as http;
import 'package:railway/screens/search.dart' as sp;
import 'package:railway/data/search_train.dart';
//import 'search.dart' as sp;
import 'package:railway/widgets/input.dart';

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  TextEditingController from = new TextEditingController();
  TextEditingController to = new TextEditingController();
  String _from, _to;
  SearchTrain tline;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SingleChildScrollView(
        //controller: controller,

        child: Center(
          child: Column(
            children: [
              AppBar(
                title: Text("Search Train"),
              ),
              InputField(hint: "From", controller: from, obscure: false),
              InputField(hint: "To", controller: to, obscure: false),
              SizedBox(
                height: 20,
                //width: ,
              ),
              FlatButton(
                  onPressed: () {
                    // _settext(from);
                    //_settext(to);
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                sp.Search(from.text, to.text)));
                  },
                  colorBrightness: Brightness.light,
                  color: Colors.blue,
                  minWidth: 200,
                  child: Text("Search"))
            ],
          ),
        ),
      ),
    );
  }
}

/*void _settext(controller) {
  SearchTrain line;
  if (controller == from) {
    line.from = controller.text;
  } else if(controller=="to"){
    line.to = controller.text;
  }
}*/
