// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class SizeBox extends StatelessWidget {
  SizeBox({Key? key, this.height = 20, this.width = 20}) : super(key: key);
  double? height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: height!, width: width!);
  }
}
