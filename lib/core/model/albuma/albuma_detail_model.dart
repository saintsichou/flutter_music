// To parse this JSON data, do
//
//     final albumDetail = albumDetailFromJson(jsonString);

import 'dart:convert';

AlbumDetail albumDetailFromJson(String str) => AlbumDetail.fromJson(json.decode(str));

String albumDetailToJson(AlbumDetail data) => json.encode(data.toJson());

class AlbumDetail {
    AlbumDetail({
        this.copyrightId,
        this.hasHQqq,
        this.hasSQqq,
        this.isHdCrbt,
        this.lisCr,
        this.listenUrl,
        this.picL,
        this.picM,
        this.picS,
        this.qq,
        this.singerId,
        this.singerName,
        this.songDesc,
        this.songId,
        this.songName,
    });

    String copyrightId;
    String hasHQqq;
    String hasSQqq;
    String isHdCrbt;
    String lisCr;
    String listenUrl;
    String picL;
    String picM;
    String picS;
    Qq qq;
    List<String> singerId;
    List<String> singerName;
    dynamic songDesc;
    String songId;
    String songName;

    factory AlbumDetail.fromJson(Map<String, dynamic> json) => AlbumDetail(
        copyrightId: json["copyrightId"],
        hasHQqq: json["hasHQqq"],
        hasSQqq: json["hasSQqq"],
        isHdCrbt: json["isHdCrbt"],
        lisCr: json["lisCr"],
        listenUrl: json["listenUrl"],
        picL: json["picL"],
        picM: json["picM"],
        picS: json["picS"],
        qq: Qq.fromJson(json["qq"]),
        singerId: List<String>.from(json["singerId"].map((x) => x)),
        singerName: List<String>.from(json["singerName"].map((x) => x)),
        songDesc: json["songDesc"],
        songId: json["songId"],
        songName: json["songName"],
    );

    Map<String, dynamic> toJson() => {
        "copyrightId": copyrightId,
        "hasHQqq": hasHQqq,
        "hasSQqq": hasSQqq,
        "isHdCrbt": isHdCrbt,
        "lisCr": lisCr,
        "listenUrl": listenUrl,
        "picL": picL,
        "picM": picM,
        "picS": picS,
        "qq": qq.toJson(),
        "singerId": List<dynamic>.from(singerId.map((x) => x)),
        "singerName": List<dynamic>.from(singerName.map((x) => x)),
        "songDesc": songDesc,
        "songId": songId,
        "songName": songName,
    };
     @override
  String toString() {
    return 'AlbumDetail{copyrightId:$copyrightId,listenUrl:$listenUrl,picL:$picL,picM:$picM,picS:$picS,singerId:$singerId,singerName:$singerName,songDesc:$songDesc,songId:$songId,songName:$songName}';
  }
}

class Qq {
    Qq({
        this.copyrihtId,
        this.invalidateDate,
        this.productId,
        this.resourceIdList,
        this.validateDate,
    });

    String copyrihtId;
    DateTime invalidateDate;
    String productId;
    List<String> resourceIdList;
    DateTime validateDate;

    factory Qq.fromJson(Map<String, dynamic> json) => Qq(
        copyrihtId: json["copyrihtId"],
        invalidateDate: DateTime.parse(json["invalidateDate"]),
        productId: json["productId"],
        resourceIdList: List<String>.from(json["resourceIdList"].map((x) => x)),
        validateDate: DateTime.parse(json["validateDate"]),
    );

    Map<String, dynamic> toJson() => {
        "copyrihtId": copyrihtId,
        "invalidateDate": "${invalidateDate.year.toString().padLeft(4, '0')}-${invalidateDate.month.toString().padLeft(2, '0')}-${invalidateDate.day.toString().padLeft(2, '0')}",
        "productId": productId,
        "resourceIdList": List<dynamic>.from(resourceIdList.map((x) => x)),
        "validateDate": "${validateDate.year.toString().padLeft(4, '0')}-${validateDate.month.toString().padLeft(2, '0')}-${validateDate.day.toString().padLeft(2, '0')}",
    };
}
