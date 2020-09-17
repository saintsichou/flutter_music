import 'package:delicious/ui/pages/search/search_content.dart';
import 'package:flutter/material.dart';

class MySearch extends StatelessWidget {
  const MySearch({Key key}) : super(key: key);
  static String routerName = '/search';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('歌曲搜索'),
      ),
      body: SearchContent(),
    );
  }
}
