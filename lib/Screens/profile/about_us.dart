


import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AboutWellcarePage extends StatelessWidget {
  const AboutWellcarePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: const Text('About WELL CARE Pharmacy'),
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(FontAwesomeIcons.arrowLeft),
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Card(
            color: Colors.white,
            elevation: 3,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text(
                    "WELL CARE Pharmacies is recognized as Egypt's uncontested leading provider of health and personal care products. "
                        "A success story that began with one pharmacy established in 1975, the group is now a major corporation driving the country's healthcare sector. "
                        "With nearly 49 years of experience serving the Egyptian community, well care Pharmacies has an ambitious plan to cement its leadership across the region.",
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Dr Shorouq's vision redefined the profession of pharmacy in Egypt. "
                        "From introducing novel operational models to offering an unprecedented range of services such as home delivery, patient consultation and support, and helping raise awareness, "
                        "well care Group has transformed the landscape of health in Egypt, standing apart and ahead from day one.",
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "With the belief that success comes from the inside out, we invested in a top-notch development center that nurtures the talents of our team. "
                        "Highly qualified professionals train our pharmacists and employees to ensure seamless operation aligned with global standards. "
                        "By recruiting high-caliber team members and continuously honing and expanding their skills, our staff is recognized as a trusted source of advice and consultation.",
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "Today, WELL CARE Pharmacies spearheads the provision of quality health and personal care products via a nationwide network spanning more than 300 branches and counting, "
                        "multiple warehouses, and one baby center.",
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "At well care, we are always pleased to provide distinguished service to our valued guests, 24 hours a day, 7 days a week.",
                    style: TextStyle(fontSize: 16, height: 1.6),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}