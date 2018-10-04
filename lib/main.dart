import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:product/pages/auth.dart';
import 'package:product/pages/product.dart';
import 'package:product/pages/products.dart';
import 'package:product/pages/products_admin.dart';

void main() {
  //debugPaintSizeEnabled = true;

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState(){
    return _MyAppStatte();
  }

}

class _MyAppStatte extends State<MyApp> {
  List<Map<String, dynamic>> _products = [];

  void _addProduct(Map<String, dynamic> product){
    setState(() {
      _products.add(product);
    });
  }

  void _deleteProduct(int index){
    setState(() {
      _products.removeAt(index);
    });
  }

  @override
  Widget build(context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.deepOrange,
        accentColor: Colors.deepPurple,
      ),
      //home: AuthPage(),
      routes: {
        '/': (BuildContext context) => AuthPage(),
        '/products': (BuildContext context) => ProductsPage(_products),
        '/admin': (BuildContext context) => ProductsAdminPage(_addProduct, _deleteProduct),
      },
      onGenerateRoute: (RouteSettings settings) {
        final List<String> pathElements = settings.name.split('/');
        if(pathElements[0] != ''){
          return null;
        }
        if(pathElements[1] == 'product'){
          final int index = int.parse(pathElements[2]);
          return MaterialPageRoute<bool>(
            builder: (BuildContext context) => ProductPage(
              _products[index]['title'], _products[index]['image']
            ),
          );
        }
        return null;
      },
      onUnknownRoute: (RouteSettings settings){
        return MaterialPageRoute(
          builder: (BuildContext context) 
            => ProductsPage(_products),
        );
      },
    );
  }
}
