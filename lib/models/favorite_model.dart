import 'package:get/get.dart';

class FavoriteModel {
  final String image;
  final String title;
  final int pieces;
  final String minAway;
  final double price;
  final double previousPrice;
  Rx<bool> isSelect;

  FavoriteModel({
    required this.image,
    required this.title,
    required this.minAway,
    required this.pieces,
    required this.previousPrice,
    required this.price,
    required this.isSelect,
  });
}
