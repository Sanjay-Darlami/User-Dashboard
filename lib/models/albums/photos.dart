class Photos {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;
  Photos(this.albumId, this.id, this.title, this.url, this.thumbnailUrl);

  Map<String, dynamic> toJson() {
    return {
      'albumId': albumId,
      'id': id,
      'title': title,
      'url': url,
      'thumbnailUrl': thumbnailUrl,
    };
  }

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
      json['albumId'],
      json['id'],
      json['title'],
      json['url'],
      json['thumbnailUrl'],
    );
  }
}
