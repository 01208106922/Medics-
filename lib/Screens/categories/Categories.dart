import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/homepage/Homepage.dart';
import 'package:medical/Screens/categories/products.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class message_tab_all extends StatefulWidget {
  const message_tab_all({Key? key}) : super(key: key);

  @override
  _TabBarExampleState createState() => _TabBarExampleState();
}

class _TabBarExampleState extends State<message_tab_all>
    with SingleTickerProviderStateMixin {
  late TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: IconButton(onPressed:  () {
        Navigator.push(
        context,
        PageTransition(
        type: PageTransitionType.fade, child: Homepage()));
        }, icon: Icon(FontAwesomeIcons.arrowLeft)),
          title: Text(
            "Categories",
            style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
          ),
          centerTitle: false,
          elevation: 0,
          toolbarHeight: 100,
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                height: 20,
                width: 20,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("lib/icons/bell.png"),
                    )),
              ),
            ),
          ],
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child:  Column(
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: chat_screen(
                            title: "Mom & Baby",
                            color: Color(0xff2879FF),
                          ),
                        ),
                      );
                    },

                    child: Container(
                      margin: EdgeInsets. symmetric(horizontal: 20,vertical:10 ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration:BoxDecoration(
                          color: Color(0xff2879FF),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text("Mom & Baby",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: chat_screen(
                            title: "Fighting the infection",
                            color: Color(0xff3CB5B7),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets. symmetric(horizontal: 20,vertical:10 ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration:BoxDecoration(
                          color: Color(0xff3CB5B7),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text("Fighting the infection",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: chat_screen(
                            title: "Diabetes",
                            color: Color(0xffF6529F),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets. symmetric(horizontal: 20,vertical:10 ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration:BoxDecoration(
                          color: Color(0xffF6529F),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text("Diabetes",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: chat_screen(
                            title: "Antibiotics",
                            color: Color(0xffFF6563),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets. symmetric(horizontal: 20,vertical:10 ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration:BoxDecoration(
                          color: Color(0xffFF6563),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text("Antibiotics",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: chat_screen(
                            title: "Drugs",
                            color: Color(0xffFF9253),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets. symmetric(horizontal: 20,vertical:10 ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration:BoxDecoration(
                          color: Color(0xffFF9253),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text("Drugs",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: chat_screen(
                            title: "Women",
                            color: Color(0xff7879F1),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets. symmetric(horizontal: 20,vertical:10 ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration:BoxDecoration(
                          color: Color(0xff7879F1),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text("Women",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),

                ],
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: chat_screen(
                            title: "Cosmetic",
                            color: Color(0xff2879FF),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets. symmetric(horizontal: 20,vertical:10 ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration:BoxDecoration(
                          color: Color(0xff2879FF),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text("Cosmetic ",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.bottomToTop,
                          child: chat_screen(
                            title: "Men",
                            color: Color(0xffFFB200),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets. symmetric(horizontal: 20,vertical:10 ),
                      alignment: Alignment.center,
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width * 0.4,
                      decoration:BoxDecoration(
                          color: Color(0xffFFB200),
                          borderRadius: BorderRadius.circular(8)
                      ),
                      child: Text("Men",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),

                ],
              ),

            ],
          ),
        )
    );

  }
}