import 'package:flutter/material.dart';
import 'package:hey/pages/article/Article.dart';
import 'package:hey/pages/mainPage.dart';

Widget getRoot() {
  return MaterialApp(
    theme: ThemeData(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      scaffoldBackgroundColor: Colors.white,
    ),
    initialRoute: "/",
    routes: getRoutes(),
  );
}
Map<String, Widget Function(BuildContext)> getRoutes() {
  return {
    "/": (context) => const MainPage(),
    "/article": (context) => const Article(),
  };
}
