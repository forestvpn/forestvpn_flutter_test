// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;
import 'package:forestvpn_test/features/news/view/news_screen.dart' as _i1;
import 'package:forestvpn_test/features/news/view/one_news_screen.dart' as _i2;

abstract class $AppRouter extends _i3.RootStackRouter {
  $AppRouter();

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    NewsScreenRoute.name: (routeData) {
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.NewsScreen(),
      );
    },
    OneNewsScreenRoute.name: (routeData) {
      final args = routeData.argsAs<OneNewsScreenRouteArgs>();
      return _i3.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.OneNewsScreen(
          key: args.key,
          newsID: args.newsID,
        ),
      );
    },
  };
}

/// generated route for
/// [_i1.NewsScreen]
class NewsScreenRoute extends _i3.PageRouteInfo<void> {
  const NewsScreenRoute({List<_i3.PageRouteInfo>? children})
      : super(
          NewsScreenRoute.name,
          initialChildren: children,
        );

  static const String name = 'NewsScreenRoute';

  static const _i3.PageInfo<void> page = _i3.PageInfo<void>(name);
}

/// generated route for
/// [_i2.OneNewsScreen]
class OneNewsScreenRoute extends _i3.PageRouteInfo<OneNewsScreenRouteArgs> {
  OneNewsScreenRoute({
    _i4.Key? key,
    required String newsID,
    List<_i3.PageRouteInfo>? children,
  }) : super(
          OneNewsScreenRoute.name,
          args: OneNewsScreenRouteArgs(
            key: key,
            newsID: newsID,
          ),
          initialChildren: children,
        );

  static const String name = 'OneNewsScreenRoute';

  static const _i3.PageInfo<OneNewsScreenRouteArgs> page =
      _i3.PageInfo<OneNewsScreenRouteArgs>(name);
}

class OneNewsScreenRouteArgs {
  const OneNewsScreenRouteArgs({
    this.key,
    required this.newsID,
  });

  final _i4.Key? key;

  final String newsID;

  @override
  String toString() {
    return 'OneNewsScreenRouteArgs{key: $key, newsID: $newsID}';
  }
}
