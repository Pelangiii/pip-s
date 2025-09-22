import 'package:flutter/material.dart';
import 'package:tumbler/models/products_model.dart';
import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/views/detail/components/add_to_cart.dart';
import 'package:tumbler/views/detail/components/color_and_size.dart';
import 'package:tumbler/views/detail/components/description.dart';
import 'package:tumbler/views/detail/components/fav_button.dart';
import 'package:tumbler/views/detail/components/product_title.dart';

class DetailScreen extends StatelessWidget {
  final ProductsModel product;

  const DetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    int quantity = 1;
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: product.color,
      appBar: AppBar(
        backgroundColor: product.color,
        elevation: 0,
        actions: [
          IconButton(
            icon: Icon(
              Icons.search,
              color: textColor,
            ),
            onPressed: () {},
          ),
          IconButton(
            icon: Icon(
              Icons.shopping_cart_outlined,
              color: textColor,
            ),
            onPressed: () {},
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.38),
                    padding: EdgeInsets.only(
                      top: defaultPadding,
                      left: 25,
                      right: defaultPadding
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 50),
                        ColorAndSize(product: product),
                        SizedBox(height: defaultPadding),
                        Description(product: product),
                        SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FavButton(product: product)
                          ],
                        ),
                        SizedBox(height: 20),
                        AddToCart(product: product, quantity: quantity)
                      ],
                    ),
                  ),
                  // widget yg bergunba untuk mengatur tata letak widget saat
                  Positioned(
                    top: size.height * 0.03,
                    left: defaultPadding,
                    right: 1,
                    child: ProductTitle(product: product),
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}