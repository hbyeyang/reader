import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:running_demo/global.dart';
import 'package:running_demo/page/homePage.dart';
import 'package:running_demo/page/minePage.dart';
import 'package:running_demo/page/rankPage.dart';
import 'package:running_demo/page/shelfPage.dart';
import 'package:running_demo/page/splashPage.dart';
// import 'package:running_demo/utility/event_bus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:running_demo/public.dart';

// import 'package:shuqi/home/home_scene.dart';
// import 'package:shuqi/bookshelf/bookshelf_scene.dart';
// import 'package:shuqi/me/me_scene.dart';

class RootScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => RootSceneState();
}

class RootSceneState extends State<RootScene> {
  int _tabIndex = 0;
  bool isFinishSetup = false;
  List<Image> _tabImages = [
    Image.asset('img/nav_ic_bookshelf_default.png'),
    Image.asset('img/nav_ic_bookstore_default.png'),
    Image.asset('img/nav_ic_gift_default.png'),
    Image.asset('img/nav_ic_me_default.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('img/nav_ic_bookshelf_select.png'),
    Image.asset('img/nav_ic_bookstore_select.png'),
    Image.asset('img/nav_ic_gift_select.png'),
    Image.asset('img/nav_ic_me_select.png'),
  ];

  @override
  void initState() {
    super.initState();
    // SplashPage();
    setupApp();

    // eventBus.on(EventUserLogin, (arg) {
    //   setState(() {});
    // });

    // eventBus.on(EventUserLogout, (arg) {
    //   setState(() {});
    // });

    // eventBus.on(EventToggleTabBarIndex, (arg) {
    //   setState(() {
    //     _tabIndex = arg;
    //   });
    // });
  }

  @override
  void dispose() {
    // eventBus.off(EventUserLogin);
    // eventBus.off(EventUserLogout);
    // eventBus.off(EventToggleTabBarIndex);
    super.dispose();
  }

  setupApp() async {
    preferences = await SharedPreferences.getInstance();
    setState(() {
      isFinishSetup = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (!isFinishSetup) {
      return Container();
    }

    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          // BookshelfScene(),
          // HomeScene(),
          // MeScene(),
          ShelfPage(),
          HomePage(),
          RankPage(),
          MinePage(),
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: CustomColor.primary,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: getTabIcon(0), title: Text('书架')),
          BottomNavigationBarItem(icon: getTabIcon(1), title: Text('书城')),
          BottomNavigationBarItem(icon: getTabIcon(2), title: Text('排行')),
          BottomNavigationBarItem(icon: getTabIcon(3), title: Text('我的')),
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }

  Image getTabIcon(int index) {
    if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}
