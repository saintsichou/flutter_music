import 'package:delicious/core/http/home_api.dart';
import 'package:delicious/core/model/home_rank_model.dart';
import 'package:flutter/material.dart';

class songsViewModel extends ChangeNotifier {
  List<Ranks> _ranks = [];

  List<Ranks> get ranks {
    return _ranks;
  }

  songsViewModel() {
    HomeApi.getRanksList().then((res) {
      _ranks = res;
      notifyListeners();
    });
  }
}
