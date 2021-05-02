import 'package:flutter/material.dart';
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
    Cart cart = Provider.of<Cart>(context);

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
          Badge(
            child: IconButton(
              onPressed: () {
                print('going to cart');
              },
              icon: Icon(
                Icons.add_shopping_cart,
                color: Colors.white,
              ),
            ),
            value: cart.productTypeQuantityOnCart.toString(),
          )
        ],
      ),
      body: ProductsGridSample(this._showOnlyFavorites),
    );
  }
}
