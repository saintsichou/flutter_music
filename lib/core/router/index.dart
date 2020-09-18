import 'package:delicious/ui/pages/main/main.dart';
import 'package:delicious/ui/pages/music/index.dart';
import 'package:delicious/ui/pages/search/index.dart';
import 'package:delicious/ui/widgets/songs_detail.dart';
import 'package:flutter/material.dart';

class MyRouter {
  static final String initalRoute = MyMainPage.routerName;
  static final Map<String, WidgetBuilder> routes = {
    MyMainPage.routerName:(ctx)=>MyMainPage(),
    MyMusic.routerName:(ctx)=>MyMusic(),
    MySearch.routerName:(ctx)=>MySearch(),
    SongsDetail.routerName:(ctx)=>SongsDetail(),
  };
  static final RouteFactory onGenerateRoute = (RouteSettings settings) {
    // 统一处理
    final String name = settings.name;
    final Function pageContentBuilder = routes[name];
    if (pageContentBuilder != null) {
      if (settings.arguments != null) {
        final Route route = MaterialPageRoute(
            builder: (context) =>
                pageContentBuilder(context, arguments: settings.arguments));
        return route;
      } else {
        final Route route = MaterialPageRoute(
            builder: (context) => pageContentBuilder(context));
        return route;
      }
    }
  };
  static final RouteFactory onUnknownRoute = (settings) {
    return MaterialPageRoute(builder: (ctx) {
      // return UnKnow();
    });
  };
}
