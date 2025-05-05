import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:medical/Screens/categories/products.dart';

class ProductDetails extends StatefulWidget {
  final String image;
  final String name;
  final String description;
  final String stock;

  const ProductDetails({
    super.key,
    required this.image,
    required this.name,
    required this.description,
    required this.stock,
  });

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  double num = 1;
  double price = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade,
                    child: Products(title: "", color: const Color(0XFFFFFFFF))));
          },
          child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("lib/icons/back1.png"),
              ),
            ),
          ),
        ),
        title: Text(
          "Product Details",
          style: GoogleFonts.poppins(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 17.sp),
        ),
        centerTitle: false,
        elevation: 0,
        toolbarHeight: 100,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Image.network(
                    widget.image,
                    width: 255,
                    height: 255,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) =>
                    const Icon(FontAwesomeIcons.image),
                  ),
                  Text(
                    widget.name,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.description,
                    textAlign: TextAlign.start,
                    style: const TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (num > 1) {
                              num--;
                              price = price - 100;
                            }
                          });
                        },
                        icon: const Icon(FontAwesomeIcons.minus),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        "$num",
                        style: const TextStyle(
                            color: Color(0xff465C67),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(width: 12),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            num++;
                            price = num * 100;
                          });
                        },
                        icon: const Icon(FontAwesomeIcons.plus),
                      ),
                      const Spacer(),
                      Text(
                        "$price EGP",
                        style: const TextStyle(
                            fontWeight: FontWeight.w800, fontSize: 24),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  InkWell(
                    onTap: () async {
                      SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                      List<String>? existingList =
                      prefs.getStringList('saved_products');

                      Map<String, dynamic> product = {
                        "name": widget.name,
                        "image": widget.image,
                        "price": price,
                      };

                      List<String> updatedList = existingList ?? [];
                      updatedList.add(json.encode(product));

                      await prefs.setStringList('saved_products', updatedList);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: const Text(
                            'Product added to cart successfully!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.green,
                          duration: const Duration(seconds: 2),
                          behavior: SnackBarBehavior.floating,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xffF9D03F),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: const Text(
                        "Add to cart",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w800),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
