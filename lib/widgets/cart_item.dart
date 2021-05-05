import 'package:flutter/material.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;

  CartItem(
    this.id,
    this.price,
    this.quantity,
    this.title,
  );

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 4,
      ),
      child: Padding(
        padding: EdgeInsets.all(8),
        child: ListTile(
          leading: CircleAvatar(
            child: Padding(
              padding: EdgeInsets.all(3),
              child: FittedBox(
                child: Text(
                  '\$${this.price}',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
          title: Text(this.title),
          subtitle: Text('Total \$${this.price * this.quantity}'),
          trailing: Text('$quantity x'),
        ),
      ),
    );
  }
}
