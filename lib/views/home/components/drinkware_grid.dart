import 'package:flutter/material.dart';
import 'package:tumbler/Data/products_data.dart';
import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/views/home/components/items_card.dart';

class DrinkwareGrid extends StatelessWidget {
  const DrinkwareGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: defaultPadding),
      child: GridView.builder(
       physics: NeverScrollableScrollPhysics(),
       shrinkWrap: true,
       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisExtent: defaultPadding,
        crossAxisSpacing: defaultPadding,
        childAspectRatio: 0.75
        ),
        itemCount: products.length,
        itemBuilder: (context, index) => ItemsCard(product: products[index], press: () {},),
        ),
    );
  }
}