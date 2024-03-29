// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i6;
import 'package:to_do_app/app/views/view_home/home_view.dart' as _i1;
import 'package:to_do_app/app/views/view_registration/registration_view.dart'
    as _i2;
import 'package:to_do_app/app/views/view_signin/signin_view.dart' as _i3;
import 'package:to_do_app/app/views/view_splash/splash_view.dart' as _i4;
import 'package:to_do_app/app/views/view_task/task_view.dart' as _i5;

abstract class $AppRouter extends _i6.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i6.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.HomeView(),
      );
    },
    RegistrationViewRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.RegistrationView(),
      );
    },
    SignInViewRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.SignInView(),
      );
    },
    SplashViewRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SplashView(),
      );
    },
    TaskViewRoute.name: (routeData) {
      return _i6.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.TaskView(),
      );
    },
  };
}

/// generated route for
/// [_i1.HomeView]
class HomeViewRoute extends _i6.PageRouteInfo<void> {
  const HomeViewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i2.RegistrationView]
class RegistrationViewRoute extends _i6.PageRouteInfo<void> {
  const RegistrationViewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          RegistrationViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationViewRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i3.SignInView]
class SignInViewRoute extends _i6.PageRouteInfo<void> {
  const SignInViewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SignInViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInViewRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SplashView]
class SplashViewRoute extends _i6.PageRouteInfo<void> {
  const SplashViewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          SplashViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashViewRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}

/// generated route for
/// [_i5.TaskView]
class TaskViewRoute extends _i6.PageRouteInfo<void> {
  const TaskViewRoute({List<_i6.PageRouteInfo>? children})
      : super(
          TaskViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskViewRoute';

  static const _i6.PageInfo<void> page = _i6.PageInfo<void>(name);
}
