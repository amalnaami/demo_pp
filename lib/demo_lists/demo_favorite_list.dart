import 'package:demo_app/models/favorite_model.dart';
import 'package:get/get.dart';

List<FavoriteModel> demoFavoriteList = [
  FavoriteModel(
      image: "assets/images/1.jpg",
      title: 'Watermelon, Fruit Juice',
      minAway: '15 Minutes Away',
      pieces: 5,
      previousPrice: 18,
      price: 12,
      isSelect: false.obs),
  FavoriteModel(
      image: "assets/images/2.jpg",
      title: 'Dounts',
      minAway: '10 Minutes Away',
      pieces: 1,
      previousPrice: 7,
      price: 2,
      isSelect: false.obs),
  FavoriteModel(
      image: "assets/images/3.jpg",
      title: 'Summer sun ice cream.',
      minAway: '45 Minutes Away',
      pieces: 5,
      previousPrice: 90,
      price: 50,
      isSelect: false.obs),
  FavoriteModel(
      image: "assets/images/4.jpg",
      title: 'Milk Ice Cream',
      minAway: '2 Minutes Away',
      pieces: 10,
      previousPrice: 20,
      price: 10,
      isSelect: false.obs),
];
