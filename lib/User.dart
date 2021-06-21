class User {

  String name;
  String website;
  String email;
  User({required this.name,required this.email,required this.website});
  Map<String, dynamic> toJson() => {
    'name':name,
    'website':website,
    'email':email
  };

  factory User.fromJson(Map<String, dynamic> json) => User(name:
  json["name"],email:
  json["email"],website:
  json["website"]);
}
