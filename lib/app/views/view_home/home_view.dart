import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/app/routes/app_router.gr.dart';
import 'package:to_do_app/core/theme/theme.dart';

@RoutePage()
class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final TextEditingController searchController = TextEditingController();

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
                  // context.router.push(const SignInViewRoute());
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
                        color: Colors.transparent.withOpacity(0.2),
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
                    const Center(
                      child: Text("Home"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Container(
          width: double.infinity,
          height: 60,
          decoration: BoxDecoration(color: Colors.transparent.withOpacity(0.2)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(),
              Text(
                "           " + "59 Not",
                style: TextStyle(
                  color: Themes.bgTextColor,
                  fontSize: 14,
                ),
              ),
              IconButton(
                onPressed: () {
                  context.router.push(const TaskViewRoute());
                },
                icon: Icon(Icons.note_add_rounded,
                    color: Themes.buttonColor.withOpacity(0.8), size: 35),
              ),
            ],
          ),
        ),
      ],
    ));
  }
}
