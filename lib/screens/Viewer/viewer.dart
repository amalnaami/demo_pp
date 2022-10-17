import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/controllers/grocery_controller.dart';
import 'package:demo_app/widgets/Viewer/nav_bar_items.dart';
import 'package:demo_app/widgets/Viewer/screens_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

class Viewer extends StatefulWidget {
  static const routeName = '/Viewer';

  const Viewer({Key? key}) : super(key: key);

  @override
  State<Viewer> createState() => _ViewerState();
}

class _ViewerState extends State<Viewer> {
  PersistentTabController? _controller;

  GroceryController groceryController = Get.put(GroceryController());
  final int _milliseconds = 400;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PersistentTabView(
        context,
        controller: _controller,
        screens: buildScreens(),
        items: navBarsItems(),
        backgroundColor: ColorsFactory.bottomAppBar,
        decoration: const NavBarDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0), topRight: Radius.circular(0)),
        ),
        itemAnimationProperties: ItemAnimationProperties(
          duration: Duration(milliseconds: _milliseconds),
          curve: Curves.ease,
        ),
        screenTransitionAnimation: ScreenTransitionAnimation(
          animateTabTransition: true,
          curve: Curves.ease,
          duration: Duration(milliseconds: _milliseconds),
        ),
        navBarStyle:
            NavBarStyle.style15, // Choose the nav bar style with this property
      ),
    );
  }
}
