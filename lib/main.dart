import 'package:flutter/material.dart';
import 'package:tumbler/Data/products_data.dart';
import 'package:tumbler/models/products_model.dart';
import 'package:tumbler/utils/consts.dart';
import 'package:tumbler/views/auth/login_screen.dart';
import 'package:tumbler/views/auth/register_screen.dart';
import 'package:tumbler/views/detail/detail_screen.dart';
import 'package:tumbler/views/home/components/catalogue_screen.dart';
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
      initialRoute: '/login',
      routes: {
        '/onboarding': (context) => OnboardingScreen(),
        '/login': (context) => LoginScreen(),
        '/register': (context) => RegisterScreen(),
        '/catalogue': (context) => CatalogueScreen(),
        '/detail': (context) => DetailScreen( product: ModalRoute.of(context)!.settings.arguments as ProductsModel),
       

        
      } ,
      home: OnboardingScreen(),

    ) ;
  }
}