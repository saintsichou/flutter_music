import 'package:delicious/ui/widgets/player.dart';
import 'package:flutter/material.dart';

import 'img_replace.dart';

class SongsDetail extends StatelessWidget {
  final Map arguments;
  SongsDetail({this.arguments});

  static String routerName = 'songsDetail';
  @override
  Widget build(BuildContext context) {
    // print("----=====${arguments}");
    // final _musicList = ModalRoute.of(context).settings.arguments as Ranks;
    return Scaffold(
      // appBar: AppBar(title: Text(_songs.title), backgroundColor: Colors.transparent,),
      body: Container(
        width: double.infinity,
        // height: 120,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: NetworkImage(
                    'https://img.zcool.cn/community/0148fb5f69857a11013f3110dd6f4a.jpg@2o.jpg'),
                fit: BoxFit.fill)),
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            btn(context),
            musictitle(arguments),
            SizedBox(
              height: 100,
            ),
            musicPic(arguments),
            SizedBox(
              height: 10,
            ),
            AudioPlaybackPage(arguments['mp3'])
          ],
        ),
      ),
    );
  }

  Widget musictitle(_music) {
    return Container(
      width: 300,
      padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
          // borderRadius: BorderRadius.circular(6),
          color: Colors.black54),
      child: Text(
        "${_music['title']}--${_music['subtitle']}",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget musicPic(music) {
    final _music = music;
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: ImageReplace(
            url: _music['cover'],
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
