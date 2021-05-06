import 'package:flutter/material.dart';
import '../providers/orders.dart';
import '../widgets/order_item.dart' as aimed;
import 'package:provider/provider.dart';

class OrdersScreen extends StatelessWidget {
  static const routeName = '/my-orders';

  @override
  Widget build(BuildContext context) {
    final String arg = (ModalRoute.of(context).settings.arguments as String);
    print('arg: $arg');
    final Orders orders = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('MY ORDERS'),
      ),
      body: ListView.builder(
        itemCount: orders.ordersData.length,
        itemBuilder: (ctx, i) => aimed.OrderItem(orders.ordersData[i]),
      ),
    );
  }
}
