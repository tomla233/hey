import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart'; // 引入go_router
import 'package:hey/components/hot/PreferenceSetting.dart';
import 'package:hey/pages/article/Article.dart';
import 'package:hey/pages/mainPage.dart';
import 'package:oktoast/oktoast.dart';

Widget getRoot() {
  return OKToast(
    child: MaterialApp.router(
      theme: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        scaffoldBackgroundColor: Colors.white,
      ),
      routerDelegate: _router.routerDelegate,
      routeInformationParser: _router.routeInformationParser,
      routeInformationProvider: _router.routeInformationProvider,
    ),
  );
}

/// go_router路由配置
final GoRouter _router = GoRouter(
  initialLocation: "/",
  routes: <RouteBase>[
    GoRoute(
      path: "/",
      builder: (BuildContext context, GoRouterState state) {
        return const MainPage();
      },
    ),
    GoRoute(
      path: "/preferenceSetting",
      pageBuilder: (context, state) => CustomTransitionPage<void>(
        key: state.pageKey,
        child: const PreferenceSetting(),
        // 入场动画时长
        transitionDuration: const Duration(milliseconds: 300),
        // 退场动画时长
        reverseTransitionDuration: const Duration(milliseconds: 200),
        // 定义从右向左的滑动动画
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          // 入场：从屏幕右侧(Offset(1, 0))滑到原位置(Offset.zero)
          final slideTween = Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).chain(CurveTween(curve: Curves.easeInOut));
          return SlideTransition(
            position: animation.drive(slideTween),
            child: child,
          );
        },
      ),
    ),
    GoRoute(
      path: "/article",
      builder: (BuildContext context, GoRouterState state) {
        return const Article();
      },
    ),
  ],
);
