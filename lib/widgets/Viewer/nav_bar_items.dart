import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/controllers/cart_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

CartController cartController = Get.put(CartController());

List<PersistentBottomNavBarItem> navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: _tab(
          'assets/images/home.png', 'Grocery', ColorsFactory.activeBottomTab),
      inactiveIcon: _tab('assets/images/home.png', 'Grocery',
          ColorsFactory.disActiveBottomTab),
      activeColorPrimary: ColorsFactory.activeBottomTab,
      inactiveColorPrimary: ColorsFactory.disActiveBottomTab,
    ),
    PersistentBottomNavBarItem(
      icon:
          _tab('assets/images/news.png', 'News', ColorsFactory.activeBottomTab),
      inactiveIcon: _tab(
          'assets/images/news.png', 'News', ColorsFactory.disActiveBottomTab),
      activeColorPrimary: ColorsFactory.activeBottomTab,
      inactiveColorPrimary: ColorsFactory.disActiveBottomTab,
    ),
    PersistentBottomNavBarItem(
      icon: Stack(
        alignment: Alignment.topCenter,
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: Text(
                  "\$ ${cartController.totalPrice.value.toInt()}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 7.0, left: 7.0),
            child: _tab('assets/images/total.png', '', Colors.white),
          ),
        ],
      ),
      inactiveIcon: Stack(
        alignment: Alignment.topCenter,
        children: [
          Obx(() => Padding(
                padding: const EdgeInsets.only(right: 7.0),
                child: Text(
                  "\$ ${cartController.totalPrice.value.toInt()}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 12),
                ),
              )),
          Padding(
            padding: const EdgeInsets.only(top: 7.0, left: 7.0),
            child: _tab('assets/images/total.png', '', Colors.white),
          ),
        ],
      ),
      activeColorPrimary: ColorsFactory.activeBottomTab,
      inactiveColorPrimary: ColorsFactory.disActiveBottomTab,
    ),
    PersistentBottomNavBarItem(
      icon: _tab(
          'assets/images/fav.png', 'Favorite', ColorsFactory.activeBottomTab),
      inactiveIcon: _tab('assets/images/fav.png', 'Favorite',
          ColorsFactory.disActiveBottomTab),
      activeColorPrimary: ColorsFactory.activeBottomTab,
      inactiveColorPrimary: ColorsFactory.disActiveBottomTab,
    ),
    PersistentBottomNavBarItem(
      icon:
          _tab('assets/images/cart.png', 'Cart', ColorsFactory.activeBottomTab),
      inactiveIcon: _tab(
          'assets/images/cart.png', 'Cart', ColorsFactory.disActiveBottomTab),
      activeColorPrimary: ColorsFactory.activeBottomTab,
      inactiveColorPrimary: ColorsFactory.disActiveBottomTab,
    ),
  ];
}

Widget _tab(String image, String title, Color color) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset(
        image,
        color: color,
        width: 25,
        height: 25,
      ),
      Text(
        title,
        style: TextStyle(fontSize: 10, color: color),
      )
    ],
  );
}
