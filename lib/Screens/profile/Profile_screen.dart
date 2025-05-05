import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medical/Screens/Login-Signup/login.dart';
import 'package:medical/Screens/profile/about_us.dart' show AboutWellcarePage;
import 'package:medical/Screens/profile/faqs.dart' show WellcareFaqPage;
import 'package:medical/Screens/profile/help_and_support.dart';
import 'package:medical/Screens/profile/my_saved.dart' show MySaved;
import 'package:medical/Screens/profile/profile_list.dart';
import 'package:medical/providers/user_provider.dart' show UserProvider;
import 'package:page_transition/page_transition.dart' show PageTransition, PageTransitionType;
import 'package:provider/provider.dart' show Provider;
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends StatefulWidget {
  ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  int selectedIndex = -1;

  Color color = Colors.red;

  @override
  Widget build(BuildContext context) {
    var userProvider = Provider.of<UserProvider>(context);

    return Scaffold(
      backgroundColor: Color.fromRGBO(121, 171, 243, 1),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 50),
            Center(
              child: Stack(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    width: 110,
                    height: 110,
                    decoration: BoxDecoration(
                      border: Border.all(width: 4, color: Colors.white),
                      boxShadow: [
                        BoxShadow(
                          spreadRadius: 2,
                          blurRadius: 10,
                          color: Colors.black.withOpacity(0.1),
                        ),
                      ],
                      shape: BoxShape.circle,
                      image: const DecorationImage(
                        image: AssetImage("images/avatar1.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      height: 30,
                      width: 30,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.white),
                        color: Colors.white,
                        image: const DecorationImage(
                          image: AssetImage("lib/icons/camra.png"),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  userProvider.userModel != null
                      ? userProvider.userModel!.name
                      : " loading ...",
                  style: GoogleFonts.poppins(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                )
              ],
            ),
            const SizedBox(height: 30),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildInfoItem(context, "lib/icons/callories.png", "Calories"),
                  _verticalDivider(),
                  _buildInfoItem(context, "lib/icons/weight.png", "Weight"),
                  _verticalDivider(),
                  _buildInfoItem(context, "lib/icons/heart.png", "Heart rate"),
                ],
              ),
            ),
            const SizedBox(height: 50),
            Container(
              height: 550,
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  _buildProfileItem(0, "lib/icons/heart2.png", "My Saved", MySaved()),
                  _divider(),
                  _buildProfileItem(1, "lib/icons/appoint.png", "About Us", AboutWellcarePage()),
                  _divider(),
                  _buildProfileItem(2, "lib/icons/chat.png", "FAQs", WellcareFaqPage()),
                  _divider(),
                  _buildProfileItem(4, "lib/icons/logout.png", "Log out", login()),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoItem(BuildContext context, String imagePath, String title) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.09,
      width: MediaQuery.of(context).size.width * 0.25,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.04,
            width: MediaQuery.of(context).size.width * 0.15,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imagePath),
                filterQuality: FilterQuality.high,
              ),
            ),
          ),
          Text(
            title,
            style: GoogleFonts.poppins(
              fontSize: 13.sp,
              fontWeight: FontWeight.w600,
              color: Color.fromARGB(255, 245, 243, 243),
            ),
          ),
          const SizedBox(height: 5),
        ],
      ),
    );
  }

  Widget _divider() {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Divider(),
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 50,
      width: 1,
      color: Colors.white,
    );
  }

  Widget _buildProfileItem(int index, String image, String title, Widget page) {
    bool isSelected = selectedIndex == index;

    return InkWell(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
        Navigator.push(
          context,
          PageTransition(
            type: PageTransitionType.rightToLeft,
            child: page,
          ),
        );
      },
      child: profile_list(
        image: image,
        title: title,
        color: isSelected ? Colors.red : Colors.black87,
      ),
    );
  }
}

