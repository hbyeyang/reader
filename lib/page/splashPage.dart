import 'package:flutter/material.dart';
import 'package:running_demo/app/root_scene.dart';
// import 'package:running_demo/page/homePage.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPage createState() => new _SplashPage();

  // @override
  // _HomePage createState()=> new _HomePage();
}

class _SplashPage extends State<SplashPage> {
  bool isStartPage = false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new GestureDetector(
      onTap: goToPage, //设置页面点击事件
//      child: Image.asset("img/splash_bg.jpg",fit: BoxFit.cover,),//此处fit: BoxFit.cover用于拉伸图片,使图片铺满全屏
      child: Image.asset(
        "img/splash_bg.jpg",
        fit: BoxFit.fill,
      ), //此处fit: BoxFit.cover用于拉伸图片,使图片铺满全屏
    );
  }

  //页面初始化状态的方法
  @override
  void initState() {
    super.initState();
    //开启倒计时
    countDown();
  }

  void countDown() {
    //设置倒计时三秒后执行跳转方法
    var duration = new Duration(seconds: 3);
    new Future.delayed(duration, goToPage);
  }

  void goToPage() {
    //如果页面还未跳转过则跳转页面
    if (!isStartPage) {
      //跳转主页 且销毁当前页面
      // Navigator.of(context).pushAndRemoveUntil(new MaterialPageRoute(builder: (context)=>new HomePage()), (Route<dynamic> rout)=>false);
      Navigator.of(context).pushAndRemoveUntil(
          new MaterialPageRoute(builder: (context) => new RootScene()),
          (Route<dynamic> rout) => false);
      isStartPage = true;
    }
  }
}
