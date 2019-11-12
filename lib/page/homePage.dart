import 'package:flutter/material.dart';

class HomePage extends StatefulWidget{
  HomePage({Key key}):super(key:key);

  @override
   _HomePage createState()=> new _HomePage();

  // @override
  // _HomePage createState()=> new _HomePage();
}

class _HomePage extends State<HomePage>{
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
            onPressed: () {
            }),
        alignment: Alignment.center,
      ),
    );
  }
}