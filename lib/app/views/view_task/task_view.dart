// ignore_for_file: use_build_context_synchronously
import 'dart:convert';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intl/intl.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/core/constants/config.dart';

@RoutePage()
class TaskView extends StatefulWidget {
  const TaskView({super.key});

  @override
  State<TaskView> createState() => _TaskViewState();
}

class _TaskViewState extends State<TaskView> {
  late String userId;
  final TextEditingController title = TextEditingController();
  final TextEditingController description = TextEditingController();


  String currentDateTime =
      DateFormat('dd MMMM yyyy HH:mm').format(DateTime.now());

  @override
  void initState() {
    super.initState();
    openBox();
  }

  void openBox() async {
    var box = await Hive.openBox('settings');
    var myToken = box.get('token');
    Map<String, dynamic> JwtDecodedToken = JwtDecoder.decode(myToken); // tokeni decode etti
    userId = JwtDecodedToken['_id']; // tokendan userId'yi aldik, userController'da token içeriği var, login yaparken tokeni olusturduk ya (tokenData = { _id: user._id, email: user.email };)
    setState(() {});
  }
  
  void addTask() async {
    if (title.text.isNotEmpty || description.text.isNotEmpty) {
      print("Title: ${title.text}");
      print("Description: ${description.text}");

      var taskBody = {  // to do controllerda const { userId,title, desc } = req.body;
        "userId": userId,
        "title": title.text,
        "desc": description.text
        // "date": currentDateTime
      };

      var response = await http.post(Uri.parse(createTask),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode(taskBody));

      var jsonResponse = jsonDecode(response.body);

      print(jsonResponse['status']);

      if (jsonResponse['status']) {
        title.clear();
        description.clear();
        context.router.pop();
      } else {
        print("Something went wrong");
      }
    } else {
      print("Please fill fields");
    }
  }

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
                addTask();
              },
              child: Text(L10n.of(context)!.done,
                  style: TextStyle(
                      color: Themes.buttonColor.withOpacity(0.8),
                      fontSize: 15,
                      fontWeight: FontWeight.bold)),
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
                      style:
                          TextStyle(color: Themes.textColor.withOpacity(0.6))),
                ),
                TextField(
                  controller: title,
                  maxLines: 1,
                  decoration: InputDecoration(
                    hintText: L10n.of(context)!.title,
                    hintStyle:
                        TextStyle(color: Themes.textColor.withOpacity(0.7)),
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
                    hintStyle:
                        TextStyle(color: Themes.textColor.withOpacity(0.7)),
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
