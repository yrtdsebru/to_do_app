import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/app/routes/app_router.gr.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/starter.dart';

Future<dynamic> CustomButtomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
            height: 300,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            ),
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //theme selection
                  ValueListenableBuilder(
                      valueListenable: Hive.box(SETTINGS_BOX).listenable(),
                      builder: (context, box, child) {
                        final isDark = box.get('isDark', defaultValue: false);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              isDark
                                  ? const Icon(Icons.dark_mode)
                                  : const Icon(Icons.light_mode),
                              const SizedBox(
                                width: 40,
                              ),
                              Switch(
                                  value: isDark,
                                  onChanged: (val) {
                                    box.put('isDark', val);
                                  }),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  //language selection
                  ValueListenableBuilder(
                      valueListenable: Hive.box(SETTINGS_BOX).listenable(),
                      builder: (context, box, child) {
                        final isTr = box.get('isTr', defaultValue: false);
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                width: 55,
                                child: isTr
                                    ? Text(L10n.of(context)!.langTr,
                                        style:
                                            TextStyle(color: Themes.textColor))
                                    : Text(L10n.of(context)!.langEng,
                                        style:
                                            TextStyle(color: Themes.textColor)),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Switch(
                                  value: isTr,
                                  onChanged: (val) {
                                    box.put('isTr', val);
                                  }),
                            ],
                          ),
                        );
                      }),
                  const SizedBox(
                    height: 10,
                  ),
                  Divider(
                    color: Themes.iconColor,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                      onPressed: () {
                        Hive.box(SETTINGS_BOX)
                            .delete('token'); // Token'ı sil ve çıkış yap
                        context.router.popAndPush(const SignInViewRoute()); // Anasayfaya yönlendir
                      },
                      child: Text(
                        L10n.of(context)!.signOut,
                        style: TextStyle(color: Themes.textColor),
                      )),
                ],
              ),
            ));
      });
}
