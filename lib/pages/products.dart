import 'package:flutter/material.dart';

import 'package:product/product_manager.dart';

class ProductsPage extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  ProductsPage(this.products);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          children: <Widget>[
            AppBar(
              automaticallyImplyLeading: false,
              title: Text('Choose'),
            ),
            ListTile(
              title: Text('Manager Product'),
              onTap: () {
                Navigator.pushReplacementNamed(context, '/admin');
              },
            ),
          ]
        ),
      ),
      appBar: AppBar(
        title: Text('Easy List'),
      ),
      body: ProductManager(products),
    );
  }
}