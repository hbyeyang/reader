import 'package:flutter/material.dart';

class MinePage extends StatefulWidget{
  MinePage({Key key}):super(key:key);

  @override
   _MinePage createState()=> new _MinePage();
}

class _MinePage extends State<MinePage>{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: new Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[Text("MinePage")],
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