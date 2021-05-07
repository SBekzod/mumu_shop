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

  void deleteCartItem(String productId) {
    if (_items.containsKey(productId)) {
      _items.remove(productId);
      notifyListeners();
    } else {
      print('Error: the productId is not on cart');
    }
  }

  double get totalAmount {
    double total = 0;
    _items.forEach((key, value) {
      total += value.quantity * value.price;
    });
    return total;
  }

  int get productTypeQuantityOnCart {
    return _items.length;
  }

  void clearCart() {
    _items = {};
    notifyListeners();
  }

  List<CartItem> get allCartProducts {
    return _items.values.toList();
  }

  void removeSingleItem(String productId) {
    if (!_items.containsKey(productId)) {
      print('PClass: cart has no product with $productId');
      return;
    } else if (_items[productId].quantity > 1) {
      print('PClass: cart has at least 2');
      _items.update(
          productId,
          (value) => CartItem(
              id: value.id,
              price: value.price,
              quantity: value.quantity - 1,
              title: value.title));
    } else {
      print('PClass: cart has 1');
      _items.remove(productId);
    }
    notifyListeners();
  }
}
