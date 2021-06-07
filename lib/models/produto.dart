class Produto {
  String name;
  int price;
  int stock;
  String descripcion;
  String productId;
  String categoria;
  String image;

  Produto(
      {this.descripcion,
      this.productId,
      this.name,
      this.price,
      this.stock,
      this.categoria,
      this.image});

  Produto.fromFirestore(Map<String, dynamic> firestore)
      : productId = firestore['productId'],
        name = firestore['name'],
        price = firestore['price'],
        categoria = firestore['categoria'],
        descripcion = firestore['descripcion'],
        image = firestore['url'];
}
