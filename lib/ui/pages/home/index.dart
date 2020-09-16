import 'package:delicious/core/http/home_api.dart';
import 'package:delicious/ui/pages/home/content.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('寻乐中国'),
      ),
      body: Container(
        child: HomeContent(),
      )
    );
  }
}
