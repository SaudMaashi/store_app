class Product {
  String name;
  String image;
  String price;
  bool isFavorite;
  bool hasDiscount;
  String newPrice;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.isFavorite = false,
    this.hasDiscount = false,
    this.newPrice = "0",
  });
}
