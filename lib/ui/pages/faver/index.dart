import 'package:flutter/material.dart';

class MyFavePage extends StatefulWidget {
  MyFavePage({Key key}) : super(key: key);

  @override
  _MyFavePageState createState() => _MyFavePageState();
}

class _MyFavePageState extends State<MyFavePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的收藏'),),
      body: Text('shoucang'),
    );
  }
}
