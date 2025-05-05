import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'article1.dart';

class article1 extends StatelessWidget {
  final String mainText;
  final String dateText;
  final String duration;
  final String image;

  article1({
    required this.mainText,
    required this.dateText,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Article1()),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.8500,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 231, 231, 231)),
          ),
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.1200,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.5,
              child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  mainText,
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        dateText,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        duration,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 136, 102),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.09,
              child: Image.asset(
                "lib/icons/Bookmark.png",
                filterQuality: FilterQuality.high,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
class article2 extends StatelessWidget {
  final String mainText;
  final String dateText;
  final String duration;
  final String image;

  article2({
    required this.mainText,
    required this.dateText,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Article1()),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.8500,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 231, 231, 231)),
          ),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.1200,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.5,
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  mainText,
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        dateText,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        duration,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 136, 102),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.09,
              child: Image.asset(
                "lib/icons/Bookmark.png",
                filterQuality: FilterQuality.high,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
class article3 extends StatelessWidget {
  final String mainText;
  final String dateText;
  final String duration;
  final String image;

  article3({
    required this.mainText,
    required this.dateText,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Article1()),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.8500,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 231, 231, 231)),
          ),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.1200,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.5,
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  mainText,
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        dateText,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        duration,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 136, 102),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.09,
              child: Image.asset(
                "lib/icons/Bookmark.png",
                filterQuality: FilterQuality.high,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
class article4 extends StatelessWidget {
  final String mainText;
  final String dateText;
  final String duration;
  final String image;

  article4({
    required this.mainText,
    required this.dateText,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Article1()),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.8500,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 231, 231, 231)),
          ),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.1200,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.5,
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  mainText,
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        dateText,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        duration,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 136, 102),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.09,
              child: Image.asset(
                "lib/icons/Bookmark.png",
                filterQuality: FilterQuality.high,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
class article5 extends StatelessWidget {
  final String mainText;
  final String dateText;
  final String duration;
  final String image;

  article5({
    required this.mainText,
    required this.dateText,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Article1()),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.8500,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 231, 231, 231)),
          ),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.1200,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.5,
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  mainText,
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        dateText,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        duration,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 136, 102),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.09,
              child: Image.asset(
                "lib/icons/Bookmark.png",
                filterQuality: FilterQuality.high,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
class article6 extends StatelessWidget {
  final String mainText;
  final String dateText;
  final String duration;
  final String image;

  article6({
    required this.mainText,
    required this.dateText,
    required this.duration,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: InkWell(
        onTap: (){
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const Article1()),
          );
        },
        child: Container(
          height: MediaQuery.of(context).size.height * 0.08,
          width: MediaQuery.of(context).size.width * 0.8500,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: const Color.fromARGB(255, 231, 231, 231)),
          ),
          child:
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            const SizedBox(
              width: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.5,
              width: MediaQuery.of(context).size.width * 0.1200,
              child: Image.asset(image),
            ),
            const SizedBox(
              width: 15,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.05,
              width: MediaQuery.of(context).size.width * 0.5,
              child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  mainText,
                  style: GoogleFonts.poppins(
                      fontSize: 13.sp, fontWeight: FontWeight.w700),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Text(
                        dateText,
                        style: GoogleFonts.poppins(
                            fontSize: 12.sp, fontWeight: FontWeight.w300),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        duration,
                        style: GoogleFonts.poppins(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w500,
                          color: Color.fromARGB(255, 0, 136, 102),
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
            const SizedBox(
              width: 25,
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.07,
              width: MediaQuery.of(context).size.width * 0.09,
              child: Image.asset(
                "lib/icons/Bookmark.png",
                filterQuality: FilterQuality.high,
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
