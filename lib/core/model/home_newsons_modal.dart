// To parse this JSON data, do
//
//     final newSongs = newSongsFromJson(jsonString);

import 'dart:convert';

NewSongs newSongsFromJson(String str) => NewSongs.fromJson(json.decode(str));

String newSongsToJson(NewSongs data) => json.encode(data.toJson());

class NewSongs {
    NewSongs({
        this.albumData,
        this.columnData,
        this.concertData,
        this.contentId,
        this.linkData,
        this.mvData,
        this.singerData,
        this.songData,
        this.txtData,
        this.vrbtData,
    });

    dynamic albumData;
    dynamic columnData;
    dynamic concertData;
    String contentId;
    dynamic linkData;
    dynamic mvData;
    dynamic singerData;
    SongData songData;
    dynamic txtData;
    dynamic vrbtData;

    factory NewSongs.fromJson(Map<String, dynamic> json) => NewSongs(
        albumData: json["albumData"],
        columnData: json["columnData"],
        concertData: json["concertData"],
        contentId: json["contentId"],
        linkData: json["linkData"],
        mvData: json["mvData"],
        singerData: json["singerData"],
        songData: SongData.fromJson(json["songData"]),
        txtData: json["txtData"],
        vrbtData: json["vrbtData"],
    );

    Map<String, dynamic> toJson() => {
        "albumData": albumData,
        "columnData": columnData,
        "concertData": concertData,
        "contentId": contentId,
        "linkData": linkData,
        "mvData": mvData,
        "singerData": singerData,
        "songData": songData.toJson(),
        "txtData": txtData,
        "vrbtData": vrbtData,
    };
}

class SongData {
    SongData({
        this.auditions,
        this.auditionsFlag,
        this.copyrightId,
        this.customizedPicUrl,
        this.fanyiLrc,
        this.has24Bitqq,
        this.has3Dqq,
        this.hasHQqq,
        this.hasMv,
        this.hasSQqq,
        this.isHdCrbt,
        this.lift,
        this.lisCr,
        this.lisQq,
        this.listenUrl,
        this.lyricLrc,
        this.mvCopyrightId,
        this.picL,
        this.picM,
        this.picS,
        this.qq,
        this.relationTitle,
        this.rt,
        this.singerId,
        this.singerName,
        this.songDesc,
        this.songId,
        this.songName,
        this.unuseFlag,
    });

    dynamic auditions;
    dynamic auditionsFlag;
    String copyrightId;
    dynamic customizedPicUrl;
    dynamic fanyiLrc;
    dynamic has24Bitqq;
    dynamic has3Dqq;
    String hasHQqq;
    dynamic hasMv;
    String hasSQqq;
    String isHdCrbt;
    dynamic lift;
    String lisCr;
    dynamic lisQq;
    String listenUrl;
    dynamic lyricLrc;
    dynamic mvCopyrightId;
    String picL;
    String picM;
    String picS;
    Qq qq;
    String relationTitle;
    dynamic rt;
    List<String> singerId;
    List<String> singerName;
    dynamic songDesc;
    String songId;
    String songName;
    dynamic unuseFlag;

    factory SongData.fromJson(Map<String, dynamic> json) => SongData(
        auditions: json["auditions"],
        auditionsFlag: json["auditionsFlag"],
        copyrightId: json["copyrightId"],
        customizedPicUrl: json["customizedPicUrl"],
        fanyiLrc: json["fanyiLrc"],
        has24Bitqq: json["has24Bitqq"],
        has3Dqq: json["has3Dqq"],
        hasHQqq: json["hasHQqq"],
        hasMv: json["hasMv"],
        hasSQqq: json["hasSQqq"],
        isHdCrbt: json["isHdCrbt"],
        lift: json["lift"],
        lisCr: json["lisCr"],
        lisQq: json["lisQq"],
        listenUrl: json["listenUrl"],
        lyricLrc: json["lyricLrc"],
        mvCopyrightId: json["mvCopyrightId"],
        picL: json["picL"],
        picM: json["picM"],
        picS: json["picS"],
        qq: Qq.fromJson(json["qq"]),
        relationTitle: json["relationTitle"],
        rt: json["rt"],
        singerId: List<String>.from(json["singerId"].map((x) => x)),
        singerName: List<String>.from(json["singerName"].map((x) => x)),
        songDesc: json["songDesc"],
        songId: json["songId"],
        songName: json["songName"],
        unuseFlag: json["unuseFlag"],
    );

    Map<String, dynamic> toJson() => {
        "auditions": auditions,
        "auditionsFlag": auditionsFlag,
        "copyrightId": copyrightId,
        "customizedPicUrl": customizedPicUrl,
        "fanyiLrc": fanyiLrc,
        "has24Bitqq": has24Bitqq,
        "has3Dqq": has3Dqq,
        "hasHQqq": hasHQqq,
        "hasMv": hasMv,
        "hasSQqq": hasSQqq,
        "isHdCrbt": isHdCrbt,
        "lift": lift,
        "lisCr": lisCr,
        "lisQq": lisQq,
        "listenUrl": listenUrl,
        "lyricLrc": lyricLrc,
        "mvCopyrightId": mvCopyrightId,
        "picL": picL,
        "picM": picM,
        "picS": picS,
        "qq": qq.toJson(),
        "relationTitle": relationTitle,
        "rt": rt,
        "singerId": List<dynamic>.from(singerId.map((x) => x)),
        "singerName": List<dynamic>.from(singerName.map((x) => x)),
        "songDesc": songDesc,
        "songId": songId,
        "songName": songName,
        "unuseFlag": unuseFlag,
    };
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
