import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/app/routes/app_router.gr.dart';
import 'package:to_do_app/core/constants/app_colors.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(
        const Duration(seconds: 5),
        () => AutoRouter.of(context)
            .replace(const RegistrationViewRoute()));
            
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
          child: Text(
        L10n.of(context)!.splashLogo,
        style: const TextStyle(
          fontSize: 50,
          fontWeight: FontWeight.w900,
          color: AppColors.white,
        ),
      )),
    );
  }
}
