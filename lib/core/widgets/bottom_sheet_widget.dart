import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/core/theme/theme.dart';
import 'package:to_do_app/starter.dart';

Future<dynamic> CustomButtomSheet(BuildContext context) {
  return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) => DraggableScrollableSheet(
          initialChildSize: 0.5, // Başlangıçta ekranın %20'sini kaplar
          maxChildSize: 0.8, // Maksimumda ekranın tamamını kaplar
          minChildSize: 0.2, // Minimumda ekranın %20'sini kaplar
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
                constraints: BoxConstraints(
                    maxHeight: MediaQuery.of(context).size.height * 1,
                    minHeight: 200),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Column(
                    children: [
                      //theme selection
                      ValueListenableBuilder(
                          valueListenable: Hive.box(SETTINGS_BOX).listenable(),
                          builder: (context, box, child) {
                            final isDark =
                                box.get('isDark', defaultValue: false);
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
                                            style: TextStyle(
                                                color: Themes.textColor))
                                        : Text(L10n.of(context)!.langEng,
                                            style: TextStyle(
                                                color: Themes.textColor)),
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
                      Divider(
                        color: Themes.iconColor,
                      ),
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            L10n.of(context)!.signOut,
                            style: TextStyle(color: Themes.textColor),
                          )),
                    ],
                  ),
                ));
          }));
}
