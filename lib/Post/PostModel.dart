class PostModel {
  final int? id;
  final String? title;
  final String? body;
  final String? price;
  final String? description;
  final String? category;
  final String? image;

  PostModel({
    this.id,
    required this.title,
    required this.body,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
  });



  factory PostModel.fromJson(Map<String, dynamic> json) => PostModel(
    id: json["id"],
    title: json["title"],
    body: json["body"],
    price: json["price"]?.toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
  );

  Map<String, dynamic> toJson() => {
    "title": title,
    "body": body,
    "price": price,
    "description": description,
    "category": category,
    "image": image,

  };

}