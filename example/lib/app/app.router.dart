// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs

import 'package:designsys/designsys.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

import '../pages/news/NewsViewMobileLandscape.dart';
import '../pages/news/main_news.dart';
import '../pages/news/news_view_mobile_portrait.dart';
import '../pages/startup/startup_view.dart';

class Routes {
  static const String startUpView = '/start-up-view';
  static const String newsMainView = '/';
  static const String newsViewMobileLandscape = '/news-view-mobile-landscape';
  static const String newsViewMobilePortrait = '/news-view-mobile-portrait';
  static const all = <String>{
    startUpView,
    newsMainView,
    newsViewMobileLandscape,
    newsViewMobilePortrait,
  };
}

class StackedRouter extends RouterBase {
  @override
  List<RouteDef> get routes => _routes;
  final _routes = <RouteDef>[
    RouteDef(Routes.startUpView, page: StartUpView),
    RouteDef(Routes.newsMainView, page: NewsMainView),
    RouteDef(Routes.newsViewMobileLandscape, page: NewsViewMobileLandscape),
    RouteDef(Routes.newsViewMobilePortrait, page: NewsViewMobilePortrait),
  ];
  @override
  Map<Type, StackedRouteFactory> get pagesMap => _pagesMap;
  final _pagesMap = <Type, StackedRouteFactory>{
    StartUpView: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const StartUpView(),
        settings: data,
      );
    },
    NewsMainView: (data) {
      var args = data.getArgs<NewsMainViewArguments>(
        orElse: () => NewsMainViewArguments(),
      );
      return CupertinoPageRoute<dynamic>(
        builder: (context) => NewsMainView(key: args.key),
        settings: data,
      );
    },
    NewsViewMobileLandscape: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NewsViewMobileLandscape(),
        settings: data,
      );
    },
    NewsViewMobilePortrait: (data) {
      return CupertinoPageRoute<dynamic>(
        builder: (context) => const NewsViewMobilePortrait(),
        settings: data,
      );
    },
  };
}

/// ************************************************************************
/// Arguments holder classes
/// *************************************************************************

/// NewsMainView arguments holder class
class NewsMainViewArguments {
  final Key? key;
  NewsMainViewArguments({this.key});
}
