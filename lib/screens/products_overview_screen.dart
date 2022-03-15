import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/app_drawer.dart';
import 'package:shop_app/ui/constants.dart';


import '../providers/cart.dart';
import '../widgets/badge.dart';
import '../widgets/products_grid.dart';
import 'cart_screen.dart';

enum FilterOptions {
  Favorites,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  var _showOnlyFavorites = false;
  var _isInit = true;
  var _isLoading = false;

  @override
  void initState() {
    // Provider.of<Products>(context).fetchAndSetProducts();
    super.initState();
  }


  @override
  // ignore: must_call_super
  void didChangeDependencies() {
    if(_isInit){
      setState(() {
        _isLoading = true;
      });
      Provider.of<Products>(context).fetchAndSetProducts().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    _isInit = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);
    return Scaffold(

        appBar: AppBar(
          elevation: 0,
          // leading: IconButton(
          //   icon: SvgPicture.asset("assets/icons/back.svg"),
          //   onPressed: () {},
          // ),
          actions: <Widget>[
            IconButton(
              icon: SvgPicture.asset(
                "assets/icons/search.svg",
                // By default our  icon color is white
                color: kTextColor,
              ),
              onPressed: () {},
            ),
            PopupMenuButton(
              onSelected: (FilterOptions selectedValue) {
                setState(() {
                  if (selectedValue == FilterOptions.Favorites) {
                    _showOnlyFavorites = true;
                  } else {
                    _showOnlyFavorites = false;
                  }
                });
              },
              icon: SvgPicture.asset(
                "assets/icons/menu.svg",
                // By default our  icon color is white
                color: kTextColor,
              ),
              itemBuilder: (_) => [
                PopupMenuItem(
                  child: Text('Only Favorites'),
                  value: FilterOptions.Favorites,
                ),
                PopupMenuItem(
                  child: Text('Show All'),
                  value: FilterOptions.All,
                ),
              ],
            ),
            Consumer<Cart>(
            builder: (_, cart, ch) => Badge(
                    child: ch,
                    value: cart.itemCount.toString(),
                  ),
              child: IconButton(
                icon: SvgPicture.asset(
                  "assets/icons/cart.svg",
                  // By default our  icon color is white
                  color: kTextColor,
                ),
                onPressed: () {
                  Navigator.of(context).pushNamed(CartScreen.routeName);
                },
              ),
            ),
            SizedBox(width: kDefaultPaddin / 2)
          ],

        ),




      // appBar: AppBar(
      //   title: Text('MyShop'),
      //   actions: <Widget>[
      //     PopupMenuButton(
      //       onSelected: (FilterOptions selectedValue) {
      //         setState(() {
      //           if (selectedValue == FilterOptions.Favorites) {
      //             _showOnlyFavorites = true;
      //           } else {
      //             _showOnlyFavorites = false;
      //           }
      //         });
      //       },
      //       icon: Icon(
      //         Icons.more_vert,
      //       ),
      //       itemBuilder: (_) => [
      //         PopupMenuItem(
      //           child: Text('Only Favorites'),
      //           value: FilterOptions.Favorites,
      //         ),
      //         PopupMenuItem(
      //           child: Text('Show All'),
      //           value: FilterOptions.All,
      //         ),
      //       ],
      //     ),
      //     Consumer<Cart>(
      //       builder: (_, cart, ch) => Badge(
      //         child: ch,
      //         value: cart.itemCount.toString(),
      //       ),
      //       child: IconButton(
      //         icon: Icon(Icons.shopping_cart),
      //         onPressed: () {
      //           Navigator.of(context).pushNamed(CartScreen.routeName);
      //         },
      //       ),
      //     ),
      //   ],
      // ),

      drawer: AppDrawer(),
      body:_isLoading ? Center(child: CircularProgressIndicator(),) : ProductsGrid(_showOnlyFavorites),
    );
  }
}
