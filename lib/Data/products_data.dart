import 'package:flutter/material.dart';
import 'package:tumbler/models/products_model.dart';

final List<ProductsModel> products = [
  ProductsModel(
    id: 1,
    title: "Call of Duty",
    //data asli ber sifat int

    //data yg sudah dikonversi manjadi string
    // => "433800"
    size: 100,
    description:
        "game tembak-menembak orang pertama (FPS) gratis yang dikembangkan oleh TiMi Studio Group dan diterbitkan oleh Activision serta Garena, tersedia untuk perangkat Android dan iOS",
    image: "assets/images/drinkware/cod.png",
    color: Colors.transparent,
  ),
  ProductsModel(
    id: 2,
    title: "Mobile Legends",

    size: 100,
    description:
        "game mobile bergenre Multiplayer Online Battle Arena (MOBA) yang populer, di mana dua tim beranggotakan lima pemain bertarung untuk menghancurkan markas musuh sambil mempertahankan markas sendiri",
    image: "assets/images/drinkware/ml.png",
    color: Colors.transparent,
  ),
  ProductsModel(
    id: 3,
    title: "Free Fire",

    size: 100,
    description:
        "game battle royale mobile gratis yang populer, di mana 50 pemain parasut ke pulau terpencil dan bertarung untuk menjadi yang terakhir bertahan hidup dalam pertandingan berdurasi 10 menit",
    image: "assets/images/drinkware/freefire.png",
    color: Colors.transparent,
  ),
  ProductsModel(
    id: 4,
    title: "Roblox",

    size: 100,
    description:
        "platform global tempat jutaan orang dapat menciptakan, berbagi, dan memainkan berbagai game dan pengalaman virtual 3D yang dibuat oleh pengguna lainnya",
    image: "assets/images/drinkware/roblox.png",
    color: Colors.transparent,
  ),
  ProductsModel(
    id: 5,
    title: "Honkai Starrail",
    // price: 425500,
    size: 100,
    description:
        " game RPG (Role-Playing Game) turn-based free-to-play dari HoYoverse yang menawarkan petualangan kosmik di jalur Astral Express untuk menjelajahi berbagai dunia fantastis dan melawan musuh dengan tim beranggotakan empat karakter",
    image: "assets/images/drinkware/starail.png",
    color: Colors.transparent,
  ),
  ProductsModel(
    id: 6,
    title: "Honor of Kings",

    size: 100,
    description:
        "game bergenre Multiplayer Online Battle Arena (MOBA) 5 lawan 5 yang dirancang untuk perangkat seluler, di mana dua tim saling bertanding untuk menghancurkan markas musuh",
    image: "assets/images/drinkware/HOK.png",
    color: Colors.transparent,
  ),
];
