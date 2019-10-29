import 'package:flutter/material.dart';
import 'package:demo/ui/widgets/common.dart' as common;
import 'package:demo/ui/widgets/custom.dart' as custom;
import 'package:provider/provider.dart';
import 'package:demo/data/schedule.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomepage(),
    );
  }
}

class MyHomepage extends StatefulWidget {
  @override
  _MyHomepageState createState() => _MyHomepageState();
}

class _MyHomepageState extends State<MyHomepage> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: ChangeNotifierProvider(
        builder: (context) => MySchedule(),
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Flexible(
                flex: 1,
                child: common.Titulo(),
              ),
              /*Flexible(
                flex: 2,
                child: bottom.Bottom(),
              ),*/
              Flexible(
                flex: 6,
                child: custom.Photo(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
