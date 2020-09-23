import 'package:delicious/ui/shared/theme.dart';
import 'package:flutter/material.dart';
import 'core/provider/songs_viewmodel.dart';
import 'core/router/index.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (ctx) => songsViewModel(), child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '寻味中国',
      theme: MyTheme.lightTheme,
      initialRoute: MyRouter.initalRoute,
      // routes: MyRouter.routes,//静态路由
      onGenerateRoute: MyRouter.onGenerateRoute,//动态路由
      onUnknownRoute: MyRouter.onUnknownRoute,
    );
  }
}
