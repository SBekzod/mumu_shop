import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';

class UserProductsScreen extends StatelessWidget {
  static const routeName = "managed-products";

  @override
  Widget build(BuildContext context) {
    final String arg = (ModalRoute.of(context).settings.arguments as String);
    print('arg: $arg');

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Added Products'),
      ),
      drawer: AppDrawer(),
      body: ListView.builder(
          itemCount: 10,
          itemBuilder: (_, i) {
            return Text('TEST');
          }),
    );
  }
}
