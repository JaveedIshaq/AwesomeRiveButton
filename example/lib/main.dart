import 'dart:async';

import 'package:awesome_rive_buttons/awesome_rive_buttons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String _platformVersion = 'Unknown';

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    String platformVersion;
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await AwesomeRiveButtons.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Column(
            children: [
              //Text('Running on: $_platformVersion\n'),
              Container(
                padding: EdgeInsets.all(20.0),
                child: Card(
                  elevation: 10,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Text('This is a sample card'),
                    ),
                  ),
                ),
                width: double.infinity,
              ),
              Container(
                margin: EdgeInsets.all(30.0),
                color: Colors.lightBlue,
                width: double.infinity,
                height: 100,
                child: CircularAwesomeRiveButton(
                  pause: false,
                  onPress: () {
                    print("on press is fired");
                  },
                ),
              ),
              Container(
                width: double.infinity,
                height: 150,
                child: RectangularAwesomeRiveButton(
                  onPress: () {
                    print('Rectangular button is clicked');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
