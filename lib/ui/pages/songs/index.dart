import 'package:delicious/core/model/search/search_key_model.dart';
import 'package:delicious/ui/pages/songs/songs_content.dart';
import 'package:flutter/material.dart';

class MySongs extends StatelessWidget {
  final Map arguments;

  // 为title设置一个默认参数，这样的跳转该界面时可以不传值。
  MySongs({Key key, this.arguments});
  static String routerName = '/songs';
  @override
  Widget build(BuildContext context) {
    // final searchKeyModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text("关于${arguments['text']}的歌曲"),
      ),
      body: SongsContent(arguments['text']),
    );
  }
}
