import 'package:flutter/material.dart';

class CartItem {
  final String id;
  final String title;
  final int quantity;
  final double price;

  CartItem(
      {@required this.id,
      @required this.price,
      @required this.quantity,
      @required this.title});
}

class Cart with ChangeNotifier {
  Map<String, CartItem> _items = {};

  Map<String, CartItem> get items {
    return {..._items};
  }

  void addCartItem(String productId, double price, String title) {
    if (_items.containsKey(productId)) {
      _items.update(productId, (target) {
        return CartItem(
            id: target.id,
            price: target.price,
            quantity: target.quantity + 1,
            title: target.title);
      });
    } else {
      _items[productId] = CartItem(
          id: DateTime.now().toString(),
          price: price,
          quantity: 1,
          title: title);
    }
    notifyListeners();
  }

  int get productTypeQuantityOnCart {
    return _items.length;
  }

}
