import 'dart:math';

import 'package:delicious/ui/widgets/player.dart';
import 'package:flutter/material.dart';

import 'btn_widget.dart';
import 'img_replace.dart';

class SongsDetail extends StatefulWidget {
  final Map arguments;
  SongsDetail({this.arguments});

  static String routerName = 'songsDetail';

  @override
  _SongsDetailState createState() => _SongsDetailState();
}

class _SongsDetailState extends State<SongsDetail>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  Animation _rotate;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 8));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    _rotate = Tween(begin: 0.0, end: 2 * pi).animate(_controller);

    _rotate.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //循环执行动画
        _controller.repeat();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.stop();
    _controller.dispose();
    super.dispose();
  }

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
            musictitle(widget.arguments),
            SizedBox(
              height: 100,
            ),
            musicPic(widget.arguments),
            SizedBox(
              height: 10,
            ),
            AudioPlaybackPage(
              widget.arguments['mp3'],
              callBack: (flag) {
                //从自组件传值出来
                if (flag) {
                  _controller.forward();
                } else {
                  _controller.stop();
                }
              },
            )
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
    return AnimatedBuilder(
      animation: _controller,
      builder: (ctx, child) {
        return Transform(
          transform: Matrix4.rotationZ(_rotate.value),
          alignment: Alignment.center,
          child: Container(
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: ImageReplace(
                    url: _music['cover'],
                    w: 200,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget btn(context) {
    return Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        alignment: Alignment.topLeft,
        child: Row(
          children: [
            icon_btn(Icons.arrow_back,() {
              Navigator.of(context).pop();
            }),
            icon_btn(Icons.home,() {
              //删除所有路由直达home路由
              Navigator.of(context).pushNamedAndRemoveUntil('/',(Route route)=>false);
            }),
          ],
        ));
  }
}
