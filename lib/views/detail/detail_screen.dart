import 'package:flutter/material.dart';
import 'package:tumbler/models/products_model.dart';
import 'package:tumbler/utils/consts.dart';

class DetailScreen extends StatefulWidget {
  final ProductsModel product;

  const DetailScreen({super.key, required this.product});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen>
    with SingleTickerProviderStateMixin {
  int quantity = 1;
  int selectedTopup = -1;
  int selectedStars = 0;
  bool isFavorite = false;

  late AnimationController _cartController;
  late Animation<double> _cartScale;

  final List<int> topupOptions = [20, 80, 100, 150, 200, 250, 500];

  @override
  void initState() {
    super.initState();
    _cartController =
        AnimationController(vsync: this, duration: const Duration(milliseconds: 400));
    _cartScale = Tween<double>(begin: 1.0, end: 1.2).animate(
      CurvedAnimation(parent: _cartController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _cartController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: widget.product.color,
      appBar: AppBar(
        backgroundColor: widget.product.color,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: size.height,
              child: Stack(
                children: [
                  // Container hitam bagian bawah
                  Container(
                    margin: EdgeInsets.only(top: size.height * 0.40),
                    padding: const EdgeInsets.only(
                        top: defaultPadding, left: 25, right: defaultPadding),
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24),
                        topRight: Radius.circular(24),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),

                        // Deskripsi
                        Text(
                          widget.product.description,
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Rating bintang
                        Row(
                          children: List.generate(5, (index) {
                            return IconButton(
                              onPressed: () {
                                setState(() {
                                  selectedStars = index + 1;
                                });
                              },
                              icon: Icon(
                                Icons.star,
                                size: 28,
                                color: index < selectedStars
                                    ? Colors.amber
                                    : Colors.grey,
                              ),
                            );
                          }),
                        ),

                        const SizedBox(height: 20),

                        // Top Up horizontal scroll
                        const Text(
                          "TopUp",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        const SizedBox(height: 8),
                        SizedBox(
                          height: 60,
                          child: ListView.separated(
                            scrollDirection: Axis.horizontal,
                            itemCount: topupOptions.length,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 12),
                            itemBuilder: (context, index) {
                              final value = topupOptions[index];
                              final isSelected = selectedTopup == index;
                              return GestureDetector(
                                onTap: () {
                                  setState(() {
                                    selectedTopup = index;
                                  });
                                },
                                child: AnimatedContainer(
                                  duration: const Duration(milliseconds: 300),
                                  width: 70,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: isSelected
                                        ? Colors.red
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(12),
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              color: Colors.red.withOpacity(0.4),
                                              blurRadius: 8,
                                              offset: const Offset(0, 4),
                                            )
                                          ]
                                        : [],
                                  ),
                                  child: Text(
                                    "$value",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: isSelected
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),

                        const SizedBox(height: 20),

                        // Favorite + Add to Cart
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // Favorite button
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  isFavorite = !isFavorite;
                                });
                              },
                              icon: AnimatedSwitcher(
                                duration: const Duration(milliseconds: 300),
                                transitionBuilder: (child, anim) =>
                                    ScaleTransition(
                                  scale: anim,
                                  child: child,
                                ),
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  key: ValueKey(isFavorite),
                                  color:
                                      isFavorite ? Colors.red : Colors.white,
                                  size: 32,
                                ),
                              ),
                            ),

                            // Add to Cart button with animation
                            ScaleTransition(
                              scale: _cartScale,
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.red,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 80, vertical: 16),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(16),
                                  ),
                                ),
                                onPressed: () async {
                                  await _cartController.forward();
                                  await _cartController.reverse();
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text("Added to cart!")),
                                  );
                                },
                                child: const Text(
                                  "Add to cart",
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),

                  // Judul & Gambar di tengah
                  Positioned(
                    top: size.height * 0.05,
                    left: 0,
                    right: 0,
                    child: Column(
                      children: [
                        Text(
                          widget.product.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        Center(
                          child: Hero(
                            tag: "${widget.product.id}",
                            child: Image.asset(
                              widget.product.image,
                              height: 220,
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
