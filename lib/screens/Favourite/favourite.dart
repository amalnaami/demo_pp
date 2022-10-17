import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/Factories/text_factory.dart';
import 'package:demo_app/controllers/grocery_controller.dart';
import 'package:demo_app/widgets/Grocery/deals_day.dart';
import 'package:demo_app/widgets/Grocery/size_box.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Favourite extends StatelessWidget {
  Favourite({Key? key}) : super(key: key);
  final GroceryController groceryController = Get.find();
  final double _padding = 20.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: ColorsFactory.background,
      body: SingleChildScrollView(
          padding: EdgeInsets.all(_padding), child: _buildContent(size)),
    );
  }

  Widget _buildContent(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeBox(height: 50),
        TextFactory.buildNormalText2(
          'Favourite Products',
        ),
        SizedBox(
          height: size.height,
          child: Obx(() => groceryController.favoriteList.isNotEmpty
              ? _favList()
              : _noData()),
        )
      ],
    );
  }

  Widget _favList() {
    return ListView.builder(
      itemCount: groceryController.favoriteList.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 10.0),
          child: DealsDay(
            favoriteModel: groceryController.favoriteList[index],
          ),
        );
      },
    );
  }

  Widget _noData() {
    return Container(
      alignment: Alignment.topCenter,
      child: Image.asset("assets/images/no_data.jpg"),
    );
  }
}
