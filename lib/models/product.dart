class Product {
  String name;
  String image;
  String price;
  bool isFavorite;
  bool hasDiscount;
  String? newPrice;
  bool isTopSelling;
  bool isNew;
  String category;

  Product({
    required this.name,
    required this.image,
    required this.price,
    this.isFavorite = false,
    this.hasDiscount = false,
    this.newPrice,
    this.isTopSelling = false,
    this.isNew = false,
    required this.category,
  });
}
