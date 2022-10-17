import 'package:get/get.dart';

class CartController extends GetxController {
  Rx<double> totalPrice = 0.0.obs;
  increment(RxInt count) {
    count++;
    update();
  }

  decrement(RxInt count) {
    if (count.value > 0) count--;
    update();
  }
}
