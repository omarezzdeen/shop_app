import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/products.dart';

import 'constants.dart';

class Description extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final productId =
    ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Text(
        loadedProduct.description,
        style: TextStyle(height: 1.5),
      ),
    );
  }
}
