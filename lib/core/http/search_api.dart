import 'package:delicious/core/http/http_request.dart';
import 'package:delicious/core/model/search/search_hot_model.dart';
import 'package:delicious/core/model/search/search_result_model.dart';

class SearchApi {
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

  static Future<List<Singer>> getSearchSinger(int rows, String keyword, int pgc) async {
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
}
