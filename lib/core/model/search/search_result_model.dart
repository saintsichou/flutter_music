// To parse this JSON data, do
//
//     final singer = singerFromJson(jsonString);

import 'dart:convert';

Singer singerFromJson(String str) => Singer.fromJson(json.decode(str));

String singerToJson(Singer data) => json.encode(data.toJson());

class Singer {
    Singer({
        this.albumName,
        this.albumId,
        this.copyrightId,
        this.mp3,
        this.unuseFlag,
        this.songName,
        this.mvId,
        this.lyrics,
        this.mvCopyrightId,
        this.id,
        this.singerId,
        this.title,
        this.cover,
        this.hasMv,
        this.singerName,
        this.isHdCrbt,
        this.hasSQqq,
        this.artist,
        this.hasHQqq,
    });

    String albumName;
    String albumId;
    String copyrightId;
    String mp3;
    dynamic unuseFlag;
    String songName;
    String mvId;
    String lyrics;
    String mvCopyrightId;
    String id;
    String singerId;
    String title;
    String cover;
    String hasMv;
    String singerName;
    dynamic isHdCrbt;
    String hasSQqq;
    String artist;
    String hasHQqq;

    factory Singer.fromJson(Map<String, dynamic> json) => Singer(
        albumName: json["albumName"],
        albumId: json["albumId"],
        copyrightId: json["copyrightId"],
        mp3: json["mp3"],
        unuseFlag: json["unuseFlag"],
        songName: json["songName"],
        mvId: json["mvId"],
        lyrics: json["lyrics"],
        mvCopyrightId: json["mvCopyrightId"],
        id: json["id"],
        singerId: json["singerId"],
        title: json["title"],
        cover: json["cover"],
        hasMv: json["hasMv"],
        singerName: json["singerName"],
        isHdCrbt: json["isHdCrbt"],
        hasSQqq: json["hasSQqq"],
        artist: json["artist"],
        hasHQqq: json["hasHQqq"],
    );

    Map<String, dynamic> toJson() => {
        "albumName": albumName,
        "albumId": albumId,
        "copyrightId": copyrightId,
        "mp3": mp3,
        "unuseFlag": unuseFlag,
        "songName": songName,
        "mvId": mvId,
        "lyrics": lyrics,
        "mvCopyrightId": mvCopyrightId,
        "id": id,
        "singerId": singerId,
        "title": title,
        "cover": cover,
        "hasMv": hasMv,
        "singerName": singerName,
        "isHdCrbt": isHdCrbt,
        "hasSQqq": hasSQqq,
        "artist": artist,
        "hasHQqq": hasHQqq,
    };
  @override
  String toString() {
    return 'Singer{albumName:$albumName,albumId:$albumId,copyrightId:$copyrightId,mp3:$mp3,unuseFlag:$unuseFlag,songName:$songName,mvId:$mvId,lyrics:$lyrics,mvCopyrightId:$mvCopyrightId,id:$id,singerId:$singerId,title:$title,cover:$cover,hasMv:$hasMv,isHdCrbt:$isHdCrbt,hasSQqq:$hasSQqq,artist:$artist,hasHQqq:$hasHQqq,singerName:$singerName,}';
  }
}
