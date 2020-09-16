import 'package:flutter/material.dart';
import 'content_list.dart';
import 'content_swiper.dart';

class HomeContent extends StatefulWidget {
  HomeContent({Key key}) : super(key: key);

  @override
  _HomeContentState createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        BannerTop(),
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: EdgeInsets.all(5.0),
          child: Text(
            '音乐热榜',
            style: TextStyle(fontSize: 22),
          ),
        ),
        Expanded(
          child: Container(
            height: 300,
            padding: EdgeInsets.all(8),
            child: MusicList(),
          )
        )
      ],
    );
  }
}


