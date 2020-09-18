import 'dart:async';
import 'dart:math';
import 'package:delicious/core/class/singer_list.dart';
import 'package:delicious/core/http/search_api.dart';
import 'package:delicious/core/model/search/search_hot_model.dart';
import 'package:delicious/core/model/search/search_result_model.dart';
import 'package:delicious/ui/shared/event_bus.dart';
import 'package:flutter/material.dart';
import 'music_info.dart';

class SearchContent extends StatefulWidget {
  SearchContent({Key key}) : super(key: key);

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  final List<Hot> hotLists = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SearchApi.getSearchHot().then((value) {
      setState(() {
        hotLists.addAll(value);
      });
    });
  }

  // @override
  // void dispose() {
  //   // TODO: implement dispose
  //   super.dispose();
  //   GlobalEventBus().event.destroy();
  // }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Column(
        children: [
          searchInput(),
          SizedBox(
            height: 10,
          ),
          hot(),
          SizedBox(
            height: 10,
          ),
          MusicInfo(),
        ],
      ),
    );
  }

  Widget searchInput() {
    return Container(
      height: 60,
      width: double.infinity,
      child: TextField(
        onChanged: (value) {
          // GlobalEventBus().event.fire('');
        },
        onSubmitted: (value) {
          SearchApi.getSearchSinger(20, value, 1).then((value) {
            setState(() {
              GlobalEventBus().event.fire(SingerList(value));
            });
          });
        },
        decoration: InputDecoration(
          fillColor: Color(0x30cccccc),
          filled: true,
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00FF0000)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
          hintText: '歌手/歌曲',
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Color(0x00000000)),
              borderRadius: BorderRadius.all(Radius.circular(100))),
        ),
      ),
    );
  }

  void countDown(handle) {
    Timer timer = new Timer(new Duration(seconds: 2), handle);
  }

  Widget hot() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    Widget content;
    for (var i = 0; i < hotLists.length; i++) {
      tiles.add(RaisedButton(
        color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
            Random().nextInt(255), .3),
        textColor: Colors.white,
        onPressed: () {
          print('${hotLists[i].txtCotent}');
        },
        child: Text(hotLists[i].txtCotent),
      ));
    }
    content = Wrap(
      spacing: 2, //主轴上子控件的间距
      runSpacing: 5,
      children: tiles,
    );
    return content;
  }

  Widget tips() {
    return Container(
      child: Text(
        '搜索试试',
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }
}
