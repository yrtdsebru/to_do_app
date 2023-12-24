import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/core/theme/theme.dart';

@RoutePage()
class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();

  String currentDateTime =
      DateFormat('dd MMMM yyyy HH:mm').format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {
                context.router.pop();
              },
              icon: Icon(Icons.arrow_back_ios,
                  color: Themes.buttonColor.withOpacity(0.8), size: 35),
            ),
            TextButton(
              onPressed: () {
                // context.router.push(const SignInViewRoute());
              },
              child: Text(L10n.of(context)!.done,
                  style: TextStyle(color: Themes.buttonColor.withOpacity(0.8), fontSize: 15, fontWeight: FontWeight.bold)),
            ),
          ],
        ),
        Container(
            padding: const EdgeInsets.all(10.0),
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Text(currentDateTime,
                      style: TextStyle(color: Themes.textColor.withOpacity(0.6))),
                ),
                TextField(
                  controller: title,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: L10n.of(context)!.title,
                    hintStyle: TextStyle(color: Themes.textColor.withOpacity(0.7)),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(
                      color: Themes.textColor,
                      fontSize: 30,
                      fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: description,
                  decoration: InputDecoration(
                    hintText: L10n.of(context)!.description,
                    hintStyle: TextStyle(color: Themes.textColor.withOpacity(0.7)),
                    border: InputBorder.none,
                  ),
                  style: TextStyle(color: Themes.textColor, fontSize: 25),
                ),
              ],
            )),
      ],
    ));
  }
}
