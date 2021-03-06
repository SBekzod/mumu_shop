import 'package:flutter/material.dart';
import './orders_screen.dart';
import '../widgets/app_drawer.dart';
import '../providers/orders.dart';
import '../widgets/cart_item.dart' as aimed;
import '../providers/cart.dart' show Cart;
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final String arg = (ModalRoute.of(context).settings.arguments as String);
    print('arg: $arg');

    Cart cart = Provider.of<Cart>(context, listen: false);
    var list = cart.items.values.toList();

    Orders orders = Provider.of<Orders>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      drawer: AppDrawer(),
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
                      '\$${cart.totalAmount.toStringAsFixed(2)}',
                      style: TextStyle(
                          color: Theme.of(context)
                              .primaryTextTheme
                              .headline6
                              .color),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      print('butt: order button is pressed');
                      if(cart.allCartProducts.isNotEmpty) {
                        orders.addOrder(cart.allCartProducts, cart.totalAmount);
                        cart.clearCart();
                      }
                      print('nav => going to myOrders');
                      Navigator.of(context).pushNamed(
                        OrdersScreen.routeName,
                        arguments: 'hello myOrders',
                      );
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
