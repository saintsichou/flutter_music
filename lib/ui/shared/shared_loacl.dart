import 'package:shared_preferences/shared_preferences.dart';

class localstory {
  setInfo(key, val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, val);
  }

  getInfo(key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final myIfo = prefs.getString(key);
  }

  // displayInfo() {
//     Future<String> Info = getInfo();
//     Info.then((String Info) {
//            Scaffold.of(context).showSnackBar(
//                     SnackBar(content: Text("数据获取成功：$myIfo")));
//     });
// }
}
