class Ranks {
  String copyrightId;
  String lisCr;
  String listenUrl;
  String picL;
  String picM;
  String picS;
  String relationTitle;
  String songId;
  String songName;

  Ranks(
      {this.copyrightId,
      this.lisCr,
      this.listenUrl,
      this.picL,
      this.picM,
      this.picS,
      this.relationTitle,
      this.songId,
      this.songName});

  Ranks.fromJson(Map<String, dynamic> json) {
    copyrightId = json['songData']['copyrightId'];
    lisCr = json['songData']['lisCr'];
    listenUrl = json['songData']['listenUrl'];
    picL = json['songData']['picL'];
    picM = json['songData']['picM'];
    picS = json['songData']['picS'];
    relationTitle = json['songData']['relationTitle'];
    songId = json['songData']['songId'];
    songName = json['songData']['songName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['copyrightId'] = this.copyrightId;
    data['lisCr'] = this.lisCr;
    data['listenUrl'] = this.listenUrl;
    data['picL'] = this.picL;
    data['picM'] = this.picM;
    data['picS'] = this.picS;
    data['relationTitle'] = this.relationTitle;
    data['songId'] = this.songId;
    data['songName'] = this.songName;
    return data;
  }
  
  @override
  String toString() {
    return 'Ranks{copyrightId:$copyrightId,lisCr:$lisCr,listenUrl:$listenUrl,picL:$picL,picM:$picM,picS:$picS,relationTitle:$relationTitle,songId:$songId,songName:$songName}';
  }
}
