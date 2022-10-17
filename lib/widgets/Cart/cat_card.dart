// ignore_for_file: must_be_immutable

import 'dart:math' as math;

import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/Factories/text_factory.dart';
import 'package:demo_app/controllers/cart_controller.dart';
import 'package:demo_app/models/cart_model.dart';
import 'package:demo_app/widgets/Grocery/size_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartCard extends StatelessWidget {
  final CartModel cartModel;

  CartCard({Key? key, required this.cartModel}) : super(key: key);

  final double _counterSize = 30.0;
  final double _containerSize = 70.0;
  final double _containerRadius = 15.0;
  final double _counterRadius = 5.0;
  final double _padding = 20.0;
  final double _opacity = 0.5;
  final double _minimizePadding = 10.0;
  final CartController _controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _padding),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _imageOfProduct(),
          SizeBox(),
          _detailsProducts(),
          _countProduct(),
        ],
      ),
    );
  }

  Widget _imageOfProduct() {
    return Container(
      width: _containerSize,
      height: _containerSize,
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(cartModel.image), fit: BoxFit.cover),
          borderRadius: BorderRadius.circular(_containerRadius),
          color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
              .withOpacity(_opacity)),
    );
  }

  Widget _detailsProducts() {
    return Expanded(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFactory.buildNormalText2(cartModel.name),
        TextFactory.buildNormalText3(cartModel.services,
            weight: FontWeights.regular, color: ColorsFactory.darkGrey),
        TextFactory.buildNormalText3("\$ ${cartModel.price}",
            weight: FontWeights.regular, color: ColorsFactory.activeBottomTab),
      ],
    ));
  }

  Widget _countProduct() {
    return Expanded(
        child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _counter(Icons.minimize_sharp, () {
          if (cartModel.count.value > 0) {
            _controller.totalPrice -= cartModel.price;
          }

          _controller.decrement(cartModel.count);
        }, true),
        Obx(() => TextFactory.buildNormalText2(cartModel.count.toString())),
        _counter(Icons.add, () {
          _controller.totalPrice += cartModel.price;

          _controller.increment(cartModel.count);
        }, false),
      ],
    ));
  }

  Widget _counter(IconData icon, VoidCallback onTap, bool minimize) {
    return InkWell(
      onTap: onTap,
      child: _counterWidget(icon, minimize),
    );
  }

  Widget _counterWidget(IconData icon, bool minimize) {
    return Stack(
      children: [
        Container(
          width: _counterSize,
          height: _counterSize,
          alignment: Alignment.center,
          padding: EdgeInsets.only(bottom: minimize ? _minimizePadding : 0),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(_counterRadius),
              color: ColorsFactory.counterColor.withOpacity(_opacity)),
          child: Icon(
            icon,
            color: ColorsFactory.counterColor,
          ),
        ),
      ],
    );
  }
}
