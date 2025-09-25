import 'package:flutter/widgets.dart';

class ProductsModel {
  final String image, title, description;
  final int size, id;
  // final String price;
  final Color color;

  ProductsModel({required this.image, required this.title, required this.description, required this.size, required this.id, required this.color});
}