import 'package:flavor/flavor.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/starter.dart';
import 'package:to_do_app/app/routes/app_router.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({Key? key}) : super(key: key);

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: Hive.box(SETTINGS_BOX).listenable(),
      builder: (context, box, child) {
        final isDark = box.get('isDark', defaultValue: false);
        final isTr = box.get('isTr', defaultValue: false);
        return FlavorBanner(
          child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                brightness: isDark ? Brightness.dark : Brightness.light,
              ),
              routerConfig: _appRouter.config()),
        );
      },
    );
  }
}
