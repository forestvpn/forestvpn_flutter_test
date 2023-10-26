import 'package:auto_route/auto_route.dart';

import 'router.gr.dart';

export 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: '')
class AppRouter extends $AppRouter {
  AppRouter();

  @override
  RouteType get defaultRouteType => const RouteType.material();

  @override
  final List<AutoRoute> routes = [
    AutoRoute(
      page: NewsScreenRoute.page,
      path: '/',
    ),
    AutoRoute(
      page: OneNewsScreenRoute.page,
      path: '/oneNews',
    )
  ];
}

// flutter packages pub run build_runner build   - команда для билда
