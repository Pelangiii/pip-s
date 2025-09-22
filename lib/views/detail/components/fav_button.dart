import 'package:flutter/material.dart';
import 'package:tumbler/models/products_model.dart';

class FavButton extends StatelessWidget {
  final ProductsModel product;

  const FavButton({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    bool isFavorite;

    return IconButton(
      onPressed: () {
        if (isFavorite = true) {
          // TODO: dari provider untuk memutuskan dia warna apa, dan aitemnya masuk ke mana?
        } else {
          // TODO: untuk menambah logika ke dalm penambahan wishlist
        }
      },
      icon: Icon(
        Icons.favorite,
        color: Colors.red,
      ),
    );
  }
}