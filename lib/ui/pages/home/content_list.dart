import 'package:delicious/core/http/home_api.dart';
import 'package:delicious/core/model/home_rank_model.dart';
import 'package:delicious/ui/widgets/songs_detail.dart';
import 'package:flutter/material.dart';

class MusicList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Ranks>>(
        future: HomeApi.getRanksList(),
        builder: (ctx, snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          } else {
            final rankLists = snapshot.data;
            return ListView.builder(
                itemBuilder: (BuildContext ctx, int index) {
                  final rankthis = rankLists[index];
                  return GestureDetector(
                      onTap: () {
                        print('--------${rankLists[index]}----------');
                        Navigator.of(context).pushNamed(SongsDetail.routerName,arguments: {
                              'cover': rankthis.picS,
                              'title': rankthis.songName,
                              'subtitle': rankthis.singerName[0],
                              'mp3':rankthis.listenUrl
                        });
                        //两种路由写法
                        // Navigator.pushNamed(context, SongsDetail.routerName,
                        //     arguments: {
                        //       'cover': "123",
                        //       'title': "${rankLists[index].songName}",
                        //       'subtitle': "${rankLists[index].relationTitle}"
                        //     });
                      },
                      child: ListTile(
                        leading: Image.network(
                            '${rankLists[index].picS}??${rankLists[index].picM}'),
                        title: Text('${rankLists[index].songName}'),
                        subtitle: Text('${rankLists[index].relationTitle}'),
                      ));
                },
                itemCount: rankLists.length);
          }
        });
  }
}
