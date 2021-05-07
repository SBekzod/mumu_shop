import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/cart.dart';

class CartItem extends StatelessWidget {
  final String id;
  final double price;
  final int quantity;
  final String title;
  final String productId;

  CartItem(
    this.id,
    this.price,
    this.quantity,
    this.title,
    this.productId,
  );

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: false);
    return Dismissible(
      onDismissed: (dismissed) {
        print('dismissed: to delete productId from cart: ${this.productId}');
        cart.deleteCartItem(this.productId);
      },
      key: ValueKey(this.id),
      confirmDismiss: (direction) {
        return showDialog(
            context: context,
            builder: (ctx) {
              return AlertDialog(
                title: Text('Are you use'),
                content: Text('Do you want to remove item'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      print('butt: pressed yes');
                      Navigator.of(ctx).pop(true);
                    },
                    child: Text('YES'),
                  ),
                  TextButton(
                    onPressed: () {
                      print('butt: pressed no');
                      Navigator.of(ctx).pop(false);
                    },
                    child: Text('NO'),
                  ),
                ],
              );
            });
      },
      direction: DismissDirection.endToStart,
      background: Container(
        color: Theme.of(context).errorColor,
        child: Icon(
          Icons.delete,
          size: 40,
          color: Colors.white,
        ),
        alignment: Alignment.centerRight,
        padding: EdgeInsets.only(right: 20),
        margin: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 5,
        ),
      ),
      child: Card(
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
            subtitle: Text(
              'Total \$${this.price * this.quantity}',
            ),
            trailing: Text(
              '$quantity x',
            ),
          ),
        ),
      ),
    );
  }
}
