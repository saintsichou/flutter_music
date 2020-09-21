import 'package:delicious/core/http/search_api.dart';
import 'package:delicious/ui/shared/until.dart';
import 'package:flutter/material.dart';

class KeywordShow extends StatefulWidget {
  KeywordShow({Key key}) : super(key: key);

  @override
  KeywordShowState createState() => KeywordShowState();
}

class KeywordShowState extends State<KeywordShow> {
  List _list = [];
  String _keyword;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return _list.length > 0
        ? Expanded(
            child: ListView.separated(
              itemCount: _list.length,
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return Container(
                  padding: EdgeInsets.all(10),
                  child: hightlight(
                      _keyword, _list[index].singer, _list[index].name),
                );
              },
              separatorBuilder: (context, index) {
                return Divider();
              },
            ),
          )
        : Container(
            alignment: Alignment.center,
            child: Text('搜索试试~'),
          );
  }

  Widget hightlight(String keyword, String str, String name) {
    final wordList = str.split(keyword);
    List<Widget> textList = [];
    String textname = name;
    
    textname = textname.length >= 10 ? textname.substring(0, 10) + '...' : textname;
    TextStyle highlightStyle = TextStyle(color: Colors.red);
    TextStyle normalStyle = TextStyle(color: Colors.black);
    for (int i = 0; i < wordList.length; i++) {
      if ((i % 2) == 1) {
        textList.add(Text(keyword, style: highlightStyle));
      }
      String val = wordList[i].length >= 10 ? wordList[i].substring(0, 10) : wordList[i];;
      if (val != '' && val.length > 0) {
        textList.add(Text(val, style: normalStyle));
        textList.add(Expanded(child: Text("/${textname}", style: normalStyle)));
      }
    }
    print(textList);
    // textList = textList.map((e) => null)
    Widget row = Row(children: textList);

    return row;
  }

  void onPressed(String key) {
    setState(() {
      _keyword = key;
      if (_keyword != '') {
        // _list = [];
        SearchApi.getChangeKey(key).then((value) {
          print('=============${_keyword}');
          // print('=============${value}');
          _list.addAll(value);
          print('=============${_list}');
        });
      } else {
        _list = [];
      }
    });
  }
}
