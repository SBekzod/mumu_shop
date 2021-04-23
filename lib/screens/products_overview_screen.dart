import 'package:flutter/material.dart';
import '../widgets/products_grid_sample.dart';

class ProductsOverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MyShop'),
      ),
      body: ProductsGridSample(),
    );
  }
}
