import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../providers/product.dart';
import '../providers/products.dart';
import 'package:provider/provider.dart';

class EditProductScreen extends StatefulWidget {
  static const routeName = '/edit-product';

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  final _imageURLController = TextEditingController();
  final _imageURLFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _editedProduct = Product(
    id: null,
    title: '',
    price: 0,
    description: '',
    imageUrl: '',
  );

  @override
  void initState() {
    _imageURLFocusNode.addListener(_updateStateForURL);
    super.initState();
  }

  void _updateStateForURL() {
    print('FNL: listener on process');
    if (!_imageURLFocusNode.hasFocus) {
      if (!_imageURLController.text.startsWith('http') &&
          !_imageURLController.text.startsWith('https'))
        return;
      else
        setState(() {});
    }
  }

  @override
  void dispose() {
    _imageURLController.dispose();
    _imageURLFocusNode.removeListener(_updateStateForURL);
    super.dispose();
  }

  void _saveForm() {
    print('butt: save form was submitted');
    bool isValid = _form.currentState.validate();
    if (!isValid) {
      print('Not valid');
      return;
    }
    // running on save method within each input types
    _form.currentState.save();
    // saving on Products obj
    Provider.of<Products>(context, listen: false).addProduct(_editedProduct);
    Navigator.of(context).pop();
  }

  String validateTitle(value) {
    var size = value.split('').length;
    if (value.isEmpty) {
      return 'the value should not be empty';
    } else if (size < 4) {
      return 'the title should be at least four letters length';
    } else if (size > 15) {
      return 'the title should not be more than fourteen letters length';
    } else
      return null;
  }

  String validatePrice(value) {
    if (value.isEmpty) {
      return 'please enter the price amount';
    } else if (double.tryParse(value) == null) {
      return 'please enter number';
    } else if (double.parse(value) <= 0) {
      return 'please enter amount more than zero';
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final String arg = (ModalRoute.of(context).settings.arguments as String);
    print('arg: $arg');
    if (arg != 'none') {
      _editedProduct = Provider.of<Products>(context).findByProductId(arg);
      print('This is ID: ${_editedProduct.id}');
      print('This is PRICE: ${_editedProduct.price}');
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: _saveForm,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _form,
          child: ListView(
            children: <Widget>[
              TextFormField(
                initialValue: _editedProduct.title,
                decoration: InputDecoration(labelText: 'Title'),
                textInputAction: TextInputAction.next,
                validator: (value) {
                  return this.validateTitle(value);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: value,
                    price: _editedProduct.price,
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              TextFormField(
                decoration: InputDecoration(labelText: 'Price'),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.number,
                maxLength: 5,
                validator: (value) {
                  return this.validatePrice(value);
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    price: double.parse(value),
                    description: _editedProduct.description,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              TextFormField(
                initialValue: _editedProduct.description,
                decoration: InputDecoration(labelText: 'Description'),
                maxLines: 3,
                keyboardType: TextInputType.multiline,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'please enter the description';
                  } else if (value.length < 10) {
                    return 'the description should have at least 10 letter length';
                  } else {
                    return null;
                  }
                },
                onSaved: (value) {
                  _editedProduct = Product(
                    id: _editedProduct.id,
                    title: _editedProduct.title,
                    price: _editedProduct.price,
                    description: value,
                    imageUrl: _editedProduct.imageUrl,
                  );
                },
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Container(
                    width: 100,
                    height: 100,
                    margin: EdgeInsets.only(top: 8, right: 10),
                    decoration: BoxDecoration(
                        border: Border.all(width: 1, color: Colors.grey)),
                    // Image input result before submitting part 1
                    child: _imageURLController.text.isEmpty
                        ? Text('Enter an URL')
                        : FittedBox(
                            child: Image.network(
                              _imageURLController.text,
                              fit: BoxFit.cover,
                            ),
                          ),
                  ),
                  // Image input result before submitting part 2
                  Expanded(
                    child: TextFormField(
                      decoration: InputDecoration(labelText: 'Image URL'),
                      keyboardType: TextInputType.url,
                      textInputAction: TextInputAction.done,
                      controller: _imageURLController,
                      focusNode: _imageURLFocusNode,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'please enter url address';
                        } else if (!value.startsWith('http') &&
                            !value.startsWith('http')) {
                          return 'please enter valid url';
                        } else {
                          return null;
                        }
                      },
                      onFieldSubmitted: (_) {
                        _saveForm();
                      },
                      onSaved: (value) {
                        _editedProduct = Product(
                          id: _editedProduct.id,
                          title: _editedProduct.title,
                          price: _editedProduct.price,
                          description: _editedProduct.description,
                          imageUrl: value,
                        );
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
