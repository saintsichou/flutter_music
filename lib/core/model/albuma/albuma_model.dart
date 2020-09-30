// To parse this JSON data, do
//
//     final album = albumFromJson(jsonString);

import 'dart:convert';

Album albumFromJson(String str) => Album.fromJson(json.decode(str));

String albumToJson(Album data) => json.encode(data.toJson());

class Album {
    Album({
        this.albumData,
    });

    AlbumData albumData;

    factory Album.fromJson(Map<String, dynamic> json) => Album(
        albumData: AlbumData.fromJson(json["albumData"]),
    );

    Map<String, dynamic> toJson() => {
        "albumData": albumData.toJson(),
    };
}

class AlbumData {
    AlbumData({
        this.albumId,
        this.albumName,
        this.albumsDes,
        this.albumsIntroduction,
        this.albumsPicUrl,
        this.albumsSmallUrl,
        this.localAlbumPicL,
        this.localAlbumPicM,
        this.localAlbumPicS,
        this.relationTitle,
        this.singerId,
    });

    String albumId;
    String albumName;
    String albumsDes;
    dynamic albumsIntroduction;
    String albumsPicUrl;
    String albumsSmallUrl;
    String localAlbumPicL;
    String localAlbumPicM;
    String localAlbumPicS;
    String relationTitle;
    String singerId;

    factory AlbumData.fromJson(Map<String, dynamic> json) => AlbumData(
        albumId: json["albumId"],
        albumName: json["albumName"],
        albumsDes: json["albumsDes"],
        albumsIntroduction: json["albumsIntroduction"],
        albumsPicUrl: json["albumsPicUrl"],
        albumsSmallUrl: json["albumsSmallUrl"],
        localAlbumPicL: json["localAlbumPicL"],
        localAlbumPicM: json["localAlbumPicM"],
        localAlbumPicS: json["localAlbumPicS"],
        relationTitle: json["relationTitle"],
        singerId: json["singerId"],
    );

    Map<String, dynamic> toJson() => {
        "albumId": albumId,
        "albumName": albumName,
        "albumsDes": albumsDes,
        "albumsIntroduction": albumsIntroduction,
        "albumsPicUrl": albumsPicUrl,
        "albumsSmallUrl": albumsSmallUrl,
        "localAlbumPicL": localAlbumPicL,
        "localAlbumPicM": localAlbumPicM,
        "localAlbumPicS": localAlbumPicS,
        "relationTitle": relationTitle,
        "singerId": singerId,
    };
    @override
  String toString() {
    return 'Album{albumId:$albumId,albumName:$albumName,albumsDes:$albumsDes,albumsIntroduction:$albumsIntroduction,albumsPicUrl:$albumsPicUrl,albumsSmallUrl:$albumsSmallUrl,localAlbumPicL:$localAlbumPicL,localAlbumPicM:$localAlbumPicM,relationTitle:$relationTitle,singerId:$singerId}';
  }
}
