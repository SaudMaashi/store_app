import 'package:store_app/models/product.dart';

final List<Product> products = [
  Product(
      name: "Men's Harrington Jacket",
      image: "assets/images/product1.png",
      price: "148",
      hasDiscount: false,
      category: "Men"),
  Product(
      name: "Max Cirro Slides",
      image: "assets/images/product2.png",
      price: "100.97",
      newPrice: "55",
      hasDiscount: true,
      category: "Men"),
  Product(
      name: "Men's Coaches Jacket",
      image: "assets/images/product3.png",
      price: "66.97",
      hasDiscount: false,
      category: "Men"),
];
