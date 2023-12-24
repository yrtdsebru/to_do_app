// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:to_do_app/app/views/view_home/home_view.dart' as _i2;
import 'package:to_do_app/app/views/view_registration/registration_view.dart'
    as _i3;
import 'package:to_do_app/app/views/view_signin/signin_view.dart' as _i4;
import 'package:to_do_app/app/views/view_splash/splash_view.dart' as _i5;
import 'package:to_do_app/app/views/view_task/task_view.dart' as _i6;

abstract class $AppRouter extends _i7.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    HomeViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i2.HomeView(),
      );
    },
    RegistrationViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.RegistrationView(),
      );
    },
    SignInViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.SignInView(),
      );
    },
    SplashViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i5.SplashView(),
      );
    },
    TaskViewRoute.name: (routeData) {
      return _i7.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i6.TaskView(),
      );
    },
  };
}

/// generated route for
/// [_i1.DetailView]
class DetailViewRoute extends _i7.PageRouteInfo<void> {
  const DetailViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          DetailViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'DetailViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i2.HomeView]
class HomeViewRoute extends _i7.PageRouteInfo<void> {
  const HomeViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          HomeViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i3.RegistrationView]
class RegistrationViewRoute extends _i7.PageRouteInfo<void> {
  const RegistrationViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          RegistrationViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegistrationViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i4.SignInView]
class SignInViewRoute extends _i7.PageRouteInfo<void> {
  const SignInViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SignInViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SignInViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i5.SplashView]
class SplashViewRoute extends _i7.PageRouteInfo<void> {
  const SplashViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          SplashViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}

/// generated route for
/// [_i6.TaskView]
class TaskViewRoute extends _i7.PageRouteInfo<void> {
  const TaskViewRoute({List<_i7.PageRouteInfo>? children})
      : super(
          TaskViewRoute.name,
          initialChildren: children,
        );

  static const String name = 'TaskViewRoute';

  static const _i7.PageInfo<void> page = _i7.PageInfo<void>(name);
}
