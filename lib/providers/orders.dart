import 'package:flutter/material.dart';
import './cart.dart';

class OrderItem {
  final String id;
  final double amount;
  final List<CartItem> cartProducts;
  final DateTime time;

  OrderItem({
    @required this.id,
    @required this.amount,
    @required this.time,
    @required this.cartProducts,
  });
}

class Orders with ChangeNotifier {
  List<OrderItem> _orders = [];

  List<OrderItem> get ordersData {
    return [..._orders];
  }

  void addOrder(List<CartItem> cartProducts, double total) {
    _orders.insert(
      0,
      OrderItem(
          id: DateTime.now().toString(),
          amount: total,
          time: DateTime.now(),
          cartProducts: cartProducts),
    );
    notifyListeners();
  }

}
