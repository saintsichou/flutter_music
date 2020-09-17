import 'package:delicious/core/model/home_rank_model.dart';
import 'package:delicious/ui/pages/home/content_list.dart';
import 'package:delicious/ui/pages/music/player.dart';
import 'package:delicious/ui/widgets/img_replace.dart';
import 'package:flutter/material.dart';
import 'package:delicious/core/fitscreen/int_screen.dart';

class MusicContent extends StatefulWidget {
  MusicContent({Key key}) : super(key: key);

  @override
  _MusicContentState createState() => _MusicContentState();
}

class _MusicContentState extends State<MusicContent> {
  @override
  Widget build(BuildContext context) {
    final _musicList = ModalRoute.of(context).settings.arguments as Ranks;
    // print('======================>${_musicList.listenUrl}');
    return Column(
      children: [musicPic(_musicList),SizedBox(height: 20,),AudioPlaybackPage(_musicList.listenUrl)],
    );
  }

  Widget musicPic(music) {
    final _music = music;
    return Stack(
      children: [
        ClipRRect(
          // borderRadius: BorderRadius.circular(10),
          child: ImageReplace(url: _music.picL,),
        ),
        Positioned(
          right: 0,
          bottom: 0,
          left:0,
          child: Container(
            width: 300,
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                // borderRadius: BorderRadius.circular(6),
                color: Colors.black54),
            child: Text(
              '${_music.songName}--${_music.singerName[0]}',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
        // musicInfo(_music)
      ],
    );
  }

  Widget musicInfo(music) {
    final _music = music;
    return Column(
      children: [
        Text(_music.songName,style: Theme.of(context).textTheme.headline2,),
        SizedBox(
          height: 20,
        ),
        SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
