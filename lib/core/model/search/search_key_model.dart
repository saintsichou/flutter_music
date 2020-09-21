// To parse this JSON data, do
//
//     final searchKeyModel = searchKeyModelFromJson(jsonString);

import 'dart:convert';

import 'package:flutter/semantics.dart';

SearchKeyModel searchKeyModelFromJson(String str) => SearchKeyModel.fromJson(json.decode(str));

String searchKeyModelToJson(SearchKeyModel data) => json.encode(data.toJson());

class SearchKeyModel {
    SearchKeyModel({
        this.name,
        this.singer,
    });

    String name;
    String singer;

    factory SearchKeyModel.fromJson(Map<String, dynamic> json) => SearchKeyModel(
        name: json["name"],
        singer: json["singer"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "singer": singer,
    };
   @override
  String toString() {
    return 'SearchKeyModel{name:$name,singer:$singer}';
  }
}
