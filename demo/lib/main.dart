import 'package:flutter/material.dart';
import 'package:demo/widgets/common.dart' as common;
import 'package:demo/widgets/custom.dart' as custom;
import 'package:demo/widgets/bottom.dart' as bottom;
import 'package:provider/provider.dart';
import 'package:demo/schedule.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
              Flexible(
                flex: 6,
                child: custom.Photo(),
              ),
              Flexible(
                flex: 2,
                child: bottom.Bottom(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
