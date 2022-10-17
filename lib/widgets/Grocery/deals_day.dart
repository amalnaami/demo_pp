import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/Factories/text_factory.dart';
import 'package:demo_app/controllers/grocery_controller.dart';
import 'package:demo_app/models/favorite_model.dart';
import 'package:demo_app/widgets/Grocery/size_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DealsDay extends StatefulWidget {
  const DealsDay({Key? key, required this.favoriteModel}) : super(key: key);
  final FavoriteModel favoriteModel;

  @override
  State<DealsDay> createState() => _DealsDayState();
}

class _DealsDayState extends State<DealsDay> {
  final GroceryController groceryController = Get.find();

  final double _containerRadius = 15.0;

  final double _padding = 40.0;
  final double _borderWidth = 1.0;
  final double _imageSize = 90.0;
  final double topPadding = 10.0;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: _padding),
      child: Stack(
        alignment: Alignment.topLeft,
        children: [
          Padding(
            padding: EdgeInsets.only(top: topPadding),
            child: Row(
              children: [_image(), SizeBox(width: 20), _details()],
            ),
          ),
          _addToFav(),
        ],
      ),
    );
  }

  Widget _image() {
    return Container(
        width: _imageSize, height: _imageSize, decoration: _decoration());
  }

  Decoration? _decoration() {
    return BoxDecoration(
      border: Border.all(
          width: _borderWidth, color: ColorsFactory.textFieldBorderColor),
      borderRadius: BorderRadius.circular(_containerRadius),
      image: DecorationImage(
          image: AssetImage(widget.favoriteModel.image), fit: BoxFit.cover),
    );
  }

  Widget _details() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFactory.buildNormalText3(widget.favoriteModel.title),
        TextFactory.buildNormalText3("Pieces ${widget.favoriteModel.pieces}",
            weight: FontWeights.regular),
        Row(
          children: [
            const Icon(
              Icons.location_on_outlined,
              size: 22,
            ),
            TextFactory.buildNormalText4(widget.favoriteModel.minAway),
          ],
        ),
        Row(
          children: [
            TextFactory.buildNormalText3("\$ ${widget.favoriteModel.price}",
                color: ColorsFactory.rebLocationContainer),
            SizeBox(),
            Stack(
              alignment: Alignment.center,
              children: [
                TextFactory.buildNormalText3(
                    "\$ ${widget.favoriteModel.previousPrice}",
                    color: ColorsFactory.darkGrey),
                Container(
                  height: 1,
                  width: 50,
                  color: Colors.black,
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }

  Widget _addToFav() {
    return InkWell(
      onTap: onTap(),
      child: Obx(() => CircleAvatar(
            radius: 15,
            backgroundColor: ColorsFactory.bottomAppBar,
            child: Icon(
              widget.favoriteModel.isSelect.value
                  ? Icons.favorite
                  : Icons.favorite_border_rounded,
              size: 16,
              color: widget.favoriteModel.isSelect.value
                  ? ColorsFactory.activeBottomTab
                  : ColorsFactory.disActiveBottomTab,
            ),
          )),
    );
  }

  VoidCallback onTap() => () {
        setState(() {
          widget.favoriteModel.isSelect.value =
              !widget.favoriteModel.isSelect.value;
          if (widget.favoriteModel.isSelect.value) {
            groceryController.favoriteList.add(widget.favoriteModel);
          } else {
            groceryController.favoriteList.remove(widget.favoriteModel);
          }
        });
      };
}
