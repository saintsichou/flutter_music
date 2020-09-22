import 'package:delicious/ui/pages/songs/songs_content.dart';
import 'package:flutter/material.dart';

class MySongs extends StatelessWidget {
  const MySongs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('data'),),
      body: SongsContent(),
    );
  }
}
