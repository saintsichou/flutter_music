import 'dart:math';

import 'package:flutter/material.dart';

class HotWord extends StatefulWidget {
  List hotLists;
  HotWord(this.hotLists);

  @override
  _HotWordState createState() => _HotWordState();
}

class _HotWordState extends State<HotWord> {
  @override
  Widget build(BuildContext context) {
    return hots(widget.hotLists);
  }
}

Widget hots(hotLists) {
  List<Widget> tiles = []; //先建一个数组用于存放循环生成的widget
  Widget content;
  for (var i = 0; i < hotLists.length; i++) {
    tiles.add(RaisedButton(
      // color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
      //     Random().nextInt(255), 1),
      // color: Color.fromRGBO(112, 0, 77,1),
      color: Color.fromRGBO(232, 83, 67,1),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
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
        child: Text(
          '推荐搜索',
          style: TextStyle(fontSize: 22),
        ),
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
