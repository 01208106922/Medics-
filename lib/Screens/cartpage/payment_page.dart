import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'completed_page.dart';
import 'package:flutter/services.dart';

class PaymentPage extends StatelessWidget {
  final TextEditingController _cardController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    double price = 125.00;
    double fees = 0.00;
    double total = price + fees;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Payment",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Stepper
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _buildStepCircle(true),
                  _buildLine(),
                  _buildStepCircle(true),
                  _buildLine(),
                  _buildStepCircle(false),
                ],
              ),
              SizedBox(height: 24),

              // Pay on Cash
              _paymentOption(FontAwesomeIcons.moneyCheck, "Pay on cash"),
              _dividerWithText("OR"),

              // PayPal
              _paymentOption(FontAwesomeIcons.wallet, "PayPal"),
              _dividerWithText("OR"),

              // Card Number Input (as password)
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Card Number",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 8),
              TextField(
                controller: _cardController,
                obscureText: true,
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
                decoration: InputDecoration(
                  hintText: "Enter card number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  prefixIcon: Icon(FontAwesomeIcons.creditCard),
                ),
              ),
              SizedBox(height: 24),

              // Price Details
              _priceRow("Price", "\$${price.toStringAsFixed(2)}"),
              _priceRow("Fees", "\$${fees.toStringAsFixed(2)}"),
              Divider(),
              _priceRow("Total Price", "\$${total.toStringAsFixed(2)}",
                  isBold: true),
              SizedBox(height: 24),

              // Confirm Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => CompletedPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  padding: EdgeInsets.symmetric(vertical: 14, horizontal: 50),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                child: Text(
                  "Confirm And Track Order",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _paymentOption(IconData icon, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey.shade300),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, color: Colors.black54),
          SizedBox(width: 8),
          Text(title,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _dividerWithText(String text) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 12),
      child: Row(
        children: [
          Expanded(child: Divider()),
          SizedBox(width: 8),
          Text(text, style: TextStyle(color: Colors.grey)),
          SizedBox(width: 8),
          Expanded(child: Divider()),
        ],
      ),
    );
  }

  Widget _priceRow(String label, String amount, {bool isBold = false}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
          Text(amount,
              style: TextStyle(
                  fontWeight: isBold ? FontWeight.bold : FontWeight.normal)),
        ],
      ),
    );
  }

  Widget _buildStepCircle(bool isActive) {
    return CircleAvatar(
      radius: 10,
      backgroundColor: isActive ? Colors.blue : Colors.grey[300],
    );
  }

  Widget _buildLine() {
    return Container(
      width: 30,
      height: 2,
      color: Colors.blue,
    );
  }
}