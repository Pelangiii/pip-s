import 'package:flutter/material.dart';
import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/views/auth/login_screen.dart';
import 'package:tumbler/views/onboarding/onboarding_screen.dart';

void main() {
  runApp(Tumblerapp());
}

class Tumblerapp extends StatefulWidget {
  const Tumblerapp({super.key});

  @override
  State<Tumblerapp> createState() => _TumblerappState();
}

class _TumblerappState extends State<Tumblerapp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "tumbler app",
      theme: ThemeData(
        fontFamily: 'Plus Jakarta Sans',
        visualDensity: VisualDensity.adaptivePlatformDensity, //mengatur kepadatan
        textTheme: TextTheme(
          bodyMedium: TextStyle(color: textColor),
          bodySmall: TextStyle(color: textColor)
        ),
      ),
      //initialroute = untuk mendefinisikan kelas apa yang dijalankan saat apliksi dijalankan
      initialRoute: '/onboarding',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
      } ,
      home: OnboardingScreen(),

    ) ;
  }
}