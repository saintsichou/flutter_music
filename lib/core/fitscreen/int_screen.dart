import 'index.dart';

extension DoubleFit on int {
   get px{
    return MyBoxFit.setPx(this.toDouble());
  } 
  double get rpx{
    return MyBoxFit.setRpx(this.toDouble());
  }
}
