import 'package:flutter/material.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';
import '../screens/edit_product_screen.dart';

class UserProductItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String productId;

  UserProductItem({
    @required this.title,
    @required this.imageUrl,
    this.productId,
  });

  @override
  Widget build(BuildContext context) {
    Products products = Provider.of<Products>(context, listen: false);

    return ListTile(
      title: Text(this.title),
      leading: CircleAvatar(
        backgroundImage: (this.imageUrl != "none")
            ? NetworkImage(this.imageUrl)
            : AssetImage('assets/pictures/${this.productId}.jpg'),
      ),
      trailing: Container(
        width: 100,
        child: Row(
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.edit),
              onPressed: () {
                print('butt: edit button was pressed');
                Navigator.of(context).pushNamed(
                  EditProductScreen.routeName,
                  arguments: this.productId,
                );
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () async {
                print('butt: delete button was pressed');
                bool result = await showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text('Confirmation'),
                      content: Text('Do you want to delete?'),
                      actions: <Widget>[
                        new TextButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop(false);
                          },
                          child: Text('No'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop(true);
                          },
                          child: Text('Yes'),
                        ),
                      ],
                    );
                  },
                );
                if (result) {
                  print('the result true');
                  products.deleteProduct(this.productId);
                } else {
                  print('the result false, so do nothing');
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
