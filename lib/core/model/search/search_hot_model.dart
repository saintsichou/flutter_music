// To parse this JSON data, do
//
//     final hot = hotFromJson(jsonString);

import 'dart:convert';

Hot hotFromJson(String str) => Hot.fromJson(json.decode(str));

String hotToJson(Hot data) => json.encode(data.toJson());

class Hot {
    Hot({
        this.txtCotent,
        this.txtCreateTime,
        this.txtId,
        this.txtName,
        this.txtSort,
        this.txtUpdateTime,
    });

    String txtCotent;
    DateTime txtCreateTime;
    String txtId;
    String txtName;
    String txtSort;
    DateTime txtUpdateTime;

    factory Hot.fromJson(Map<String, dynamic> json) => Hot(
        txtCotent: json['txtData']["txtCotent"],
        txtCreateTime: DateTime.parse(json['txtData']["txtCreateTime"]),
        txtId: json['txtData']["txtId"],
        txtName: json['txtData']["txtName"],
        txtSort: json['txtData']["txtSort"],
        txtUpdateTime: DateTime.parse(json['txtData']["txtUpdateTime"]),
    );

    Map<String, dynamic> toJson() => {
        "txtCotent": txtCotent,
        "txtCreateTime": txtCreateTime.toIso8601String(),
        "txtId": txtId,
        "txtName": txtName,
        "txtSort": txtSort,
        "txtUpdateTime": txtUpdateTime.toIso8601String(),
    };
  @override
  String toString() {
    return 'Hot{txtCotent:$txtCotent,txtCreateTime:$txtCreateTime,txtId:$txtId,txtName:$txtName,txtSort:$txtSort,txtUpdateTime:$txtUpdateTime}';
  }
}
