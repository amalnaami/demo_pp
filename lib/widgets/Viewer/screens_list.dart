import 'package:demo_app/screens/Cart/cart.dart';
import 'package:demo_app/screens/Favourite/favourite.dart';
import 'package:demo_app/screens/Grocery/grocery.dart';
import 'package:flutter/material.dart';

List<Widget> buildScreens() {
  return [Grocery(), const SizedBox(), const SizedBox(), Favourite(), Cart()];
}
