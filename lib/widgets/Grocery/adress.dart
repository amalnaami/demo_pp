import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/Factories/text_factory.dart';
import 'package:demo_app/models/address_model.dart';
import 'package:demo_app/widgets/Grocery/size_box.dart';
import 'package:flutter/material.dart';

class Address extends StatelessWidget {
  const Address({Key? key, required this.addressModel}) : super(key: key);
  final AddressModel addressModel;
  final double _padding = 5.0;
  final double _margin = 20.0;
  final double _borderWidth = 1.0;
  final double _borderRadius = 15.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(top: _margin, bottom: _margin, right: _margin),
      width: size.width / 2.2,
      decoration: _decoration(ColorsFactory.background),
      padding: EdgeInsets.all(_padding),
      child: Row(
        children: [_image(), SizeBox(width: 8), _details()],
      ),
    );
  }

  Widget _details() {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          TextFactory.buildNormalText3(addressModel.placeName),
          TextFactory.buildNormalText4(addressModel.placeLoc),
          TextFactory.buildNormalText5(addressModel.placeStreet),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
        width: 50,
        height: 50,
        decoration: _decoration(ColorsFactory.brownColor));
  }

  Decoration? _decoration(Color color) {
    return BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(_borderRadius),
        border:
            Border.all(width: _borderWidth, color: ColorsFactory.brownColor));
  }
}
