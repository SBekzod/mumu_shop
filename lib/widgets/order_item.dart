import 'package:flutter/material.dart';
import '../providers/orders.dart' as aimed;
import 'package:intl/intl.dart';

class OrderItem extends StatelessWidget {
  final aimed.OrderItem orderItem;

  OrderItem(this.orderItem);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          ListTile(
            title: Text('\$${orderItem.amount}'),
            subtitle: Text(
              DateFormat('dd MM yyyy hh:mm').format(orderItem.time),
            ),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {
                print('butt: expend_more button was pressed');
              },
            ),
          ),
        ],
      ),
    );
  }
}
