import 'package:flutter/material.dart';
import 'package:running_demo/NetService/ResultData.dart';
import 'package:running_demo/net/httpApi.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePage createState() => new _HomePage();

// @override
// _HomePage createState()=> new _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("HomePage")],
        ),
      ),
      body: Container(
        child: RaisedButton(
            child: Text("获取数据"),
            color: Colors.greenAccent,
            onPressed: () async {
//              print("书城：" + NetCode.URL_BOOK_CHANNEL);
//              print("书城：" + RequestParams.getParams(context).toString());
              ResultData resultData = await HttpApi.postBookCity();
              print("首页1：" + resultData.result.toString());
              print("首页2：" + resultData.data.toString());
            }),
        alignment: Alignment.center,
      ),
    );
  }
}
