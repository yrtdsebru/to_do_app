// ignore_for_file: use_build_context_synchronously

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:to_do_app/app/l10n/app_localizations.dart';
import 'package:to_do_app/app/routes/app_router.gr.dart';
import 'package:to_do_app/app/views/view_signin/dashboard.dart';
import 'package:to_do_app/core/constants/app_colors.dart';

@RoutePage()
class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 5), () async {
      var box = await Hive.openBox('settings');
      var token = box.get('token');
      token != null && !JwtDecoder.isExpired(token)
          ? Navigator.push(
              context, MaterialPageRoute(builder: (context) => Dashboard(token: token)))
          : context.router.push(const SignInViewRoute());
    });

    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              L10n.of(context)!.splashLogo,
              style: const TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w900,
                color: AppColors.white,
              ),
            ),
            const SizedBox(height: 30),
            const CircularProgressIndicator(
              color: AppColors.white,
            ),
          ],
        ),
      ),
    );
  }
}
