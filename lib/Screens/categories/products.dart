import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/homepage/Homepage.dart';
import 'package:medical/Screens/categories/product_details.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'Categories.dart';

class chat_screen extends StatefulWidget {
  final String title;
  final Color color;



  chat_screen({super.key, required this.title, required this.color});

  @override
  State<chat_screen> createState() => _chat_screenState();
}

class _chat_screenState extends State<chat_screen> {
  Map<String, dynamic> product = {
    'isFavorite': false,
  };


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          // Leading icon for navigation
          leading: GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  PageTransition(
                      type: PageTransitionType.fade, child: message_tab_all()));
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
            "Products",
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
          child: Stack(
              alignment: Alignment.bottomCenter, children: [
            Padding(
                padding: const EdgeInsets.all(18),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        width: double.infinity,
                        height: 64,
                        color: widget.color,
                        child: Text(
                          widget.title,
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade, child: ProductDetails(
                                        image:"images/malinda.jpg",
                                      )));
                                },
                                child:  Container(
                                  padding: const EdgeInsets.all(5),
                                  alignment: Alignment.topLeft,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: const Color(0xff465C67)),
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Image.asset(
                                        "images/malinda.jpg",
                                        width: 139,
                                        height: 80,
                                        fit: BoxFit.cover,
                                      ),
                                      const SizedBox(height: 5),
                                      const Text(
                                        "52\$",
                                        style: TextStyle(
                                          color: Color(0xff2879FF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      const Text(
                                        "Malinda",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      const Text(
                                        "68 in stock",
                                        style: TextStyle(color: Color(0xff465C67)),
                                      ),
                                      SizedBox(height: 3,),
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                          onTap: () {
                                            setState(() {
                                              product['isFavorite'] = !product['isFavorite'];
                                            });
                                          },
                                          child: Icon(
                                            product['isFavorite']
                                                ? FontAwesomeIcons.solidHeart
                                                : FontAwesomeIcons.heart,
                                            color: product['isFavorite'] ? Colors.red : Colors.grey,
                                          )
                                        ),
                                      ),
                                    ],
                                  ),
                                )
                              ),
                              SizedBox(width: 30,),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade, child: ProductDetails(
                                        image: "lib/icons/laroch.jpeg",
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.topLeft,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff465C67)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.heart_broken_sharp)),
                                          Image.asset(
                                            "lib/icons/laroch.jpeg",
                                            width: 139,
                                            height: 80,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "52\$",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Color(0xff2879FF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "La Roch",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "68 in stock",
                                        style: TextStyle(color: Color(0xff465C67)),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                product['isFavorite'] = !product['isFavorite'];
                                              });
                                            },
                                            child: Icon(
                                              product['isFavorite']
                                                  ? FontAwesomeIcons.solidHeart
                                                  : FontAwesomeIcons.heart,
                                              color: product['isFavorite'] ? Colors.red : Colors.grey,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade, child: ProductDetails(
                                        image:  "lib/icons/starville.jpeg",
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.topLeft,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff465C67)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.heart_broken_sharp)),
                                          Image.asset(
                                            "lib/icons/starville.jpeg",
                                            width: 139,
                                            height: 80,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "52\$",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Color(0xff2879FF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Roll on",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "68 in stock",
                                        style: TextStyle(color: Color(0xff465C67)),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                product['isFavorite'] = !product['isFavorite'];
                                              });
                                            },
                                            child: Icon(
                                              product['isFavorite']
                                                  ? FontAwesomeIcons.solidHeart
                                                  : FontAwesomeIcons.heart,
                                              color: product['isFavorite'] ? Colors.red : Colors.grey,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 30,),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade, child: ProductDetails(
                                        image: "lib/icons/cream.jpg" ,
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.topLeft,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff465C67)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.heart_broken_sharp)),
                                          Image.asset(
                                            "lib/icons/cream.jpg",
                                            width: 139,
                                            height: 80,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "52\$",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Color(0xff2879FF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "malinda cream",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "68 in stock",
                                        style: TextStyle(color: Color(0xff465C67)),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                product['isFavorite'] = !product['isFavorite'];
                                              });
                                            },
                                            child: Icon(
                                              product['isFavorite']
                                                  ? FontAwesomeIcons.solidHeart
                                                  : FontAwesomeIcons.heart,
                                              color: product['isFavorite'] ? Colors.red : Colors.grey,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 15,),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade, child: ProductDetails(
                                        image:  "images/malinda.jpg",
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.topLeft,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff465C67)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.heart_broken_sharp)),
                                          Image.asset(
                                            "images/malinda.jpg",
                                            width: 139,
                                            height: 80,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "52\$",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Color(0xff2879FF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Malinda",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "68 in stock",
                                        style: TextStyle(color: Color(0xff465C67)),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                product['isFavorite'] = !product['isFavorite'];
                                              });
                                            },
                                            child: Icon(
                                              product['isFavorite']
                                                  ? FontAwesomeIcons.solidHeart
                                                  : FontAwesomeIcons.heart,
                                              color: product['isFavorite'] ? Colors.red : Colors.grey,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(width: 30,),
                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      PageTransition(
                                          type: PageTransitionType.fade, child: ProductDetails(
                                        image: "lib/icons/laroch.jpeg",
                                      )));
                                },
                                child: Container(
                                  padding: EdgeInsets.all(5),
                                  alignment: Alignment.topLeft,
                                  height: MediaQuery.of(context).size.height * 0.3,
                                  width: MediaQuery.of(context).size.width * 0.4,
                                  decoration: BoxDecoration(
                                      border: Border.all(color: Color(0xff465C67)),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Stack(
                                        children: [
                                          IconButton(
                                              onPressed: () {},
                                              icon: Icon(Icons.heart_broken_sharp)),
                                          Image.asset(
                                            "lib/icons/laroch.jpeg",
                                            width: 139,
                                            height: 80,
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        "52\$",
                                        textAlign: TextAlign.start,
                                        style: TextStyle(
                                          color: Color(0xff2879FF),
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        "Evy Baby",
                                        style: TextStyle(fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                        "68 in stock",
                                        style: TextStyle(color: Color(0xff465C67)),
                                      ),
                                      Container(
                                        alignment: Alignment.topRight,
                                        child: GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                product['isFavorite'] = !product['isFavorite'];
                                              });
                                            },
                                            child: Icon(
                                              product['isFavorite']
                                                  ? FontAwesomeIcons.solidHeart
                                                  : FontAwesomeIcons.heart,
                                              color: product['isFavorite'] ? Colors.red : Colors.grey,
                                            )
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                            ],
                          ),
                          SizedBox(height: 15,),
                        ],
                      ),
                    ]))
          ]),
        ));
  }
}