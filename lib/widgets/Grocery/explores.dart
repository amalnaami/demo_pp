import 'dart:math' as math;

import 'package:demo_app/Factories/text_factory.dart';
import 'package:demo_app/models/category_model.dart';
import 'package:flutter/material.dart';

class Explores extends StatelessWidget {
  const Explores({
    Key? key,
    required this.categoryModel,
  }) : super(key: key);
  final CategoryModel categoryModel;
  final double _padding = 15.0;
  final double _margin = 5.0;
  final double _containerSize = 70.0;
  final double _containerRadius = 15.0;
  final double _opacity = 0.5;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: _padding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _imageDeals(),
          TextFactory.buildNormalText3(categoryModel.name,
              weight: FontWeights.regular),
        ],
      ),
    );
  }

  Widget _imageDeals() {
    return Container(
      margin: EdgeInsets.only(bottom: _margin),
      width: _containerSize,
      height: _containerSize,
      decoration: _decoration(),
    );
  }

  Decoration? _decoration() {
    return BoxDecoration(
        image: DecorationImage(
            image: AssetImage(categoryModel.image), fit: BoxFit.cover),
        borderRadius: BorderRadius.circular(_containerRadius),
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(_opacity));
  }
}
