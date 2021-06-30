class News {
  int id;
  String categories;
  String title;
  String excerpt;
  String mediaLinkLarge;
  String thumbnail;
  String date;
  String description;
  News({required this.id,required  this.title,required  this.excerpt,required  this.mediaLinkLarge,required  this.thumbnail,required
  this.date,required  this.description,required  this.categories});
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'excerpt': excerpt,
        'mediaLinkLarge': mediaLinkLarge,
        'thumbnail': thumbnail,
        'date': date,
        'description': description,
        'categories': categories
      };

  factory News.fromJson(Map<String, dynamic> json) => News(id:
      json["id"],title:
      json["title"],excerpt:
      json["excerpt"],mediaLinkLarge:
      json["mediaLinkLarge"],thumbnail:
      json["thumbnail"],date:
      json["date"],description:
      json["description"],categories:
      json["categories"]);
}
