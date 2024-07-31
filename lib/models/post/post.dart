class Post {
  int? userId;
  int? id;
  String? title;
  String? body;

  Post(this.userId, this.id, this.title, this.body);

  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'id': id,
      'title': title,
      'body': body,
    };
  }

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      json['userId'],
      json['id'],
      json['title'],
      json['body'],
    );
  }
}
