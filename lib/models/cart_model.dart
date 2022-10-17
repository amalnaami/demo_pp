import 'package:get/get.dart';

class CartModel {
  final String image;
  final String name;
  final String services;
  final double price;
  final RxInt count;
  Rx<bool> isSelect;

  CartModel({
    required this.image,
    required this.name,
    required this.services,
    required this.price,
    required this.count,
    required this.isSelect,
  });
}
