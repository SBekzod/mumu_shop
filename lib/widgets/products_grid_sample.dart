import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/products.dart';
import './product_item.dart';

class ProductsGridSample extends StatelessWidget {
  final bool showFavorites;

  ProductsGridSample(this.showFavorites);

  @override
  Widget build(BuildContext context) {
    // Listen Notifier Provider(LNP)
    final productsDate = Provider.of<Products>(context);
    final products = (showFavorites == true) ? productsDate.favoriteItems : productsDate.items;

    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      // Register Notifier Provider(RNP)
      itemBuilder: (ctx, i) => ChangeNotifierProvider.value(
        value: products[i],
        child: ProductItem(),
      ),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisExtent: 200),
    );
  }
}
