import 'package:flutter/material.dart';
import 'package:flutter_complete_guide/widgets/cart_item.dart' as aimed;
import '../providers/cart.dart' show Cart;
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final String arg = (ModalRoute.of(context).settings.arguments as String);
    print('arg: $arg');

    Cart cart = Provider.of<Cart>(context);
    var list = cart.items.values.toList();

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Total:',
                    style: TextStyle(fontSize: 20),
                  ),
                  Spacer(),
                  Chip(
                    backgroundColor: Theme.of(context).primaryColor,
                    label: Text(
                      '\$${cart.totalAmount}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              .color),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('order now button is pressed');
                    },
                    child: Text(
                      'ORDER NOW',
                      style: TextStyle(fontSize: 16),
                    ),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cart.productTypeQuantityOnCart,
              itemBuilder: (ctx, i) => aimed.CartItem(
                list[i].id,
                list[i].price,
                list[i].quantity,
                list[i].title,
                cart.items.keys.toList()[i],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
