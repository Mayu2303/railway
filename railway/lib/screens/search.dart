import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:railway/data/trains.dart';
import 'package:railway/data/search_train.dart';
import 'package:railway/screens/details.dart';
//import 'packagelib/data/search_train.dart';

String apikey = "1e056674988ab3c2040dfa5bf5e563ec";

class Search extends StatefulWidget {
  //final String from = ModalRoute.of(context).settings.arguments;
  // final SearchTrain line;
  final String to, from; //=new SearchTrain(null, null);
  @override
  //Search(line);
  //final Todo todo;
  Search(this.from, this.to); //: super(key: key);
  // In the constructor, require a Todo.
  //DetailScreen({Key key, @required this.todo}) : super(key: key);
  _SearchState createState() => _SearchState(this.from, this.to);
}

var trains = new Trains(null, null, null, null, null, null);

class _SearchState extends State<Search> {
  //List<Trains> trains[100];
  //final SearchTrain line;
  String _from, _to;
  // _SearchState({Key key, @required this.line}) : super(key: key);
  _SearchState(this._from, this._to);
//widget.line;
  //var data;
  //static var data;
  // SearchTrain line;
  //_SearchState(this.line);
  //var trains;
  /*Future<List<Trains>> getData() async {
    Map<String, dynamic> map;
    List<dynamic> data;
    var response = await http.get(
        Uri.encodeFull(
            "https://indianrailapi.com/api/v2/RajdhaniTrain/apikey/$apikey/"),
        headers: {"Accept": "application/json"});

    setState(() {
      //data = json.decode(response.body);
      //List trains = createNewsList(responseJson["response"]["results"]);
      //data = json.decode(response.body);
      //trains = data["TrainName"] as List;
      map = json.decode(response.body);
      data = map["Trains"];
      /*for (var i in data) {
        trains = new Trains(i);
      }*/
      //trains = Trains.fromJson(data);
      //print(data);
      // getList(data);
      print(data[30]["TrainName"]);
      //List<dynamic>data=data[“Trains”];
      //print(data[0][“name”]);
      /*debugPrint("here 1");
      print(trains);
      print(data.runtimeType);*/
      //getList(data);
    });
    return data.map((e) => Trains.fromJson(e)).toList();
  }*/

  List<Trains> _trainList = new List<Trains>();

  Future<List<Trains>> getData() async {
    //print(line);
    //  List<dynamic> data;
    Map<String, dynamic> map;
    List<dynamic> values;
    final response = await http
        .get("https://indianrailapi.com/api/v2/RajdhaniTrain/apikey/$apikey/");

    if (response.statusCode == 200) {
      // If the call to the server was successful, parse the JSON
      //List<dynamic> values = new List<dynamic>();
      //values = json.decode(response.body);
      //data = values['Trains'];
      map = json.decode(response.body);
      values = map["Trains"];
      // print(values[1]);
      if (values.length > 0) {
        for (int i = 0; i < values.length; i++) {
          if (values[i] != null) {
            Map<String, dynamic> map = values[i];
            _trainList.add(Trains.fromJson(map));
            //debugPrint('Id-------${map['id']}');
          }
        }
      }
      //print("source");
      //print(_trainList[1].arrival);
      //find();
      //find(_from);
      return _trainList;
    } else {
      // If that call was not successful, throw an error.
      throw Exception('Failed to load post');
    }
  }
  // debugPrint(_trainList[9]);

  @override
  void initState() {
    super.initState();
    getData();
    //find(_from);
  }
//String _textFromFile = "";

  /*_StatefulWidgetDemoState() {
    _buildlist(find(_from)) => setState(() {
          // _textFromFile = val;
        });
  }*/

  @override
  Widget build(BuildContext context) {
    //widget.line;
    return Scaffold(
      appBar: AppBar(
        title: Text("Trains"),
      ),
      //body: Column(
      /* children: <Widget>[
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: .length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 50,
                  margin: EdgeInsets.all(2),
                  color: msgCount[index]>=10? Colors.blue[400]:
                    msgCount[index]>3? Colors.blue[100]: Colors.grey,
                  child: Center(
                    child: Text('${names[index]} (${msgCount[index]})',
                      style: TextStyle(fontSize: 18),
                    )
                  ),
                
                );
              })
        )]*/
      // children: [
      // Text("here"),
      //find(_from)
      //],
      //)
      /* body: FutureBuilder<List>(  
        future:   
        initialData: List(),  
        builder: (context, snapshot) {  
            return snapshot.hasData ?  
             new ListView.builder(  
              padding: const EdgeInsets.all(10.0),  
              itemCount: snapshot.data.length,  
              itemBuilder: (context, i) {  
                return _buildRow(snapshot.data[i]);  
              },  
            )  
    )*/
      body: _buildlist(find(_from)),
    );
    //_buildlist(find(_from)));
    /*setState(() {
          
        });*/
  }

  Future<Widget> result() async {
    return _buildlist(find(_from));
  }

  List<Trains> find(_from) {
    String source = _from;
    List<Trains> req = List<Trains>();
    //print(source);
    //String
    //Trains temp;
    for (var i = 0; i < _trainList.length; i++) {
      if (_trainList[i]
          .source
          .contains(new RegExp(source, caseSensitive: false))) {
        // print(_trainList[i]);
        //var json = jsonEncode(_trainList[i]);
        //temp = Trains.fromJson(_trainList[i]);
        //Map<String, dynamic> map = json; //_trainList[i];
        //req.add(Trains.fromJson(map));
        //debugPrint('Id-------${map['id']}')
        req.add(_trainList[i]);
        //print("req");
        ///print(req);
      }
      //if (req.len) print("sorry train not found");
      //return req;
    }
    return req;
  }
}

ListView _buildlist(List<Trains> req) {
  return ListView.builder(
    itemCount: req.length,
    itemBuilder: (_, index) {
      return ListTile(
        title: Text(req[index].source + " -> " + req[index].destination),
        onTap: () {
          Navigator.push(_,
              MaterialPageRoute(builder: (context) => DetailsPage(req[index])));
        },
      );
    },
  );
}

/*return FutureBuilder(
    future: ,
    initialData: InitialData,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ;
    },
  ),
    */

Widget _buildRow(Trains train) {
  return new ListTile(
    title: new Text(train.trainName),
  );

/*FutureBuilder(
  future: find(_from),
  initialData: InitialData,
  builder: (BuildContext context, AsyncSnapshot snapshot) {
    return ;
  },
),*/
}
/*
Future<Widget> result() async{
    return _buildlist(find(_from));
  }

  List<Trains> find(_from) {
    String source = _from;
    List<Trains> req = List<Trains>();
    //print(source);
    //String
    //Trains temp;
    for (var i = 0; i < _trainList.length; i++) {
      if (_trainList[i]
          .source
          .contains(new RegExp(source, caseSensitive: false))) {
        // print(_trainList[i]);
        //var json = jsonEncode(_trainList[i]);
        //temp = Trains.fromJson(_trainList[i]);
        //Map<String, dynamic> map = json; //_trainList[i];
        //req.add(Trains.fromJson(map));
        //debugPrint('Id-------${map['id']}')
        req.add(_trainList[i]);
        //print("req");
        ///print(req);
      }
      //if (req.len) print("sorry train not found");
      //return req;
    }
    return req;
  }
}

ListView _buildlist(List<Trains> req) {
  return ListView.builder(
      itemCount: req.length,
      itemBuilder: (_, index) {
        return ListTile(
          title: Text(req[index].trainName),
        );
      });
  /*return FutureBuilder(
    future: ,
    initialData: InitialData,
    builder: (BuildContext context, AsyncSnapshot snapshot) {
      return ;
    },
  ),
    */
}
*/
