import 'package:flutter/material.dart';
import 'package:running_demo/app/custom_color.dart';
import 'package:running_demo/page/splashPage.dart';
import 'package:running_demo/public.dart';
import 'package:running_demo/app/root_scene.dart';

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppScene extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'demo',
      navigatorObservers: [routeObserver],
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.white,
        dividerColor: Color(0xffeeeeee),
        scaffoldBackgroundColor: CustomColor.paper,
        textTheme: TextTheme(body1: TextStyle(color: CustomColor.darkGray)),
      ),
      // home: RootScene(),
      // home: Scaffold(
      //   // appBar: AppBar(
      //   //   title: Text("测试"),
      //   // ),
      //   body: Container(
      //   child: Text("首页数据"),
      //   alignment: Alignment.center,
      // ),
      // ),
      home: SplashPage(),
    );
  }
}
