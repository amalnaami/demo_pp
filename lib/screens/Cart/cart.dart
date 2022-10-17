import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/Factories/text_factory.dart';
import 'package:demo_app/controllers/grocery_controller.dart';
import 'package:demo_app/widgets/Cart/cat_card.dart';
import 'package:demo_app/widgets/Grocery/size_box.dart';
import 'package:demo_app/widgets/Grocery/top_grocery_row.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  final double _padding = 20.0;
  final GroceryController groceryController = Get.find();

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
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeBox(height: 50),
        const TopGroceryRow(text: 'oxford Street'),
        TextFactory.buildNormalText2(
          'Cart',
        ),
        SizedBox(
            height: size.height,
            child: Obx(() => groceryController.cartList.isNotEmpty
                ? _cartList()
                : _noData()))
      ],
    );
  }

  Widget _cartList() {
    return ListView.builder(
        itemCount: groceryController.cartList.length,
        itemBuilder: (context, i) {
          return CartCard(cartModel: groceryController.cartList[i]);
        });
  }

  Widget _noData() {
    return Container(
        alignment: Alignment.topCenter,
        child: Image.asset("assets/images/nocarts.jpg"));
  }
}
