import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class WellcareFaqPage extends StatelessWidget {
  const WellcareFaqPage({Key? key}) : super(key: key);

  Future<void> _launchEmail() async {
    final Uri emailLaunchUri = Uri(
      scheme: 'mailto',
      path: 'WellcarePharmacy@gmail.com',
      query: 'subject=Support Request',
    );
    if (await canLaunch(emailLaunchUri.toString())) {
      await launch(emailLaunchUri.toString());
    } else {
      throw 'Could not launch $emailLaunchUri';
    }
  }

  @override
  Widget build(BuildContext context) {
    final faqItems = [
      {
        'question': 'What Is The Services Presented By WELLCARE Application?',
        'answer':
        'Wellcare application enables customers to order products online and select the suitable payment method (cash on delivery - pay by credit card online).',
      },
      {
        'question': 'Can I Make Pick Up Order From Pharmacy?',
        'answer':
        'Sure, send your order and it will be reserved for you for 24 hrs. from the selected time for pick up on application.',
      },
      {
        'question': 'How Can I Contact WELLCARE Customer Service If I Face Problem?',
        'answer':
        'We always care about providing our customers with the best services and experience. If you have any issue, you can send us an email from inside application "Help & Support" or contact us via email below.',
        'isEmail': true,
      },
      {
        'question': 'How Can I Join WELLCARE?',
        'answer':
        'You can visit our headquarter office at 6C Takseem Asmaa Fahmy, Heliopolis from Sunday to Thursday, from 9 AM to 3 PM.',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[300],
        title: const Text("WELLCARE - FAQs"),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(FontAwesomeIcons.arrowLeft),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: faqItems.length,
        itemBuilder: (context, index) {
          final item = faqItems[index];
          return ExpansionTile(
            collapsedBackgroundColor: Colors.white,
            backgroundColor: Colors.white,
            title: Text(
              item['question']?.toString() ?? 'No question available',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            trailing: Icon(
              FontAwesomeIcons.caretDown,
              color: Colors.blue,
            ),
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item['answer']?.toString() ?? 'No answer available',
                      style: const TextStyle(fontSize: 15, height: 1.5),
                    ),
                    if (item.containsKey('isEmail') && item['isEmail'] == true)
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: TextButton(
                          onPressed: _launchEmail,
                          child: const Text(
                            'WellcarePharmacy@gmail.com',
                            style: TextStyle(
                              color: Colors.blue,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}