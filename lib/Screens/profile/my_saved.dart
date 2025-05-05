import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class MySaved extends StatefulWidget {
  const MySaved({super.key});

  @override
  State<MySaved> createState() => _MySavedState();
}

class _MySavedState extends State<MySaved> {
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
            .toList();
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Saved Products"),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(FontAwesomeIcons.arrowLeft),
        ),
      ),
      body: savedItems.isEmpty
          ? const Center(child: Text("No saved products yet."))
          : Padding(
        padding: const EdgeInsets.all(18),
        child: Wrap(
          spacing: 10,
          runSpacing: 10,
          children: List.generate(savedItems.length, (index) {
            final product = savedItems[index];
            return Container(
              padding: const EdgeInsets.all(5),
              alignment: Alignment.topLeft,
              height: MediaQuery.of(context).size.height * 0.3,
              width: MediaQuery.of(context).size.width * 0.42,
              decoration: BoxDecoration(
                border: Border.all(color: const Color(0xff465C67)),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    "${product['image'] ?? null} ",
                    width: 139,
                    height: 80,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.broken_image, size: 80);
                    },
                  ),
                  const SizedBox(height: 5),
                  Text(
                    "${product['price'] ?? 0} \$",
                    style: const TextStyle(
                      color: Color(0xff2879FF),
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  Text(
                    product['name']?.toString().trim() ?? 'No Name',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    "Qty: ${product['stock'] ?? 0}",
                    style: const TextStyle(color: Color(0xff465C67)),
                  ),
                  const SizedBox(height: 3),
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => _removeItem(index),
                      child: const Icon(
                        FontAwesomeIcons.trash,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
