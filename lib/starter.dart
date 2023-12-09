import 'package:flavor/flavor.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/app/app.dart';

const String SETTINGS_BOX = 'settings';

const String logLevelKey = "5";

launchApp() async {

  final logLevel = Flavor.I.getInt(logLevelKey);

  if (kDebugMode) {
    debugPrint("LogLevel set for this flavor: $logLevel");
  }

  if (Flavor.I.isDevelopment) {
    debugPrint("Development mode");
  }
  
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle.light,
  );

  await Hive.initFlutter();
  await Hive.openBox(SETTINGS_BOX);
  runApp(const ToDoApp());
}