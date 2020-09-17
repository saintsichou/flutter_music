import 'package:delicious/core/http/http_request.dart';
import 'package:delicious/core/model/home_banner_model.dart';
import 'package:delicious/core/model/home_rank_model.dart';

class HomeApi {
  static Future<List<Ranks>> getRanksList() async {
    final moveUrl = 'cms_list_tag?nid=23603703&pageSize=200&pageNo=0';
    final result = await HttpRequest.request(moveUrl);
    final subject = result['result']['results'];
    // print(subject);
    List<Ranks> Rankss = [];
    for (var item in subject) {
      Rankss.add(Ranks.fromJson(item));
    }
    // print(Rankss);
    return Rankss;
  }

  static Future<List<BannerItem>> getBannerList() async {
    final bannerUrl =
        'cms_list_tag?pageSize=10&nid=23831003&pageNo=0&type=2006';
    final result = await HttpRequest.request(bannerUrl);
    final subject = result['result']['results'];
    List<BannerItem> bannerList = [];
    for (var item in subject) {
      bannerList.add(BannerItem.fromJson(item));
    }
    return bannerList;
  }
}
