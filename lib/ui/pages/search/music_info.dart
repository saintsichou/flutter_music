import 'package:flutter/material.dart';
class MusicInfo extends StatelessWidget {
  const MusicInfo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          itemBuilder: (ctx, index) {
            return ListTile(
              leading: Image.network('src'),
              title: Text('${index}data'),
              subtitle: Text('data'),
            );
          }),
    );
  }
}