import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/product.dart';
import 'package:shop_app/ui/add_to_cart.dart';
import 'package:shop_app/ui/color_and_size.dart';
import 'package:shop_app/ui/constants.dart';
import 'package:shop_app/ui/counter_with_fav_btn.dart';
import 'package:shop_app/ui/description.dart';

import '../providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  // final String title;
  // final double price;

  // ProductDetailScreen(this.title, this.price);
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final productId =
        ModalRoute.of(context).settings.arguments as String; // is the id!
    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        backgroundColor: Colors.redAccent,
        body:

        buildSingleChildScrollView(size, loadedProduct, context));

    // CustomScrollView(
    //   slivers: [
    //     SliverAppBar(
    //       expandedHeight: 300,
    //       pinned: true,
    //       flexibleSpace: FlexibleSpaceBar(
    //         title: Text(loadedProduct.title),
    //         background: Hero(
    //           tag: loadedProduct.id,
    //           child: Image.network(
    //             loadedProduct.imageUrl,
    //             fit: BoxFit.cover,
    //           ),
    //         ),
    //       ),
    //     ),
    //     SliverList(
    //         delegate: SliverChildListDelegate([
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Text(
    //         '\$${loadedProduct.price}',
    //         style: TextStyle(
    //           color: Colors.grey,
    //           fontSize: 20,
    //         ),
    //       ),
    //       SizedBox(
    //         height: 10,
    //       ),
    //       Container(
    //         padding: EdgeInsets.symmetric(horizontal: 10),
    //         width: double.infinity,
    //         child: Text(
    //           loadedProduct.description,
    //           textAlign: TextAlign.center,
    //           softWrap: true,
    //         ),
    //       )
    //     ])),
    //   ],
    // ),
    // );

    // Size size = MediaQuery.of(context).size;
    // return SingleChildScrollView(
    //   child: Column(
    //     children: <Widget>[
    //       SizedBox(
    //         height: size.height,
    //         child: Stack(
    //           children: <Widget>[
    //             Container(
    //               margin: EdgeInsets.only(top: size.height * 0.3),
    //               padding: EdgeInsets.only(
    //                 top: size.height * 0.12,
    //                 left: kDefaultPaddin,
    //                 right: kDefaultPaddin,
    //               ),
    //               // height: 500,
    //               decoration: BoxDecoration(
    //                 color: Colors.white,
    //                 borderRadius: BorderRadius.only(
    //                   topLeft: Radius.circular(24),
    //                   topRight: Radius.circular(24),
    //                 ),
    //               ),
    //               child: Column(
    //                 children: <Widget>[
    //                   // ColorAndSize(product: product),
    //                   // SizedBox(height: kDefaultPaddin / 2),
    //                   // Description(product: product),
    //                   // SizedBox(height: kDefaultPaddin / 2),
    //                   // CounterWithFavBtn(),
    //                   // SizedBox(height: kDefaultPaddin / 2),
    //                   // AddToCart(product: product)
    //                 ],
    //               ),
    //             ),
    //   Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20),
    //     child: Column(
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: <Widget>[
    //         Text(
    //           "Aristocratic Hand Bag",
    //           style: TextStyle(color: Colors.white),
    //         ),
    //         Text(
    //           productId.title,
    //           style: Theme.of(context)
    //               .textTheme
    //               .headline4
    //               .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
    //         ),
    //         SizedBox(height: 20),
    //         Row(
    //           children: <Widget>[
    //             RichText(
    //               text: TextSpan(
    //                 children: [
    //                   TextSpan(text: "Price\n"),
    //                   TextSpan(
    //                     text: "\$${product.price}",
    //                     style: Theme.of(context).textTheme.headline4.copyWith(
    //                         color: Colors.white, fontWeight: FontWeight.bold),
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(width: 20),
    //             Expanded(
    //               child: Hero(
    //                 tag: "${productId.id}",
    //                 child: Image.asset(
    //                   product.image,
    //                   fit: BoxFit.fill,
    //                 ),
    //               ),
    //             )
    //           ],
    //         )
    //       ],
    //     ),
    //   );              ],
    //         ),
    //       )
    //     ],
    //   ),
    // );
    //
  }

  SingleChildScrollView buildSingleChildScrollView(
      Size size, Product loadedProduct, BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          SizedBox(
            height: size.height,
            child: Stack(
              children: <Widget>[
                Container(
                  margin: EdgeInsets.only(top: size.height * 0.3),
                  padding: EdgeInsets.only(
                    top: size.height * 0.12,
                    left: 20,
                    right: 20,
                  ),
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(24),
                      topRight: Radius.circular(24),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      ColorAndSize(),
                      SizedBox(height: kDefaultPaddin / 2),
                      Description(),
                      SizedBox(height: kDefaultPaddin / 2),
                      CounterWithFavBtn(),
                      SizedBox(height: kDefaultPaddin / 2),
                      AddToCart()
                    ],
                  ),
                ),
                buildPadding(loadedProduct, context),
              ],
            ),
          )
        ],
      ),
    );
  }

  Padding buildPadding(Product loadedProduct, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPaddin,vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(
            "Aristocratic Hand Bag",
            style: TextStyle(color: Colors.white),
          ),
          Text(
            loadedProduct.title,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: kDefaultPaddin),
          Row(
            children: <Widget>[
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(text: "Price\n"),
                    TextSpan(
                      text: "\$${loadedProduct.price}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(width: kDefaultPaddin),
              Expanded(
                child: Hero(
                  tag: "${loadedProduct.id}",
                  child: Image.network(
                    loadedProduct.imageUrl,
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
