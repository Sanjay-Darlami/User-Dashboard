class Comments {
  int? postId;
  int? id;
  String? name;
  String? email;
  String? body;

  Comments(this.postId, this.id, this.name, this.email, this.body);

  factory Comments.fromJson(Map<String, dynamic> json) {
    return Comments(
      json['postId'] as int?,
      json['id'] as int?,
      json['name'] as String?,
      json['email'] as String?,
      json['body'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'postId': postId,
      'id': id,
      'name': name,
      'email': email,
      'body': body,
    };
  }
}
