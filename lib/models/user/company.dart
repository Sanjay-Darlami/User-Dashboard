class Company {
  String? name;
  String? catchPhrase;
  String? bs;

  Company(this.name, this.catchPhrase, this.bs);

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'catchPhrase': catchPhrase,
      'bs': bs,
    };
  }

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
      json['name'],
      json['catchPhrase'],
      json['bs'],
    );
  }
}
