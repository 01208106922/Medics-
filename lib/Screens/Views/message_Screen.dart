import 'package:flutter/material.dart';

class AddressPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // Top Bar
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(Icons.arrow_back, color: Colors.black),
                  ),
                  SizedBox(width: 12),
                  Text("Address", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Address Cards
            addressCard("Ahmed Emad", "44 Elmessaha Street Dokki", "Giza, Egypt", true),
            addressCard("Ahmed Emad", "4 Nasr Road cross Makram Ebeid", "Cairo, Egypt", false),
            addressCard("Ahmed Emad", "101 Kasr El Ainy Street", "Giza, Egypt", false),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                foregroundColor: Colors.black,
                side: BorderSide(color: Colors.black),
              ),
              child: Text("Add New Address"),
            ),
            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
              ),
              child: Text("Next"),
            ),
          ],
        ),
      ),
    );
  }

  Widget addressCard(String name, String address, String location, bool selected) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: selected ? Colors.blue : Colors.grey[200],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(name, style: TextStyle(color: selected ? Colors.white : Colors.black)),
              SizedBox(height: 4),
              Text(address, style: TextStyle(color: selected ? Colors.white : Colors.black)),
            ],
          ),
          Text(location, style: TextStyle(color: selected ? Colors.white : Colors.black)),
        ],
      ),
    );
  }
}