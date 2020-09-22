import 'dart:async';
import 'dart:math';
import 'package:delicious/core/http/search_api.dart';
import 'package:delicious/core/model/search/search_hot_model.dart';
import 'package:delicious/ui/pages/songs/index.dart';
import 'package:flutter/material.dart';
import 'hot_word.dart';
import 'keywords.dart';

class SearchContent extends StatefulWidget {
  SearchContent({Key key}) : super(key: key);

  @override
  _SearchContentState createState() => _SearchContentState();
}

class _SearchContentState extends State<SearchContent> {
  final List<Hot> hotLists = [];
  bool flag = true;
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
          flag ? HotWord(hotLists) : Text('搜索结果'),
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
          if (key != '') {
            setState(() {
              this.flag = false;
            });
          } else {
            setState(() {
              this.flag = true;
            });
          }
        },
        onSubmitted: (value) {
            Navigator.of(context).pushNamed(MySongs.routerName,arguments: value);
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
}
