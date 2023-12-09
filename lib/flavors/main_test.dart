import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/starter.dart';

Future<void> main(List<String> args) async {

  Flavor.create(
    Environment.dev,
    color: Colors.red,
    name: "Test",
    properties: {
      Keys.appTitle: "Test",
      logLevelKey: 1,
    },
  );
  launchApp();
}