import 'package:delicious/core/http/http_request.dart';
import 'package:delicious/core/model/search/search_hot_model.dart';
import 'package:delicious/core/model/search/search_result_model.dart';
import 'package:delicious/core/model/search/search_key_model.dart';

class SearchApi {
  //获取热词
  static Future<List<Hot>> getSearchHot() async {
    final searchUrl =
        'cms_list_tag?pageSize=10&nid=24041523&pageNo=0&type=2005';
    final result = await HttpRequest.request(searchUrl);
    final subject = result['result']['results'];
    // print(subject);
    List<Hot> hotlists = [];
    for (var item in subject) {
      hotlists.add(Hot.fromJson(item));
    }
    return hotlists;
  }

  //查询歌手/曲子
  static Future<List<Singer>> getSearchSinger(
      int rows, String keyword, int pgc) async {
    final searchUrl = 'scr_search_tag';
    final qs = {'rows': rows, 'type': 2, 'keyword': keyword, 'pgc': pgc};
    final result = await HttpRequest.request(searchUrl, params: qs);
    final subject = result['musics'];
    // print(subject);
    List<Singer> singerLists = [];
    for (var item in subject) {
      singerLists.add(Singer.fromJson(item));
    }
    return singerLists;
  }

  //搜索实时关键字
  static Future<List<SearchKeyModel>> getChangeKey(String key) async {
    final keyUrl = 'autocomplete_tag';
    final qs = {
      'keyword': key,
    };
    final result = await HttpRequest.request(keyUrl, params: qs);
    final subject = result['key'];
    List<SearchKeyModel> lists = [];
    for (var item in subject) {
      lists.add(SearchKeyModel.fromJson(item));
    }
    return lists;
  }
}
