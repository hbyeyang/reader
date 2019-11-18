import 'package:flutter/material.dart';
import 'package:running_demo/bean/testBean.dart';
import 'package:running_demo/net/httpApi.dart';

class ShelfPage extends StatefulWidget {
  ShelfPage({Key key}) : super(key: key);

  @override
  _ShelfPage createState() => new _ShelfPage();

  // @override
  // _HomePage createState()=> new _HomePage();
}

class _ShelfPage extends State<ShelfPage> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("ShelfPage")],
        ),
      ),
      body: Container(
        child: RaisedButton(
            child: Text("获取数据"),
            color: Colors.greenAccent,
            onPressed: () async {
//              String string = await HttpApi.getData();
              TestBean testBean = await HttpApi.getTest();
              print(testBean.data.toString());
              print(testBean.errorCode.toString());
              print(testBean.errorMsg.toString());
            }),
        alignment: Alignment.center,
      ),
    );
  }
}
