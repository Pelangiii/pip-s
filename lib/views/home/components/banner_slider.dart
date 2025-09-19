import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';

class BannerSlider extends StatelessWidget {
  const BannerSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: 180),
      child: PageView(
        children: [
          _BannerImage(asset: "/tumbler/assets/images/banner_01.png"),
          _BannerImage(asset: "/tumbler/assets/images/banner_02.png"),
          _BannerImage(asset: "/tumbler/assets/images/banner_03.png"),
        ],
      ),
    );
  }
}
class _BannerImage extends StatelessWidget {
  final String asset;
  
  const _BannerImage({required this.asset});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(defaultPadding),
      child: Image.asset(asset, fit: BoxFit.cover,),
    );
  }
}