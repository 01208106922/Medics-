import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'payment_page.dart';

class AddressPage extends StatefulWidget {
  @override
  _AddressPageState createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  String? mainAddress;
  List<String> additionalAddresses = [];

  // Controllers for the address text fields
  TextEditingController mainController = TextEditingController();
  TextEditingController additionalController = TextEditingController();

  void _showAddAddressDialog() {
    TextEditingController mainController = TextEditingController();
    TextEditingController cityController = TextEditingController();
    TextEditingController governorateController = TextEditingController();

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: Text("Add New Address"),
        content: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: mainController,
                decoration: InputDecoration(hintText: "Street Name"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: cityController,
                decoration: InputDecoration(hintText: "City"),
              ),
              SizedBox(height: 10),
              TextField(
                controller: governorateController,
                decoration: InputDecoration(hintText: "Governorate"),
              ),
            ],
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              if (mainController.text.isNotEmpty &&
                  cityController.text.isNotEmpty &&
                  governorateController.text.isNotEmpty) {
                String fullAddress =
                    "${mainController.text}, ${cityController.text}, ${governorateController.text}";
                setState(() {
                  if (mainAddress == null) {
                    mainAddress = fullAddress;
                  } else {
                    additionalAddresses.add(fullAddress);
                  }
                });
                Navigator.pop(context);
              }
            },
            child: Text("Add"),
          )
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(FontAwesomeIcons.arrowLeft, color: Colors.black,),
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
              child: Column(
                children: [
                  // حقول إدخال العنوان تحت بعض
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        // الحقل الأول (Main Address)
                        TextField(
                          controller: mainController,
                          decoration: InputDecoration(
                            hintText: " Add Main Address",
                            filled: true,
                            fillColor: Colors.grey.shade200, // اللون الرصاصي الفاتح
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                        SizedBox(height: 40),
                        // الحقل الثاني (Additional Address)
                        TextField(
                          controller: additionalController,
                          decoration: InputDecoration(
                            hintText: "Add Additional Address",
                            filled: true,
                            fillColor: Colors.grey.shade200, // اللون الرصاصي الفاتح
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  if (mainAddress != null) ...[
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Main address",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 4),
                          Text(
                            mainAddress!,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                  ...additionalAddresses.map(
                        (address) => Container(
                      margin:
                      EdgeInsets.symmetric(horizontal: 20, vertical: 6),
                      padding: EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Additional address",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 14)),
                          SizedBox(height: 4),
                          Text(
                            address,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _showAddAddressDialog,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[700],
                      foregroundColor: Colors.white,
                      side: BorderSide(color: Colors.amber),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 14),
                    ),
                    child: Text("Add Address"),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => PaymentPage()),
                      );
                    },
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
}