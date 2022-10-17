import 'package:demo_app/models/cart_model.dart';
import 'package:get/get.dart';

List<CartModel> demoCartList = [
  CartModel(
      image: "assets/images/turkis.jpg",
      name: "Turkis Steak",
      services: "173 Gram",
      price: 25,
      count: 0.obs,
      isSelect: false.obs),
  CartModel(
      image: "assets/images/salmon.jpg",
      name: "Salmon",
      services: "2 Serving",
      price: 30,
      count: 0.obs,
      isSelect: false.obs),
  CartModel(
      image: "assets/images/redJuce.jpg",
      name: "Red Juice",
      services: "1 Bottle",
      price: 25,
      count: 0.obs,
      isSelect: false.obs),
  CartModel(
      image: "assets/images/vresh.jpg",
      name: "Cola",
      services: "1 Bottle",
      price: 11,
      count: 0.obs,
      isSelect: false.obs),
];
