import 'package:flutter/material.dart';
import 'package:shop_app/screens/cart_screen.dart';
import 'package:shop_app/screens/edit_product_screen.dart';
import 'package:shop_app/screens/order_screen.dart';
import 'package:shop_app/screens/products_overview_screen.dart';


// We need satefull widget for our categories

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Home", "Cart", "Orders", "Edit Product"];
  Color kTextColor = Color(0xFF535353);
  Color kTextLightColor = Color(0xFFACACAC);
  // By default our first item will be selected
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20.0),
      child: SizedBox(
        height: 25,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        if(index == 0){
          Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsOverviewScreen()));
        } else if(index == 1){
          Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
        } else if(index == 2){
          Navigator.push(context, MaterialPageRoute(builder: (context) => OrdersScreen()));
        } else if(index == 3){
          Navigator.push(context, MaterialPageRoute(builder: (context) => EditProductScreen()));
        }
        // index == 0 ? Navigator.push(context, MaterialPageRoute(builder: (context) => ProductsOverviewScreen())) : Navigator.push(context, MaterialPageRoute(builder: (context) => CartScreen()));
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? kTextColor : kTextLightColor,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20 / 4), //top padding 5
              height: 2,
              width: 30,
              color: selectedIndex == index ? Colors.black : Colors.transparent,
            ),


          ],
        ),
      ),
    );
  }
}
