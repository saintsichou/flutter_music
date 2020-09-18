
import 'package:delicious/core/model/search/search_result_model.dart';
import 'package:delicious/ui/pages/music/player.dart';
import 'package:flutter/material.dart';

import 'img_replace.dart';

class SongsDetail extends StatelessWidget {
  const SongsDetail({Key key}) : super(key: key);
  static String routerName = 'songsDetail';
  @override
  Widget build(BuildContext context) {
    final songs = ModalRoute.of(context).settings.arguments as Singer;

    return Scaffold(
      // appBar: AppBar(title: Text(songs.title), backgroundColor: Colors.transparent,),
      body: Container(
        width: double.infinity,
        // height: 120,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://img.zcool.cn/community/01593656c58a2d6ac7252ce6750735.jpg@2o.jpg'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            btn(context),
            SizedBox(
              height: 150,
            ),
            musicPic(songs),
            SizedBox(
              height: 10,
            ),
            AudioPlaybackPage(songs.mp3)
          ],
        ),
      ),
    );
  }

  Widget musicPic(music) {
    final _music = music;
    return Stack(
      children: [
        ClipRRect(
          // borderRadius: BorderRadius.circular(10),
          child: ImageReplace(
            url: _music.cover,
          ),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          left: 0,
          child: Container(
            width: 300,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(6),
                color: Colors.black54),
            child: Text(
              '${_music.title}--${_music.artist}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }

  Widget btn(context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        child: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              print('object');
              Navigator.of(context).pop();
            }));
  }
}
