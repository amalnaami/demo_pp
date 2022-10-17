import 'package:demo_app/Factories/colors_factory.dart';
import 'package:demo_app/Factories/text_factory.dart';
import 'package:demo_app/demo_lists/demo_address_list.dart';
import 'package:demo_app/demo_lists/demo_cart_lists.dart';
import 'package:demo_app/demo_lists/demo_catoegry_lists.dart';
import 'package:demo_app/demo_lists/demo_favorite_list.dart';
import 'package:demo_app/demo_lists/demo_offers_list.dart';
import 'package:demo_app/widgets/Grocery/adress.dart';
import 'package:demo_app/widgets/Grocery/custom_text_field.dart';
import 'package:demo_app/widgets/Grocery/deals_day.dart';
import 'package:demo_app/widgets/Grocery/demo_products.dart';
import 'package:demo_app/widgets/Grocery/explores.dart';
import 'package:demo_app/widgets/Grocery/offers.dart';
import 'package:demo_app/widgets/Grocery/size_box.dart';
import 'package:demo_app/widgets/Grocery/top_grocery_row.dart';
import 'package:flutter/material.dart';

class Grocery extends StatelessWidget {
  Grocery({Key? key}) : super(key: key);
  final searchController = TextEditingController();
  final double _padding = 15.0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: ColorsFactory.background,
      body: SingleChildScrollView(
        padding: EdgeInsets.all(_padding),
        child: _buildContent(size),
      ),
    );
  }

  Widget _buildContent(Size size) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizeBox(height: 50),
        const TopGroceryRow(text: 'Mustafa St.'),
        CustomTextField(
            hint: 'Search in thousands of products',
            controller: searchController,
            prefix: const Icon(Icons.search)),
        SizedBox(
          height: size.height / 8,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: demoAddressList.length,
              itemBuilder: (context, index) {
                return Address(
                  addressModel: demoAddressList[index],
                );
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextFactory.buildNormalText2('Explore by Category'),
            TextFactory.buildNormalText3('See All (36)',
                weight: FontWeights.light),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 20),
          height: size.height / 8.5,
          child: ListView.builder(
            itemCount: demoCategoryList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Explores(
                categoryModel: demoCategoryList[index],
              );
            },
          ),
        ),
        TextFactory.buildNormalText2(
          'Deals of the day',
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 20),
          height: size.height / 8,
          child: ListView.builder(
            itemCount: demoFavoriteList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return DealsDay(
                favoriteModel: demoFavoriteList[index],
              );
            },
          ),
        ),
        TextFactory.buildNormalText2(
          'Demo Products',
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 20),
          height: size.height / 8,
          child: ListView.builder(
            itemCount: demoCartList.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return DemoProduct(
                cartModel: demoCartList[index],
              );
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.only(top: 10.0, bottom: 20),
          height: size.height / 6,
          child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: offersList.length,
              itemBuilder: (context, index) {
                return Offers(offersModel: offersList[index]);
              }),
        )
      ],
    );
  }
}
