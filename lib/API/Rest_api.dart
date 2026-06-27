class productsModal {
  int id;
  String title;
  double Price;
  String description;
  String category;
  String image;
  String rating;

  productsModal({
    required this.id,
    required this.title,
    required this.Price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory productsModal.fromJson(Map<String, dynamic> json) => productsModal(
    id: json["id"]??0,
    title: json["title"]?.toString()??'',
    Price: (json["price"]as num).toDouble(),
    description: json["description"]?.toString()??'',
    category: json["category"]?.toString()??'',
    image: json["image"]?.toString()??"",
    rating: "${json["rating"]["rate"]?.toString()??''},""${json["rating"]["count"]?.toString()??''}",
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price":Price,
    "description": description,
    "category":category,
    "image":image,

  };
}