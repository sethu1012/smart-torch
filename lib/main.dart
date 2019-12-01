import 'package:flutter/material.dart';
import 'package:torch/torch.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

void main() => runApp(App());

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  bool hasTorch = false;
  bool torchState = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _detectTorch();
  }

  _detectTorch() async {
    hasTorch = await Torch.hasTorch;
    torchState = false;
  }

  _turnOnTorch() {
    setState(() {
      torchState = true;
    });
    Torch.turnOn();
  }

  _turnOffTorch() {
    setState(() {
      torchState = false;
    });
    Torch.turnOff();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: Scaffold(
        backgroundColor: Colors.blueGrey.shade400,
        body: SafeArea(
          child: Center(
            child: IconButton(
              icon: Icon(torchState ? FontAwesomeIcons.solidLightbulb : FontAwesomeIcons.lightbulb),
              color: Colors.white,
              iconSize: 100.0,
              onPressed: () {
                if (hasTorch) {
                  torchState ? _turnOffTorch() : _turnOnTorch();
                }
              }
            ),
          ),
        ),
      ),
    );
  }
}