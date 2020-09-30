import 'package:flutter/material.dart';

class ImageReplace extends StatefulWidget {
  final String url;
  final double w;
  final double h;
  final String defalutImg;

  ImageReplace(
      {Key key,
      @required this.url,
      this.w,
      this.h,
      this.defalutImg = 'assets/images/bg.jpg'})
      : super(key: key);
  @override
  _ImageReplaceState createState() => _ImageReplaceState();
}

class _ImageReplaceState extends State<ImageReplace> {
  Image _img;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // print('-------${widget.url}');
    if (widget.url != null) {
        _img = Image.network(
        widget.url,
        width: widget.w,
        height: widget.h,
        fit: BoxFit.fill,
        frameBuilder: (
          BuildContext context,
          Widget child,
          int frame,
          bool wasSynchronouslyLoaded,
        ) {
          if (frame == null) {
            return Image.asset(
              'assets/images/bg.jpg',
              height: widget.h,
              width: widget.w,
              fit: BoxFit.cover,
            );
          }
          return child;
        },
      );
      var reslove = _img.image.resolve(ImageConfiguration.empty);
      reslove.addListener(ImageStreamListener((_, __) {},
          onError: (dynamic exception, StackTrace stacktrace) {
        //加载失败
        setState(() {
          _img = Image.asset(
            widget.defalutImg,
            width: widget.w,
            height: widget.h,
          );
        });
      }));
    }else{
      _img = Image.asset(
            widget.defalutImg,
            width: widget.w,
            height: widget.h,
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return _img;
  }
}
