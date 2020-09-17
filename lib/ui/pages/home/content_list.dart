import 'package:delicious/core/http/home_api.dart';
import 'package:delicious/core/model/home_rank_model.dart';
import 'package:delicious/ui/pages/music/index.dart';
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
                        // print('--------${rankLists[index]}----------');
                        Navigator.of(context).pushNamed(MyMusic.routerName,
                            arguments: rankthis);
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

// class MusicList extends StatefulWidget {
//   MusicList({Key key}) : super(key: key);

//   @override
//   _MusicListState createState() => _MusicListState();
// }

// class _MusicListState extends State<MusicList> {
//   final List<Ranks> rankLists = [];
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     HomeApi.getRanksList().then((res) {
//       setState(() {
//         rankLists.addAll(res);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//         itemBuilder: (BuildContext ctx, int index) {
//           return GestureDetector(
//               onTap: () {
//                 print('${rankLists[index]}');
//               },
//               child: ListTile(
//                 leading: Image.network(
//                     '${rankLists[index].picS}??${rankLists[index].picM}'),
//                 title: Text('${rankLists[index].songName}'),
//                 subtitle: Text('${rankLists[index].relationTitle}'),
//               ));
//         },
//         itemCount: rankLists.length);
//   }
// }
