import 'package:demo_app/models/cart_model.dart';
import 'package:demo_app/models/favorite_model.dart';
import 'package:get/get.dart';

class GroceryController extends GetxController {
  RxList<FavoriteModel> favoriteList = <FavoriteModel>[].obs;
  RxList<CartModel> cartList = <CartModel>[].obs;
}
