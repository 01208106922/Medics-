import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'addresspage.dart';
// import 'address_page.dart';

class PharmacyPage extends StatefulWidget {
  @override
  _PharmacyPageState createState() => _PharmacyPageState();
}

class _PharmacyPageState extends State<PharmacyPage> {
  List<Map<String, dynamic>> products = [
    {
      'name': 'Malinda Gel',
      'price': 225.0,
      'image': 'images/malinda.jpg',
      'quantity': 1,
      'isFavorite': false,
    },
    {
      'name': 'Malinda Moisturizer',
      'price': 225.0,
      'image': 'images/malinda.jpg',
      'quantity': 1,
      'isFavorite': false,
    },
    {
      'name': 'Lorem',
      'price': 225.0,
      'image': 'images/malinda.jpg',
      'quantity': 1,
      'isFavorite': false,
    },
  ];

  double getTotal() {
    return products.fold(
      0,
          (sum, item) => sum + (item['price'] * item['quantity']),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Icon(FontAwesomeIcons.arrowLeft, color: Colors.black54),
                  Icon(FontAwesomeIcons.bell , color: Colors.black54),
                ],
              ),
            ),

            // Product List
            Expanded(
              child: ListView(
                children:
                products.map((product) => productCard(product)).toList(),
              ),
            ),

            // Total & Checkout Button
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
                      Text("\$${getTotal().toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => AddressPage()),
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

  Widget productCard(Map<String, dynamic> product) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Image.asset(product['image'], height: 100, width: 100),
          SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product['name'],
                    style: TextStyle(fontWeight: FontWeight.bold)),
                SizedBox(height: 4),
                Text("\$${product['price']}"),
                SizedBox(height: 4),
                Text("Size: US 7", style: TextStyle(color: Colors.grey)),
              ],
            ),
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    product['isFavorite'] = !product['isFavorite'];
                  });
                },
                child: Icon(
                  product['isFavorite']
                      ? FontAwesomeIcons.heart
                      : FontAwesomeIcons.heart,
                  color: product['isFavorite'] ? Colors.red : Colors.grey,
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  IconButton(
                    icon: Icon(FontAwesomeIcons.plus ,size: 12,),
                    onPressed: () {
                      setState(() {
                        if (product['quantity'] > 0) {
                          product['quantity'] += 1;
                        }
                      });
                    },
                  ),
                  Text("${product['quantity']}"),
                  IconButton(
                    icon: Icon(FontAwesomeIcons.minus , size:12 ),
                    onPressed: () {
                      setState(() {
                        product['quantity'] -= 1;
                      });
                    },
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}