import 'dart:math';

import 'package:delicious/core/http/search_api.dart';
import 'package:delicious/core/model/search/search_key_model.dart';
import 'package:delicious/ui/widgets/songs_detail.dart';
import 'package:flutter/material.dart';

class SongsContent extends StatefulWidget {
  String _searchKeyModel;
  SongsContent(this._searchKeyModel, {Key key});
  @override
  _SongsContentState createState() => _SongsContentState();
}

class _SongsContentState extends State<SongsContent> {
  List songlist = [];
  int page = 1;
  int row = 20;
  bool isLoadmore = false;
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SearchApi.getSearchSinger(row, widget._searchKeyModel, page).then((value) {
      // print(value);
      setState(() {
        songlist.addAll(value);
        isLoadmore = false;
      });
    });
    _scrollController.addListener(() {
      // print(_scrollController.position.pixels);
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        print('objectobjectobjectobjectobjectobjectobject');
        _getMoreDate();
      }
    });
  }

  Future _getMoreDate() async {
    if (!isLoadmore) {
      setState(() {
        isLoadmore = true;
      });
      this.page++;
      return SearchApi.getSearchSinger(row, widget._searchKeyModel, page)
          .then((value) {
        print(value);
        setState(() {
          songlist.addAll(value);
          isLoadmore = false;
        });
      });
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return songlist.length > 0
        ? Column(
            children: [imgtitle(), list()],
          )
        : Center(child: CircularProgressIndicator());
  }

  Widget imgtitle() {
    return Container(
      width: double.infinity,
      height: 150,
      child: ClipRRect(
        child: Image.network(
          songlist[0].cover != null ? songlist[0].cover : songlist[1].cover,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget list() {
    return Expanded(
      child: ListView.separated(
          shrinkWrap: true, //shrinkWrap: 该属性将决定列表的长度是否仅包裹其内容的长度
          controller: _scrollController,
          itemBuilder: (ctx, index) {
            if (index == songlist.length) {
              return _loadMoreWidget();
            } else {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).pushNamed(SongsDetail.routerName,
                      arguments: songlist[index]);
                },
                child: ListTile(
                  leading: Text(
                    '${index + 1}',
                    style: TextStyle(
                        color: Color.fromRGBO(Random().nextInt(255),
                            Random().nextInt(255), Random().nextInt(255), 1),
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  title: Text(songlist[index].title),
                  subtitle: Text(songlist[index].artist),
                  trailing: Icon(
                    Icons.play_circle_outline,
                    color: Color.fromRGBO(189, 178, 255, 1),
                  ),
                ),
              );
            }
          },
          separatorBuilder: (ctx, index) {
            return Divider();
          },
          itemCount: songlist.length + 1),
    );
  }

  //加载更多组件
  Widget _loadMoreWidget() {
    return new Padding(
      padding: const EdgeInsets.all(15.0), // 外边距
      child: Center(child: new CircularProgressIndicator()),
    );
  }
}
