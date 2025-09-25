import 'package:flutter/material.dart';
import 'package:tumbler/Data/products_data.dart';
import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/views/home/components/items_card.dart';

class DrinkwareGrid extends StatelessWidget {
  const DrinkwareGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildCategory(
            title: "Tranding",
            items: products, // ganti sesuai data tranding
          ),
          _buildCategory(
            title: "ALL Games",
            items: products, // ganti sesuai data all games
          ),
          _buildCategory(
            title: "Voucher Games",
            items: products, // ganti sesuai data voucher
          ),
        ],
      ),
    );
  }

  Widget _buildCategory({required String title, required List items}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Judul kategori
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
            child: Row(
              children: [
                Container(
                  width: 6,
                  height: 22,
                  color: Colors.red,
                  margin: const EdgeInsets.only(right: 8),
                ),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 8),

          // List item horizontal
          SizedBox(
            height: 180,
            child: ListView.separated(
              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
              scrollDirection: Axis.horizontal,
              itemCount: items.length,
              separatorBuilder: (_, __) => const SizedBox(width: 12),
              itemBuilder: (context, index) => ItemsCard(
                product: items[index],
                press: () => Navigator.pushNamed(
                  context,
                  '/detail',
                  arguments: items[index],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
