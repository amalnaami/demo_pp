import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/Factories/text_factory.dart';
import 'package:flutter/material.dart';

class TopGroceryRow extends StatelessWidget {
  const TopGroceryRow({Key? key, required this.text}) : super(key: key);
  final String text;
  final double _containersSize = 40.0;
  final double _padding = 10.0;
  final double _contentMargin = 20.0;
  final double _borderWidth = 1.5;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: _contentMargin),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [_locationWidget(), _circleProfile()],
      ),
    );
  }

  Widget _locationWidget() {
    return Container(
      height: _containersSize,
      decoration: _decoration(),
      padding: EdgeInsets.all(_padding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Icon(
            Icons.location_on_outlined,
            color: Colors.white,
          ),
          TextFactory.buildNormalText2(text, color: Colors.white),
          SizedBox(width: _padding)
        ],
      ),
    );
  }

  Widget _circleProfile() {
    return Container(
      width: _containersSize,
      height: _containersSize,
      decoration: _decorationCircleProfile(),
    );
  }

  Decoration _decorationCircleProfile() {
    return BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(width: _borderWidth, color: ColorsFactory.darkGrey));
  }

  Decoration _decoration() {
    return const BoxDecoration(
      color: ColorsFactory.rebLocationContainer,
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(20),
        topRight: Radius.circular(60),
        bottomLeft: Radius.circular(20),
        bottomRight: Radius.circular(20),
      ),
    );
  }
}
