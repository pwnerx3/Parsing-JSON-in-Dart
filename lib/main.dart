import 'package:flutter/material.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

void main() => runApp(MyApp());

var dndguide;

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

class _MyHomePageState extends State<MyHomePage> {

  Future<String> _loadAsset() async {
    return await rootBundle.loadString('assets/data/HDARG.json');
  }

  Future loadjson() async {
    String jsonString = await _loadAsset();
    final jsonResponse = json.decode(jsonString);
    dndguide = jsonResponse;
  }

  @override
  Widget build(BuildContext context) {
    loadjson();
    var scrollcontroller;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: MediaQuery.of(context).size.height - 24,
              margin: EdgeInsets.only(top: 24.0),
              width: MediaQuery.of(context).size.width * .90,
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                controller: scrollcontroller,
                scrollDirection: Axis.vertical,
                child: Text(dndguide.toString()),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
