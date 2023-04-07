import 'package:flutter/cupertino.dart';
import 'package:flutter_application_1/models/cart.dart';

class CartOperation with ChangeNotifier {
  //List of note
  List<Cart> baskets = [];

  // CartOperation({required String menu, required qty, price});

  List<Cart> get getBask {
    return baskets;
  }

  // CartOperation() {
  //   updateBask('BeefSteak',1,10);
  // }

  void updateBask(String menu, int qty, double price) {
    //Note object
    Cart addthis = Cart(menu, qty, price);
    for (var el in baskets) {
      if (el.menu == addthis.menu) {
        el.qty = qty;
      } else {
        baskets.add(addthis);
      }
    }
    notifyListeners();
  }
}
