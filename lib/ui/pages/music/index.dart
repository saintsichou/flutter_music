import 'package:delicious/core/model/home_rank_model.dart';
import 'package:flutter/material.dart';

import 'music_content.dart';

class MyMusic extends StatelessWidget {
  const MyMusic({Key key}) : super(key: key);
  static String routerName = '/music';
  @override
  Widget build(BuildContext context) {
    String title;
    final _musicList = ModalRoute.of(context).settings.arguments as Ranks;

    return Scaffold(
      appBar: AppBar(
        title: Text(_musicList.songName),
      ),
      body: MusicContent(),
      // floatingActionButtonLocation: FloatingActionButtonLocation.startFloat,
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     print('收藏');
      //   },
      //   child: Icon(
      //     Icons.favorite_border,
      //     color: Colors.red,
      //   ),
      //   backgroundColor: Colors.black54,
      // ),
    );
  }
}
