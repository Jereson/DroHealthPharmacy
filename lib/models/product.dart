import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;

  final String constituents;
  final String description;

  double price;
  final String size;
  final String image;
  final String designId;
  int count;

  Product({
    this.id,
    this.title,
    this.constituents,
    this.description,
    this.image,
    this.price,
    this.size,
    this.designId,
    this.count,
  });
}
