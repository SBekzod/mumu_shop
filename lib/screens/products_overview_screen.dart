import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import './cart_screen.dart';
import '../providers/cart.dart';
import '../widgets/badge.dart';
import 'package:provider/provider.dart';
import '../widgets/products_grid_sample.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;

  @override
  Widget build(BuildContext context) {
    Cart cart = Provider.of<Cart>(context, listen: true);

    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
        actions: <Widget>[
          PopupMenuButton(
            onSelected: (FilterOptions selectedValue) {
              print('Selected value: $selectedValue');
              if (selectedValue == FilterOptions.Favorites) {
                setState(() {
                  this._showOnlyFavorites = true;
                });
              } else {
                setState(() {
                  this._showOnlyFavorites = false;
                });
              }
            },
            icon: Icon(Icons.more_vert),
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text(
                  'Only favorites',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                value: FilterOptions.Favorites,
              ),
              PopupMenuItem(
                child: Text(
                  'Show all',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.black, fontSize: 20),
                ),
                value: FilterOptions.All,
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(right: 10),
            child: Badge(
              child: IconButton(
                onPressed: () {
                  print('nav => going to cart');
                  Navigator.of(context).pushNamed(
                    CartScreen.routeName,
                    arguments: 'hello cart',
                  );
                },
                icon: Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
              ),
              value: cart.productTypeQuantityOnCart.toString(),
            ),
          )
        ],
      ),
      drawer: AppDrawer(),
      body: ProductsGridSample(this._showOnlyFavorites),
    );
  }
}
