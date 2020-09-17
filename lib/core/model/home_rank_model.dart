// To parse this JSON data, do
//
//     final ranks = ranksFromJson(jsonString);

import 'dart:convert';

Ranks ranksFromJson(String str) => Ranks.fromJson(json.decode(str));

String ranksToJson(Ranks data) => json.encode(data.toJson());

class Ranks {
    Ranks({
        this.copyrightId,
        this.lisCr,
        this.listenUrl,
        this.picL,
        this.picM,
        this.picS,
        this.relationTitle,
        this.singerName,
        this.songId,
        this.songName,
    });

    String copyrightId;
    String lisCr;
    String listenUrl;
    String picL;
    String picM;
    String picS;
    String relationTitle;
    List<String> singerName;
    String songId;
    String songName;

    factory Ranks.fromJson(Map<String, dynamic> json) => Ranks(
        copyrightId: json["copyrightId"],
        lisCr: json['songData']["lisCr"],
        listenUrl: json['songData']["listenUrl"],
        picL: json['songData']["picL"],
        picM: json['songData']["picM"],
        picS: json['songData']["picS"],
        relationTitle: json['songData']["relationTitle"],
        singerName: List<String>.from(json['songData']["singerName"].map((x) => x)),
        songId: json['songData']["songId"],
        songName: json['songData']["songName"],
    );

    Map<String, dynamic> toJson() => {
        "copyrightId": copyrightId,
        "lisCr": lisCr,
        "listenUrl": listenUrl,
        "picL": picL,
        "picM": picM,
        "picS": picS,
        "relationTitle": relationTitle,
        "singerName": List<dynamic>.from(singerName.map((x) => x)),
        "songId": songId,
        "songName": songName,
    };
    @override
  String toString() {
    return 'Ranks{copyrightId:$copyrightId,lisCr:$lisCr,singerName:$singerName,listenUrl:$listenUrl,picL:$picL,picM:$picM,picS:$picS,relationTitle:$relationTitle,songId:$songId,songName:$songName}';
  }
}
