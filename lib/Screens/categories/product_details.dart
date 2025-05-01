import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/categories/products.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProductDetails extends StatefulWidget {
  final String image;

  ProductDetails({super.key,required this.image});
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
        // Leading icon for navigation
        leading: GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: chat_screen(title: "", color: Color(0XFFFFFFFF))));
          },
          child: Container(
            height: 10,
            width: 10,
            decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("lib/icons/back1.png"),
                )),
          ),
        ),
        // Title of the chat screen
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    widget.image,
                    width: 255,
                    height: 255,
                  ),
                  Text(
                    "Malinda cleanser Gel",
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  SizedBox(height: 4,),
                  Text(
                    "Deeply and gently cleanses the skin, purifies it from impurities, dirt, and dead skin cells. Removes makeup residues and waterproof products like sunscreen. Prevents the formation of whiteheads and blackheads. Prevents clogged pores, thereby reducing the appearance of acne.",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                        color: Color(0xff000000),
                        fontSize: 16,
                        fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            if (num >1 )
                            {num--;
                            price= price-100;
                            };
                          });
                        },
                        icon: Icon(FontAwesomeIcons.minus),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        "$num",
                        style: TextStyle(
                            color: Color(0xff465C67),
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      IconButton(
                        onPressed: () {
                          setState(() {
                            num++;
                            price= num*100;
                          });
                        },
                        icon: Icon(FontAwesomeIcons.plus),
                      ),
                      Spacer(),
                      Text(
                        "$price",
                        style:
                        TextStyle(fontWeight: FontWeight.w800, fontSize: 24),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  SizedBox(height: 24,),
                  InkWell(
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Product added to cart successfully!',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          backgroundColor: Colors.green,
                          duration: Duration(seconds: 2),
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
                          color: Color(0xffF9D03F),
                          borderRadius: BorderRadius.circular(12)
                      ),
                      child: Text("Add to cart",
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w800
                        ),),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}