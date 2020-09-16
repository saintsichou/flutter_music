class Movie {
  String name;
  String id;
  String cid;
  String mvId;
  String url;
  Album album;
  List<Artists> artists;

  Movie(
      {this.name,
      this.id,
      this.cid,
      this.mvId,
      this.url,
      this.album,
      this.artists});

  Movie.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    id = json['id'];
    cid = json['cid'];
    mvId = json['mvId'];
    url = json['url'];
    album = json['album'] != null ? new Album.fromJson(json['album']) : null;
    if (json['artists'] != null) {
      artists = new List<Artists>();
      json['artists'].forEach((v) {
        artists.add(new Artists.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['id'] = this.id;
    data['cid'] = this.cid;
    data['mvId'] = this.mvId;
    data['url'] = this.url;
    if (this.album != null) {
      data['album'] = this.album.toJson();
    }
    if (this.artists != null) {
      data['artists'] = this.artists.map((v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  String toString() {
    return 'Movie{name:$name,id:$id,cid:$cid,mvID:$mvId,url:$url,album:$album,artists:$artists}';
  }
}

class Album {
  String picUrl;
  String name;
  String id;

  Album({this.picUrl, this.name, this.id});

  Album.fromJson(Map<String, dynamic> json) {
    picUrl = json['picUrl'];
    name = json['name'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['picUrl'] = this.picUrl;
    data['name'] = this.name;
    data['id'] = this.id;
    return data;
  }

  @override
  String toString() {
    return 'Album{picUrl:$picUrl,name:$name,id:$id}';
  }
}

class Artists {
  String id;
  String name;

  Artists({this.id, this.name});

  Artists.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }

  @override
  String toString() {
    return 'Artists{name:$name,id:$id}';
  }
}
