import 'package:epsi_shop/bo/article.dart';
import 'package:epsi_shop/page/about_us_page.dart';
import 'package:epsi_shop/page/cart_page.dart';
import 'package:epsi_shop/page/details_page.dart';
import 'package:epsi_shop/page/home_page.dart';
import 'package:epsi_shop/page/payement_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final _router = GoRouter(
  routes: [
    GoRoute(
      path: "/",
      builder: (_,__)=> HomePage(),
      routes: [
        GoRoute(
          path: "cart",
          builder: (_,__)=> CartPage(),
          routes: [
            GoRoute(
              path: "payement",
              builder: (BuildContext context, GoRouterState state)=>PayementPage(

              )
            )
          ]
        ),
        GoRoute(
            path: "aboutus",
            builder: (_,__)=> AboutUsPage()
        ),
        GoRoute(
            path: "details",
            builder: (BuildContext context, GoRouterState state)=> DetailPage(
              article: state.extra as Article
            )
        )
      ]
    )
  ]
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}