// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/app/routes/app_router.gr.dart';
import 'package:to_do_app/app/services/model/task_model.dart';
import 'package:to_do_app/core/constants/config.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/core/widgets/bottom_sheet_widget.dart';
import 'package:http/http.dart' as http;
import 'package:to_do_app/core/widgets/toast_message_widget.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  late String userId;
  final TextEditingController searchController = TextEditingController();
  List<Task>? taskList;
  var isSelected = false;
  int? taskCount;

  @override
  void initState() {
    super.initState();
    openBox();
  }

  void openBox() async {
    var box = await Hive.openBox('settings');
    var myToken = box.get('token');
    if (myToken != null && myToken.isNotEmpty) {
      Map<String, dynamic> JwtDecodedToken =
          JwtDecoder.decode(myToken); // tokeni decode etti
      userId = JwtDecodedToken[
          '_id']; // tokendan userId'yi aldik, userController'da token içeriği var, login yaparken tokeni olusturduk ya (tokenData = { _id: user._id, email: user.email };)
      getTaskList(
          userId); // userId'yi aldiktan sonra getTaskList'i cagirdik eğer task varsa taskList'e atacak
    } else {
      context.router.popAndPush(const SignInViewRoute());
      //showToast(context, "Something went wrong!\nPlease login again!");
    }
  }

  void isTaskSelected() {
    setState(() {
      isSelected = !isSelected;
    });
  }

  void searchFunction(String query) async {}

  // Task listesini getirmek için userId'ye göre görevleri getiriyoruz
  void getTaskList(userId) async {
    // Hangi kullanıcıya ait görevleri getirmek için userId'yi body'de gönderiyoruz
    var taskBody = {
      "userId": userId,
    };

    // Görevleri getirmek için post request atıyoruz
    var response = await http.post(Uri.parse(getTask),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(taskBody));

    // Eğer görevler getirilirse
    if (response.statusCode == 200) {
      var jsonResponse = jsonDecode(response.body);
      var tasksJson = jsonResponse['success'] as List;
    //  showToast(context, "Something went wrong!\nPlease login again!");

      // Görevleri taskList'e atıyoruz
      setState(() {
        taskList =
            tasksJson.map((taskJson) => Task.fromJson(taskJson)).toList();
        taskCount = taskList!.length;
      });
    } else {
      //showToast(context, "Something went wrong!\nPlease login again!");
    }
  }

  // Task id'sine göre görevi silmek için
  void deleteTaskById(String taskId) async {
    // Silinecek görevin id'sini alıyoruz
    var taskBody = {
      "id": taskId,
    };

    // Görevi silmek için post request atıyoruz
    var response = await http.post(Uri.parse(deleteTask),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(taskBody));

    // Eğer görev silinirse
    if (response.statusCode == 200) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Görev silindi'),
          duration: Duration(seconds: 2),
        ),
      );
      // Task listesini güncellemek için getTaskList'i tekrar çağırıyoruz
      getTaskList(userId);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Görev silinemedi'),
          duration: Duration(seconds: 2),
        ),
      );
      // showToast(context, "Something went wrong!\nPlease login again!");
    }
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
                          ? Center(
                              child: Text(
                                  "No task found!\nHenüz bir görev yok!",
                                  style: TextStyle(
                                      color:
                                          Themes.textColor.withOpacity(0.6))),
                            )
                          : SizedBox(
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: ListView.builder(
                                  itemCount: taskList!.length,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      children: [
                                        Dismissible(
                                          key: Key(taskList![index]
                                              .id), // Key'i görevin id'si olarak belirledik
                                          onDismissed: (direction) {
                                            // Öğe kaydırıldığında yapılacak işlemler
                                            setState(() {
                                              // Görevi taskList'ten kaldırıyoruz. Bu sayede görev silindiğinde görev listesi güncellenmiş oluyor
                                              taskList!.removeAt(index);
                                              // Görevi silmek için deleteTaskById'i çağırıyoruz ve görevin id'sini gönderiyoruz. Bu sayede servis ile görevi silmiş oluyoruz
                                              deleteTaskById(
                                                  taskList![index].id);
                                              getTaskList(userId);
                                            });
                                            // Silindiğine dair geri bildirim gösterelim
                                            ScaffoldMessenger.of(context)
                                                .showSnackBar(
                                              SnackBar(
                                                content: Text('Görev silindi'),
                                                duration: Duration(seconds: 2),
                                              ),
                                            );
                                          },
                                          direction: DismissDirection
                                              .endToStart, // Kaydırma yönü
                                          background: Container(
                                            decoration: BoxDecoration(
                                                color: Colors.red.shade900
                                                    .withOpacity(
                                                        .7), // Kaydırma arkaplan rengi
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight: Radius.circular(10),
                                                  bottomRight:
                                                      Radius.circular(10),
                                                )),
                                            child: const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 20),
                                              child: Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Padding(
                                                  padding: EdgeInsets.only(
                                                      right: 8.0),
                                                  child: Icon(Icons.delete,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ),
                                          ),
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 10),
                                            child: ListTile(
                                              title: Text(
                                                  taskList![index].title,
                                                  style: TextStyle(
                                                      decoration: isSelected
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                      color: Themes.textColor,
                                                      fontSize: 22,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              subtitle: Text(
                                                  taskList![index].description,
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  style: TextStyle(
                                                      decoration: isSelected
                                                          ? TextDecoration
                                                              .lineThrough
                                                          : TextDecoration.none,
                                                      color: Themes.textColor
                                                          .withOpacity(0.5),
                                                      fontSize: 15,
                                                      fontWeight:
                                                          FontWeight.bold)),
                                              trailing: GestureDetector(
                                                onTap: () {
                                                  isTaskSelected();
                                                },
                                                child: Container(
                                                  width: 30,
                                                  height: 30,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            100),
                                                    border: Border.all(
                                                        color: Themes
                                                            .buttonColor
                                                            .withOpacity(0.8),
                                                        width: 1.5),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(5),
                                                    child: isSelected
                                                        ? Icon(Icons.check,
                                                            color: Themes
                                                                .buttonColor,
                                                            size: 15)
                                                        : const SizedBox(),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          color:
                                              Themes.textColor.withOpacity(0.2),
                                          thickness: 1,
                                        ),
                                      ],
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
              Container(width: 45),
              Text(
                taskCount.toString() + " Not",
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
