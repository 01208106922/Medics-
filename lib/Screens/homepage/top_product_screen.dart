import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/homepage/Homepage.dart';
import 'package:medical/Screens/homepage/top_products.dart';
import 'package:medical/Screens/Widgets/doctorList.dart';
import 'package:page_transition/page_transition.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class doctor_search extends StatelessWidget {
  const doctor_search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(
                context,
                PageTransition(
                    type: PageTransitionType.fade, child: Homepage()));
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
        title: Text(
          "Top Products",
          style: GoogleFonts.poppins(color: Colors.black, fontSize: 18.sp),
        ),
        centerTitle: true,
        elevation: 0,
        toolbarHeight: 100,
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 10,
              width: 10,
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("lib/icons/more.png"),
              )),
            ),
          ),
        ],
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                    context,
                    PageTransition(
                        type: PageTransitionType.rightToLeft,
                        child: DoctorDetails()));
              },
              child: doctorList(
                  // distance: "",
                  image: "lib/icons/malinda.jpg",
                  maintext: "Malinda",
                  numRating: "4.5",
                  subtext: "Malinda cleanser Gel with salysilic acid"),
            ),
            doctorList(
                // distance: "",
                image: "lib/icons/laroch.jpeg",
                maintext: "La Roch sunscreen ",
                numRating: "4.7",
                subtext: "La Roche Dry Touch Gel Cream Spf50+"),
            doctorList(
                // distance: "",
                image: "lib/icons/cream.jpg",
                maintext: "Malinda cream",
                numRating: "4.7",
                subtext: " mostrizer for acne prone skin"),
            doctorList(
                // distance: "",
                image: "lib/icons/vacation.jpeg",
                maintext: "Vaction cleanser",
                numRating: "4.7",
                subtext: " for acne prone skin"),
            doctorList(
                // distance: "",
                image: "lib/icons/starville.jpeg",
                maintext: "Starville Roll on ",
                numRating: "4.7",
                subtext: "Roll on, protect up to 24hrs"),
            doctorList(
                // distance: "",
                image: "lib/icons/starville.jpeg",
                maintext: "Starville Roll on ",
                numRating: "4.7",
                subtext: "Roll on, protect up to 24hrs"),

          ],
        )),
      ),
    );
  }
}
