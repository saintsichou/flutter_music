import 'package:flutter/material.dart';

class SongsDetail extends StatelessWidget {
  const SongsDetail({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage('src'), fit: BoxFit.cover)),
      child: Scaffold(
        appBar:
            AppBar(title: Text('data'), backgroundColor: Colors.transparent),
        body: Center(
          child: Text('data'),
        ),
      ),
    );
  }
}
