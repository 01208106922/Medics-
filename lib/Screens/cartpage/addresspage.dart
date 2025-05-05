import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'payment_page.dart';

class AddressPage extends StatefulWidget {
  final double price;


  AddressPage({required this.price});

  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String? selectedCity;
  TextEditingController streetController = TextEditingController();
  List<String> cities = ['Cairo', 'Alexandria', 'Giza', 'Bani Suef'];

  bool get isFormValid =>
      selectedCity != null && streetController.text.trim().isNotEmpty;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        toolbarHeight: 150,
      ),
      body: Column(
        children: [
          _buildProgressDots(),
          SizedBox(height: 10),
          Text(
            "Address",
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 40),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: DropdownButton<String>(
                        value: selectedCity,
                        hint: Row(
                          children: [
                            SizedBox(width: 8),
                            Text("Select City"),
                            Spacer(),
                            Icon(FontAwesomeIcons.chevronDown, size: 16, color: Colors.grey[600]),

                          ],
                        ),
                        onChanged: (newValue) {
                          setState(() {
                            selectedCity = newValue;
                          });
                        },
                        dropdownColor: Colors.white,
                        isExpanded: true,
                        underline: SizedBox(),
                        items: cities.map((String city) {
                          return DropdownMenuItem<String>(
                            value: city,
                            child: Text(city),
                          );
                        }).toList(),
                      ),

                    ),
                    SizedBox(height: 20),
                    TextField(
                      controller: streetController,
                      decoration: InputDecoration(
                        hintText: "Enter Street",
                        filled: true,
                        fillColor: Colors.grey.shade100,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                      onChanged: (_) {
                        setState(() {});
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: isFormValid
                        ? () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PaymentPage(
                            total: widget.price,
                          ),
                        ),
                      );
                    }
                        : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700],
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Next"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProgressDots() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildDot(Colors.blue),
        _buildLine(),
        _buildDot(Colors.grey.shade300),
        _buildLine(),
        _buildDot(Colors.grey.shade300),
      ],
    );
  }

  Widget _buildDot(Color color) {
    return Container(
      width: 16,
      height: 16,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }

  Widget _buildLine() {
    return Container(
      width: 30,
      height: 2,
      color: Colors.grey.shade300,
    );
  }
}