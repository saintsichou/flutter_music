import 'dart:async';
import 'dart:math';
import 'package:delicious/core/http/search_api.dart';
import 'package:delicious/core/model/search/search_hot_model.dart';
import 'package:flutter/material.dart';
import 'keywords.dart';

class SearchContent extends StatefulWidget {
  SearchContent({Key key}) : super(key: key);

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  final List<Hot> hotLists = [];

  GlobalKey<KeywordShowState> textKey = GlobalKey();

  @override
  void initState() {
    super.initState();
    SearchApi.getSearchHot().then((value) {
      setState(() {
        hotLists.addAll(value);
      });
    });
  }

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
          KeywordShow(
            key: textKey,
          )
        ],
      ),
    );
  }

  Widget searchInput() {
    return Container(
      height: 60,
      width: double.infinity,
      child: TextField(
        onChanged: (key) {
            textKey.currentState.onPressed(key);
        },
        onSubmitted: (value) {
          SearchApi.getSearchSinger(20, value, 1).then((value) {
            setState(() {});
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

  void countDown(int sec, Function handle) {
    Timer timer = new Timer(new Duration(seconds: sec), handle);
  }

  Widget hot() {
    List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
    Widget content;
    for (var i = 0; i < hotLists.length; i++) {
      tiles.add(RaisedButton(
        color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
            Random().nextInt(255), .3),
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0)
        ),
        onPressed: () {
          print('${hotLists[i].txtCotent}');
        },
        child: Text(hotLists[i].txtCotent),
      ));
    }
    content = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text('推荐搜索',style: TextStyle(fontSize: 22),),
          ),
        Wrap(
          spacing: 2, //主轴上子控件的间距
          runSpacing: 5,
          children: tiles,
        ),
      ],
    );
    return content;
  }
}
