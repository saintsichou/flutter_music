import 'package:delicious/core/class/singer_list.dart';
import 'package:delicious/core/model/search/search_result_model.dart';
import 'package:delicious/ui/shared/event_bus.dart';
import 'package:delicious/ui/widgets/img_replace.dart';
import 'package:delicious/ui/widgets/songs_detail.dart';
import 'package:flutter/material.dart';

class MusicInfo extends StatefulWidget {
  const MusicInfo({Key key}) : super(key: key);

  @override
  _MusicInfoState createState() => _MusicInfoState();
}

class _MusicInfoState extends State<MusicInfo> {
  List singerLists = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GlobalEventBus().event.on<SingerList>().listen((event) {
      // print(event);
      List singerlists = event.singerlists;
      singerLists.length > 0 ? singerLists = [] : '';
      singerLists.addAll(singerlists);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: singerLists == null
            ? tips()
            : ListView.builder(
                itemCount: singerLists.length,
                shrinkWrap: true,
                itemBuilder: (ctx, index) {
                  return GestureDetector(
                    onTap: () {
                      print('${singerLists[index]}');
                      Navigator.of(context).pushNamed(SongsDetail.routerName,arguments:singerLists[index] );
                    },
                    child: ListTile(
                      leading: ImageReplace(url: singerLists[index].cover),
                      title: Text(singerLists[index].title),
                      subtitle: Text(singerLists[index].singerName),
                    ),
                  );
                }));
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
