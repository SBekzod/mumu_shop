import 'package:flutter/material.dart';

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
              },
            ),
            IconButton(
              icon: Icon(Icons.delete),
              onPressed: () {
                print('butt: delete button was pressed');
              },
            )
          ],
        ),
      ),
    );
  }
}
