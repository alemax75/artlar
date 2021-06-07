class Product {
  final int price;
  final String id, title, category, image, subTitle, description;

  Product({
    this.id,
    this.price,
    this.title,
    this.category,
    this.image,
    this.subTitle,
    this.description,
  });

  // It create an Category from JSON

  Product.fromFirestore(Map<String, dynamic> firestore)
      : id = firestore['id'],
        title = firestore['title'],
        price = firestore['price'],
        category = firestore['category'],
        description = firestore['description'],
        subTitle = firestore['subTitle'],
        image = firestore['image'];
}
