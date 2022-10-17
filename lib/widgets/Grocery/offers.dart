import 'dart:math' as math;

import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/Factories/text_factory.dart';
import 'package:demo_app/models/offers_model.dart';
import 'package:demo_app/widgets/Grocery/size_box.dart';
import 'package:flutter/material.dart';

class Offers extends StatelessWidget {
  const Offers({Key? key, required this.offersModel}) : super(key: key);
  final OffersModel offersModel;
  final double _borderRadius = 15.0;
  final double _opacity = 0.5;
  final double _padding = 5.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width - 40,
      padding: EdgeInsets.all(_padding),
      margin: EdgeInsets.all(_padding),
      decoration: _decoration(),
      child: Row(
        children: [const Spacer(), _offerDetails()],
      ),
    );
  }

  Widget _offerDetails() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFactory.buildNormalText3(offersModel.productName,
            color: ColorsFactory.textRedColor),
        _name(),
        _price(),
        TextFactory.buildNormalText4(offersModel.available,
            color: Colors.white),
      ],
    );
  }

  Widget _name() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFactory.buildNormalText1("WHOPP"),
        TextFactory.buildNormalText1(
          "E",
          color: ColorsFactory.activeBottomTab,
        ),
        TextFactory.buildNormalText1("R"),
      ],
    );
  }

  Widget _price() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        TextFactory.buildNormalText2("\$ ${offersModel.priceAfter}",
            color: ColorsFactory.rebLocationContainer),
        SizeBox(),
        Stack(
          alignment: Alignment.center,
          children: [
            TextFactory.buildNormalText2("\$ ${offersModel.priceBefore}",
                color: Colors.white),
            _line()
          ],
        )
      ],
    );
  }

  Widget _line() {
    return Container(
      height: 1,
      width: 50,
      color: Colors.white,
    );
  }

  Decoration? _decoration() {
    return BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
        color: Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
            .withOpacity(_opacity));
  }
}
