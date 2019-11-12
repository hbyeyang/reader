import 'package:flutter/material.dart';

class RankPage extends StatefulWidget{
  RankPage({Key key}):super(key:key);

  @override
   _RankPage createState()=> new _RankPage();

  // @override
  // _HomePage createState()=> new _HomePage();
}

class _RankPage extends State<RankPage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("RankPage")],
        ),
      ),
      body: Container(
        child: RaisedButton(
            child: Text("获取数据"),
            color: Colors.greenAccent,
            onPressed: () {
            }),
        alignment: Alignment.center,
      ),
    );
  }
}