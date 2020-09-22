import 'package:flutter/material.dart';

class SongsContent extends StatefulWidget {
  SongsContent({Key key}) : super(key: key);

  @override
  _SongsContentState createState() => _SongsContentState();
}

class _SongsContentState extends State<SongsContent> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        imgtitle()
      ],
    );
  }

  Widget imgtitle() {
    return ClipRRect(
      child: Image.network(
          'http://mcontent.10086.cn/newlv2/new/album/20200907/1135179857/s_JmzykUQDNxJGDMJ1.jpg'),
    );
  }
}
