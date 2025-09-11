import 'package:flutter/material.dart';

class SizeConfig {
  // class MediaQueryData adalah class yg berfungsi untuk membuat apliksi menjadi responsif dengan cara memanggil2 ukuran aktual pada layar platform
  static MediaQueryData _mediaQueryData = MediaQueryData.fromView(
    // ignore: deprecated_member_use
    WidgetsBinding.instance.window
  );
  // variabel untuk tampung default size dr aplikasi sblm di dev ke platform yg spesifik dan mendapatkan ukuran akurat dr platform trsb
  //misal di dev dengan amdroid.
  static double screenWidth = 0.0;
  static double screenHeight = 0.0;
  static double defaultSize = 0.0;
  //fungsi dr fungsi ini adalah untuk pemanggilan awal ketika aplikasi dijalan kan dan utnuk mendapatkan ukuran dr layar platform
  void init(BuildContext context){
  _mediaQueryData = MediaQuery.of(context);
  screenWidth = _mediaQueryData.size.width;
  screenHeight = _mediaQueryData.size.height;
  }
}

double getProporsionetScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  return (inputHeight / 812.0) * screenHeight;
  
}