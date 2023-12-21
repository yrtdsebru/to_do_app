import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';


// AutoRouterConfig sınıfını kullanarak rota isimlerindeki "View" kelimesini kaldırıyoruz.
@AutoRouterConfig(replaceInRouteName: "View")

class AppRouter extends $AppRouter {

  // Rotalar arasındaki geçişleri özelleştiriyoruz.
  @override
  RouteType get routeType => RouteType.custom(
        durationInMilliseconds: 300,
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: animation,
            child: child,
          );
        },
  );

  // Uygulamanın rotalarını tanımlıyoruz.
  @override
  final List<AutoRoute> routes = [
        AutoRoute(page: SplashViewRoute.page, initial: true),
        AutoRoute(page: RegistrationViewRoute.page),
        AutoRoute(page: SignInViewRoute.page),
        AutoRoute(page: HomeViewRoute.page),
      ];
}