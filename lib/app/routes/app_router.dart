import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "View")

class AppRouter extends $AppRouter {

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

  @override
  final List<AutoRoute> routes = [
        AutoRoute(page: SplashViewRoute.page, initial: true),
        AutoRoute(page: HomeViewRoute.page)
      ];
}