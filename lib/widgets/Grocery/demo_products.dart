// ignore_for_file: must_be_immutable
import 'dart:math' as math;

import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/Factories/text_factory.dart';
import 'package:demo_app/controllers/grocery_controller.dart';
import 'package:demo_app/models/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DemoProduct extends StatefulWidget {
  final CartModel cartModel;

  const DemoProduct({Key? key, required this.cartModel}) : super(key: key);

  @override
  State<DemoProduct> createState() => _DemoProductState();
}

class _DemoProductState extends State<DemoProduct> {
  final double _containerSize = 70.0;

  final double _containerRadius = 15.0;

  final double _padding = 5.0;
  final double _borderWidth = 2.0;
  final double _margin = 40.0;

  final GroceryController groceryController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: _decoration(),
      margin: EdgeInsets.only(right: _margin),
      padding: EdgeInsets.all(_padding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_productsImage(), _productDetails(), _addToCart()],
      ),
    );
  }

  Widget _productsImage() {
    return Container(
      width: _containerSize,
      height: _containerSize,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(widget.cartModel.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(_containerRadius),
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(0.5)),
    );
  }

  Widget _productDetails() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFactory.buildNormalText2(widget.cartModel.name),
          TextFactory.buildNormalText3(widget.cartModel.services,
              weight: FontWeights.regular, color: ColorsFactory.darkGrey),
          TextFactory.buildNormalText3("\$ ${widget.cartModel.price}",
              weight: FontWeights.regular,
              color: ColorsFactory.activeBottomTab),
        ],
      ),
    );
  }

  Widget _addToCart() {
    return InkWell(
      onTap: onTap(),
      child: CircleAvatar(
        backgroundColor: widget.cartModel.isSelect.value
            ? ColorsFactory.activeBottomTab
            : ColorsFactory.bottomAppBar,
        child: Image.asset("assets/images/cart.png",
            width: 25,
            color: widget.cartModel.isSelect.value
                ? ColorsFactory.bottomAppBar
                : ColorsFactory.activeBottomTab),
      ),
    );
  }

  Decoration _decoration() {
    return BoxDecoration(
      border: Border.all(width: _borderWidth, color: Colors.grey[100]!),
      borderRadius: BorderRadius.circular(_containerRadius),
    );
  }

  VoidCallback onTap() => () {
        setState(() {
          widget.cartModel.isSelect.value = !widget.cartModel.isSelect.value;
          if (widget.cartModel.isSelect.value) {
            groceryController.cartList.add(widget.cartModel);
          } else {
            groceryController.cartList.remove(widget.cartModel);
          }
        });
      };
}
