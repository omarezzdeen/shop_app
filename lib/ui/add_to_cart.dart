import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../providers/providers.dart';
import '../screens/screens.dart';
import 'constants.dart';

class AddToCart extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productId =
    ModalRoute.of(context).settings.arguments as String; // is the id!

    final loadedProduct = Provider.of<Products>(
      context,
      listen: false,
    ).findById(productId);
    final cart = Provider.of<Cart>(context, listen: false);

    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPaddin),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(right: kDefaultPaddin),
                height: 50,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    // color: product.color,
                  ),
                ),
                child: IconButton(
                  icon: SvgPicture.asset(
                    "assets/icons/add_to_cart.svg",
                    color: Colors.redAccent,
                  ),
                  onPressed: () {
                    cart.addItem(loadedProduct.id, loadedProduct.price, loadedProduct.title);
                    // ignore: deprecated_member_use
                    Scaffold.of(context).hideCurrentSnackBar();
                    // ignore: deprecated_member_use
                    Scaffold.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Added item to cart!'),
                        duration: Duration(seconds: 2),
                        backgroundColor: Theme.of(context).primaryColor,
                        action: SnackBarAction(
                            label: 'UNDO',
                            onPressed: () {
                              cart.removeSingleItem(loadedProduct.id);
                            }),
                      ),
                    );
                  },
                ),
              ),
              Expanded(
                child: SizedBox(
                  height: 50,
                  // ignore: deprecated_member_use
                  child: FlatButton(
                    color: Colors.redAccent,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18)),
                    // color: product.color,
                    onPressed: () {
                      Navigator.of(context).pushNamed(CartScreen.routeName);
                    },
                    child: Text(
                      "Buy  Now".toUpperCase(),
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
