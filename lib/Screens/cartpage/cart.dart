import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'addresspage.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  List<Map<String, dynamic>> savedItems = [];

  @override
  void initState() {
    super.initState();
    _loadSavedProducts();
  }

  Future<void> _loadSavedProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String>? savedList = prefs.getStringList('saved_products');
    if (savedList != null) {
      setState(() {
        savedItems = savedList
            .map((item) => json.decode(item))
            .cast<Map<String, dynamic>>()
            .map((item) {
          item['quantity'] ??= 1;
          return item;
        }).toList();
      });
    }
  }

  Future<void> _saveUpdatedList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> updatedList =
    savedItems.map((item) => json.encode(item)).toList();
    await prefs.setStringList('saved_products', updatedList);
  }

  void _removeItem(int index) async {
    setState(() {
      savedItems.removeAt(index);
    });
    await _saveUpdatedList();
  }

  void _changeQuantity(int index, int change) async {
    setState(() {
      savedItems[index]['quantity'] += change;
      if (savedItems[index]['quantity'] < 1) {
        savedItems[index]['quantity'] = 1;
      }
    });
    await _saveUpdatedList();
  }

  double getTotal() {
    return savedItems.fold(0.0, (sum, item) {
      final price = item['price'];
      final quantity = item['quantity'] ?? 1;

      double parsedPrice;
      if (price is num) {
        parsedPrice = price.toDouble();
      } else if (price is String) {
        parsedPrice = double.tryParse(price) ?? 0.0;
      } else {
        parsedPrice = 0.0;
      }

      return sum + (parsedPrice * quantity);
    });
  }

  Widget productCard(Map<String, dynamic> product, int index) {
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Image.network(
              product['image'],
              width: 50,
              height: 50,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) =>
              const Icon(Icons.broken_image),
            ),
            SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(product['name'], style: TextStyle(fontSize: 16)),
                  SizedBox(height: 4),
                  Text("${product['price']} EGP",
                      style: TextStyle(color: Colors.grey[600])),
                ],
              ),
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  onPressed: () => _removeItem(index),
                  icon: Icon(FontAwesomeIcons.trash, color: Colors.red),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(FontAwesomeIcons.plus, size: 12),
                      onPressed: () => _changeQuantity(index, 1),
                    ),
                    Text("${product['quantity']}"),
                    IconButton(
                      icon: Icon(FontAwesomeIcons.minus, size: 12),
                      onPressed: () => _changeQuantity(index, -1),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(FontAwesomeIcons.arrowLeft, color: Colors.black54),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: savedItems.length,
                itemBuilder: (context, index) =>
                    productCard(savedItems[index], index),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Total", style: TextStyle(color: Colors.white)),
                      SizedBox(height: 4),
                      Text("${getTotal().toStringAsFixed(2)} EGP",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      double total = getTotal();
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => AddressPage(price: total),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding:
                      EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                      elevation: 3,
                    ),
                    child: Text(
                      'CHECK OUT',
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
