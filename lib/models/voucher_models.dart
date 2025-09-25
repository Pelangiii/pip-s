import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';

class VoucherModels {
  final String image, title, description;
  final int price, size, id;
  // final String price;
  final Color color;

  VoucherModels({required this.image, required this.title, required this.description, required this.price, required this.size, required this.id, required this.color});

  String getFormattedPrice() {
    final formatter = NumberFormat.currency(locale: 'id_ID', symbol: 'Rp ', decimalDigits: 0);
    return formatter.format(price);
  }
}