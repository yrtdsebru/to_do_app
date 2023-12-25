import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/app/routes/app_router.gr.dart';
import 'package:to_do_app/core/constants/config.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/core/widgets/bottom_sheet_widget.dart';
import 'package:http/http.dart' as http;

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late String userId;
  final TextEditingController searchController = TextEditingController();
  List? taskList;
  var isSelected = false;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  void openBox() async {
    var box = await Hive.openBox('settings');
    var myToken = box.get('token');
    Map<String, dynamic> JwtDecodedToken =
        JwtDecoder.decode(myToken); // tokeni decode etti
    userId = JwtDecodedToken[
        '_id']; // tokendan userId'yi aldik, userController'da token içeriği var, login yaparken tokeni olusturduk ya (tokenData = { _id: user._id, email: user.email };)
    getTaskList(userId);
  }

  void isTaskSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  void searchFunction(String query) async {}

  void getTaskList(userId) async {
    var taskBody = {
      "userId": userId,
    };

    var response = await http.post(Uri.parse(getTask),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(taskBody));

    var jsonResponse = jsonDecode(response.body);
    taskList = jsonResponse['success'];

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                onPressed: () {
                  CustomButtomSheet(context);
                },
                icon: Icon(Icons.menu,
                    color: Themes.buttonColor.withOpacity(0.8), size: 35),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10, left: 10),
              child: Container(
                margin: const EdgeInsets.only(top: 15),
                child: Column(
                  children: [
                    Align(
                        alignment: Alignment.topLeft,
                        child: Text(L10n.of(context)!.allTasks,
                            style: TextStyle(
                                color: Themes.textColor,
                                fontSize: 30,
                                fontWeight: FontWeight.bold))),
                    const SizedBox(height: 20),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.transparent.withOpacity(0.05),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextField(
                        controller: searchController,
                        style: TextStyle(color: Themes.textColor),
                        cursorColor: Themes.textColor,
                        decoration: InputDecoration(
                          prefixIcon:
                              Icon(Icons.search, color: Themes.textColor),
                          hintText: L10n.of(context)!.search,
                          hintStyle: TextStyle(color: Themes.textColor),
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          // Perform search functionality heres
                        },
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: taskList == null
                          ? Container(
                              child: Center(
                                child: Text(L10n.of(context)!.password,
                                    style: TextStyle(
                                        color:
                                            Themes.textColor.withOpacity(0.6))),
                              ),
                            )
                          : Expanded(
                              child: ListView.builder(
                                  itemCount: taskList!.length,
                                  itemBuilder: (context, index) {
                                    return ListTile(
                                      title: Text(taskList![index]['title'],
                                          style: TextStyle(
                                              decoration: isSelected
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                              color: Themes.textColor,
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold)),
                                      subtitle: Text(taskList![index]['desc'],
                                          style: TextStyle(
                                              decoration: isSelected
                                                  ? TextDecoration.lineThrough
                                                  : TextDecoration.none,
                                              color: Themes.textColor
                                                  .withOpacity(0.5),
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      trailing: GestureDetector(
                                        onTap: () {
                                          isTaskSelected();
                                        },
                                        child: Container(
                                          width: 30,
                                          height: 30,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(100),
                                            border: Border.all(
                                                color: Themes.buttonColor
                                                    .withOpacity(0.8),
                                                width: 1.5),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5),
                                            child: isSelected
                                                ? Icon(Icons.check,
                                                    color: Themes.buttonColor,
                                                    size: 15)
                                                : const SizedBox(),
                                          ),
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 60,
          decoration:
              BoxDecoration(color: Colors.transparent.withOpacity(0.05)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                "           " + "59" +" Not",
                style: TextStyle(
                  color: Themes.textColor,
                  fontSize: 14,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.router.push(const TaskViewRoute());
                },
                icon: Icon(Icons.note_add_rounded,
                    color: Themes.buttonColor, size: 35),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
