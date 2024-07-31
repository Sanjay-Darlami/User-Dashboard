class Album {
  int? userId;
  int? id;
  String? title;

  Album(this.userId, this.id, this.title);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
    };
  }

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      json['userId'],
      json['id'],
      json['title'],
    );
  }
}
