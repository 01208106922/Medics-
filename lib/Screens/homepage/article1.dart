import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Article1 extends StatelessWidget {
  const Article1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: const Text('Boost Your Defenses'),
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
                    "Boost Your Defenses",
                    style: TextStyle(
                        fontSize: 16,
                        height: 1.6 ,
                        fontWeight:FontWeight.bold ),
                  ),
                  SizedBox(height: 12),
                  Text(
                    "A strong immune system is your body’s primary defense against viruses,"
                        " bacteria, and other pathogens. Here’s how to keep it in top shape:"
                        "NutritionColorful produce: Strive for at least five servings a day of "
                        "fruits and vegetables—think bell peppers, berries, spinach, and sweet"
                        " potatoes. These provide vitamins A, C, and E along with antioxidants "
                        "that neutralize free radicals.Lean protein: Chicken, turkey, fish, beans,"
                        " and lentils supply amino acids needed for immune cell production and repair."
                        "Healthy fats: Omega-3s in salmon, chia seeds, and walnuts help regulate"
                        " inflammation and support cell membranes.Sleep & StressQuality rest: "
                        "Aim for 7–9 hours of uninterrupted sleep. During deep sleep, your body"
                        " releases cytokines, proteins that modulate immune response.Stress management: "
                        "Chronic stress floods the body with cortisol, which can suppress white blood cell"
                        " activity. Practice daily relaxation: 5 minutes of deep-breathing, 10 minutes of "
                        "guided meditation apps, or even a short walk in nature.Movement "
                        "& Hydrationoderate exercise: 30 minutes of brisk walking, cycling,"
                        " or swimming at least five days per week boosts circulation and helps"
                        " immune cells patrol more efficiently.Stay hydrated: Water makes up over 60%"
                        " of your body and is key to lymphatic flow, which carries immune cells.Sip 8–10 cups daily,"
                        " more if you’re active or live in hot climates.Supplement WiselyIf diet alone isn’t enough, "
                        "consider a daily vitamin D supplement (especially in winter or low-sun regions) "
                        "and a quality probiotic for gut-immune support. Always check with your "
                        "healthcare provider before adding new supplements.By combining nutrient-dense meals,"
                        " adequate rest, stress reduction, and regular movement, you’ll give your body the tools "
                        "it needs to build and sustain a resilient immune defense.",

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

                  SizedBox(height: 12),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}