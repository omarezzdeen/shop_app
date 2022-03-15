import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/auth.dart';
import 'package:shop_app/ui/constants.dart';

import '../providers/cart.dart';
import '../providers/product.dart';
import '../screens/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  // final String id;
  // final String title;
  // final String imageUrl;

  // ProductItem(this.id, this.title, this.imageUrl);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);
    final authData = Provider.of<Auth>(context, listen: false);
    return GestureDetector(
      onTap:() {
              Navigator.of(context).pushNamed(
                ProductDetailScreen.routeName,
                arguments: product.id,
              );
            },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(kDefaultPaddin),
              // For  demo we use fixed height  and width
              // Now we dont need them
              // height: 380,
              // width: MediaQuery.of(context).size.height * .5,
              decoration: BoxDecoration(
                color: Colors.redAccent,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Hero(
                tag: "${product.id}",
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin / 20),
            child: Text(
              // products is out demo list
              product.title,
              style: TextStyle(color: kTextLightColor),
            ),
          ),
          Text(
            "\$${product.price}",
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );













    //   ClipRRect(
    //   borderRadius: BorderRadius.circular(10),
    //   child: GridTile(
    //     child: GestureDetector(
    //       onTap: () {
    //         Navigator.of(context).pushNamed(
    //           ProductDetailScreen.routeName,
    //           arguments: product.id,
    //         );
    //       },
    //       child: Hero(
    //         tag: product.id,
    //         child: FadeInImage(
    //           placeholder: AssetImage('assets/images/product-placeholder.png'),
    //           image: NetworkImage(product.imageUrl),
    //           fit: BoxFit.cover,
    //         ),
    //       ),
    //     ),
    //     footer: GridTileBar(
    //       backgroundColor: Colors.black87,
    //       leading: Consumer<Product>(
    //         builder: (ctx, product, _) => IconButton(
    //           icon: Icon(
    //             product.isFavorite ? Icons.favorite : Icons.favorite_border,
    //           ),
    //           color: Theme.of(context).accentColor,
    //           onPressed: () {
    //             product.toggleFavoriteStatus(
    //               authData.token,
    //               authData.userId,
    //             );
    //           },
    //         ),
    //       ),
    //       title: Text(
    //         product.title,
    //         textAlign: TextAlign.center,
    //       ),
    //       trailing: IconButton(
    //         icon: Icon(
    //           Icons.shopping_cart,
    //         ),
    //         onPressed: () {
    //           cart.addItem(product.id, product.price, product.title);
    //           // ignore: deprecated_member_use
    //           Scaffold.of(context).hideCurrentSnackBar();
    //           // ignore: deprecated_member_use
    //           Scaffold.of(context).showSnackBar(
    //             SnackBar(
    //               content: Text('Added item to cart!'),
    //               duration: Duration(seconds: 2),
    //               backgroundColor: Theme.of(context).primaryColor,
    //               action: SnackBarAction(
    //                   label: 'UNDO',
    //                   onPressed: () {
    //                     cart.removeSingleItem(product.id);
    //                   }),
    //             ),
    //           );
    //         },
    //         color: Theme.of(context).accentColor,
    //       ),
    //     ),
    //   ),
    // );
  }
}
