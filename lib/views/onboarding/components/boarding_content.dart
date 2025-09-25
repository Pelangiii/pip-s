import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/utils/size_config.dart';

class OnboardingContent extends StatelessWidget {
  const OnboardingContent({super.key, required this.text, required this.image});

  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          'assets/images/drinkware/PiplogoWhite.png',
          fit: BoxFit.contain,
        ),
        Spacer(),
        Text(
          "PipGamingStore",
          style: TextStyle(
            color: primaryColor,
            fontSize: getProporsionetScreenWidth(36),
            fontWeight: FontWeight.bold // buat menjadi adaptif
          ),
        ),
        SizedBox(height: 15),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: const Color.fromARGB(255, 255, 255, 255)
          ),
        )
      ],
    );
  }
}