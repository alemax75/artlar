class Category {
  final String id, title, image;
  final int numOfProducts;

  Category({this.id, this.title, this.image, this.numOfProducts});

  // It creates an Category from JSON
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json["id"],
      title: json["title"],
      image: json["image"],
      numOfProducts: json["numOfProducts"],
    );
  }

  Category.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        title = firestore['title'],
        image = firestore['image'],
        numOfProducts = firestore['numOfProducts'];
}
