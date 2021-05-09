import 'dart:io';

import 'package:flutter/material.dart';
import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Listen Notifier Provider(LNP)
    Product targetProduct = Provider.of<Product>(context);
    final cart = Provider.of<Cart>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            print('Once tapped');
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: targetProduct.id,
            );
          },
          child: (targetProduct.imageUrl != "none")
              ? Image.network(
                  targetProduct.imageUrl,
                  fit: BoxFit.cover,
                )
              : Image.asset('assets/pictures/${targetProduct.id}.jpg'),
        ),
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: targetProduct.getFavoriteStatus == true
                ? Icon(Icons.favorite)
                : Icon(Icons.favorite_border),
            onPressed: () {
              targetProduct.toggleFavoriteStatus();
              print('favorite pressed');
            },
            color: Theme.of(context).accentColor,
          ),
          title: Text(
            targetProduct.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: Icon(Icons.shopping_cart_rounded),
            onPressed: () {
              print('the product is added successfully');
              cart.addCartItem(
                  targetProduct.id, targetProduct.price, targetProduct.title);
              ScaffoldMessenger.of(context).hideCurrentSnackBar();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    'ADDED ITEM TO CART',
                    style: TextStyle(fontSize: 16),
                  ),
                  duration: Duration(seconds: 2),
                  action: SnackBarAction(
                    label: 'UNDO',
                    onPressed: () {
                      print('snack: pressed undo action');
                      cart.removeSingleItem(targetProduct.id);
                    },
                  ),
                ),
              );
            },
            color: Theme.of(context).accentColor,
          ),
        ),
      ),
    );
  }
}
