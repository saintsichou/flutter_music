import 'package:delicious/core/model/search/search_key_model.dart';
import 'package:delicious/ui/pages/songs/songs_content.dart';
import 'package:flutter/material.dart';

class MySongs extends StatelessWidget {
  const MySongs({Key key}) : super(key: key);
  static String routerName = '/songs';
  @override
  Widget build(BuildContext context) {
    final searchKeyModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('关于${searchKeyModel}的歌曲'),
      ),
      body: SongsContent(searchKeyModel),
    );
  }
}
