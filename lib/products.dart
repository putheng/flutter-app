import 'package:flutter/material.dart';

class Products extends StatelessWidget {
  final List<Map<String, dynamic>> products;

  Products(this.products);

  Widget _buildProductionItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(products[index]['image']),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  products[index]['title'],
                  style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Oswald',
                  ),
                ),
                SizedBox(
                  height: 10.0
                ),
                Container(
                  child: Text(
                    '\$${products[index]['price'].toString()}',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                    color: Theme.of(context).accentColor,
                    borderRadius: BorderRadius.circular(5.0)
                  ),
                  padding: EdgeInsets.all(3.0),
                  margin: EdgeInsets.only(left: 5.0),
                ),
              ],
            ),
            padding: EdgeInsets.only(top: 10.0),
          ),
          Container(
            child: Text('Product description'),
            padding: EdgeInsets.all(5.0),
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          ButtonBar(alignment: MainAxisAlignment.center, children: <Widget>[
            FlatButton(
              child: Text('Details'),
              onPressed: () => Navigator
                .pushNamed<bool>(context, '/product/' + index.toString())
                
            ),
          ]),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return products.length > 0
        ? ListView.builder(
            itemBuilder: _buildProductionItem,
            itemCount: products.length,
          )
        : Center(child: Text('No product found, please add some!'));
  }
}
