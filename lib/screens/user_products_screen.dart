import 'package:flutter/material.dart';
import '../providers/products.dart';
import './edit_product_screen.dart';
import '../widgets/user_product_item.dart';
import 'package:provider/provider.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = "managed-products";

  Future<void> _refreshProducts(BuildContext context) async {
    await Provider.of<Products>(context, listen: false).fetchAndSetProducts();
  }

  @override
  Widget build(BuildContext context) {
    final String arg = (ModalRoute.of(context).settings.arguments as String);
    print('arg: $arg');
    Products products = Provider.of<Products>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Added Products'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                print('butt: add button was pressed');
                Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: 'none',
                );
              })
        ],
      ),
      drawer: AppDrawer(),
      body: RefreshIndicator(
        onRefresh: () => _refreshProducts(context),
        child: Padding(
          padding: EdgeInsets.all(8),
          child: ListView.builder(
              itemCount: products.items.length,
              itemBuilder: (_, i) {
                return Column(children: <Widget>[
                  UserProductItem(
                    title: products.items[i].title,
                    imageUrl: products.items[i].imageUrl,
                    productId: products.items[i].id,
                  ),
                  Divider(),
                ]);
              }),
        ),
      ),
    );
  }
}
