import 'package:flutter/material.dart';
import '../screens/orders_screen.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            title: Text('Directions'),
            automaticallyImplyLeading: false,
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shop),
            title: Text('Go Shop'),
            onTap: () {
              print('dr.butt: go shop was pressed');
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Go My Orders'),
            onTap: () {
              print('dr.butt: go my orders was pressed');
              Navigator.of(context).pushNamed(
                OrdersScreen.routeName,
                arguments: 'hello my orders',
              );
            },
          )
        ],
      ),
    );
  }
}
