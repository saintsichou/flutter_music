class BannerItem {
  String linkDes;
  String linkId;
  String linkPicUrl;
  String linkSort;
  String linkTitle;
  String linkUrl;

  BannerItem(
      {
      this.linkDes,
      this.linkId,
      this.linkPicUrl,
      this.linkSort,
      this.linkTitle,
      this.linkUrl});

  BannerItem.fromJson(Map<String, dynamic> json) {
    linkDes = json['linkData']['linkDes'];
    linkId = json['linkData']['linkId'];
    linkPicUrl = json['linkData']['linkPicUrl'];
    linkSort = json['linkData']['linkSort'];
    linkTitle = json['linkData']['linkTitle'];
    linkUrl = json['linkData']['linkUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['linkDes'] = this.linkDes;
    data['linkId'] = this.linkId;
    data['linkPicUrl'] = this.linkPicUrl;
    data['linkSort'] = this.linkSort;
    data['linkTitle'] = this.linkTitle;
    data['linkUrl'] = this.linkUrl;
    return data;
  }
   @override
  String toString() {
      return 'BannerItem{linkDes:$linkDes,linkId:$linkId,linkPicUrl:$linkPicUrl,linkSort:$linkSort,linkTitle:$linkTitle,linkUrl:$linkUrl}';
  }
}