import 'package:flutter/material.dart';
import 'package:tumbler/utils/size_config.dart';
import 'package:tumbler/views/onboarding/components/body.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: Body(),
      
    );
  }
}