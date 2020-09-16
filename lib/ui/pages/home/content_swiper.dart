import 'package:delicious/core/http/home_api.dart';
import 'package:flutter/material.dart';
import 'package:delicious/core/model/home_banner_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class BannerTop extends StatelessWidget {
  const BannerTop({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<BannerItem>>(
        future: HomeApi.getBannerList(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text('请求失败'),
            );
          }
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            final banners = snapshot.data;
            return Container(
                width: MediaQuery.of(context).size.width,
                height: 200.0,
                child: Swiper(
                  itemBuilder: (BuildContext context, int index) {
                    return (Image.network(
                      "${banners[index].linkPicUrl}",
                      fit: BoxFit.fill,
                    ));
                  },
                  itemCount: banners.length,
                  pagination: new SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                    color: Colors.black54,
                    activeColor: Colors.white,
                  )),
                  control: new SwiperControl(),
                  scrollDirection: Axis.horizontal,
                  autoplay: true,
                  duration: 500,
                  onTap: (index) => print('点击了第${banners[index].linkUrl}个'),
                ));
          }
        });
  }
}

//不用staefulwidget
// class BannerTop extends StatefulWidget {
//   BannerTop({Key key}) : super(key: key);
//   @override
//   _BannerTopState createState() => _BannerTopState();
// }
// class _BannerTopState extends State<BannerTop> {
//   final List<BannerItem> banners = [];
//   @override
//   void initState() {
//     super.initState();
//     HomeApi.getBannerList().then((res) {
//       setState(() {
//         banners.addAll(res);
//         // print(banners[0]);
//       });
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//         width: MediaQuery.of(context).size.width,
//         height: 200.0,
//         child: Swiper(
//           itemBuilder: _swiperBuilder,
//           itemCount: banners.length - 1,
//           pagination: new SwiperPagination(
//               builder: DotSwiperPaginationBuilder(
//             color: Colors.black54,
//             activeColor: Colors.white,
//           )),
//           control: new SwiperControl(),
//           scrollDirection: Axis.horizontal,
//           autoplay: true,
//           duration: 500,
//           onTap: (index) => print('点击了第${banners[index].linkUrl}个'),
//         ));
//   }
//   Widget _swiperBuilder(BuildContext context, int index) {
//     return (Image.network(
//       "${banners[index].linkPicUrl}",
//       fit: BoxFit.fill,
//     ));
//   }
// }
