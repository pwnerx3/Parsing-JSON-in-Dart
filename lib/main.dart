import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() {
  runApp(MyApp());
  debugPaintSizeEnabled = true;
}
//------------------------------------------------------------------------ All arrays & variables that will be used

List races;
List ractraits;
List rtdesc;
List traits;
List tdesc;
String test;
//------------------------------------------------------------------------ Fetches JSON and deals with anything related to it

//------------------------------------------------------------------------

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin {
  Future<String> _loadjson() async {
    var response = await rootBundle.loadString('assets/data/HDARG.json');

    setState(() {
      var extracteddata = json.decode(response);
      races = extracteddata['races'];
    });
  }

  @override
  void initState() {
    super.initState();
    _loadjson();
  }

//------------------------------------------------------------------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Parsed races'),
      ),
      body: Center(
        child: ListView.builder(
          itemCount: races == null ? 0 : races.length,
          itemBuilder: (BuildContext context, i) {
            return ListTile(
              title: Text(races[i]['name']),
              subtitle: Text(races[i]['bonusdescription']),
            );
          },
        ),
      ),
    );
  }
}
