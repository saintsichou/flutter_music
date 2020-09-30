import 'package:delicious/core/http/http_request.dart';
import 'package:delicious/core/model/album/albuma_model.dart';

class AblumApi {
  
  static Future<List<Album>> getAlbumList(int pageNo) async{
    final url = 'cms_list_tag';
    final qs = {'pageSize': 10, 'nid': 23854016, 'pageNo': pageNo, 'type': 2003};
    final result = await HttpRequest.request(url, params: qs);
    final subject = result['results']['albumData'];
    print(subject)
    List<Album> ablists = [];
    for (var item in subject) {
      ablists.add(Album.fromJson(item));
    }
    return ablists;
}