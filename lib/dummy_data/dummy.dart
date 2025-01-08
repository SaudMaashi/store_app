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

final prices = ["Min", "Max"];
final sortings = [
  "Recommended",
  "Newest",
  "Lowest-Highest Price",
  "Highest-Lowest Price"
];

final genders = [
  "Men",
  "Women",
];

final List<String> sizes = [
  "S",
  "M",
  "L",
  "XL",
];

final colors = [
  "Blue",
  "Red",
  "Black",
  "White",
];

final orders = [
  {
    "name": "Men's Harrington Jacket",
    "image": "assets/images/product1.png",
    "size": "M",
    "color": "Lemon",
    "price": "\$148",
  },
  {
    "name": "Men's shoes",
    "image": "assets/images/product2.png",
    "size": "S",
    "color": "Black",
    "price": "\$52.00",
  },
];
