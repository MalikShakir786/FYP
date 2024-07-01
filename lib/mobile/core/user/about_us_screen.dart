import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';

import '../../../global/global_widgets/fyp_navbar.dart';
import '../../../global/global_widgets/fyp_text.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FypNavBar(title: "About Us"),
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    FypText(
                      text: "Welcome to UniBus Finder!",
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    SizedBox(height: 10),
                    FypText(
                      text:
                      "At UniBus Finder, we are dedicated to making your daily commute to and from the University of Gujrat seamless and hassle-free. Our app is specifically designed to help students, faculty, and staff efficiently locate and track university buses in real-time.",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    FypText(
                      text: "Our Mission",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    SizedBox(height: 10),
                    FypText(
                      text:
                      "Our mission is to enhance the campus transportation experience by providing a reliable and user-friendly platform that allows you to:",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 10),
                    FypText(
                      text: "• Find Your Bus: Quickly search for your bus routes and stops.\n• Stay Updated: Receive real-time updates on bus schedules and delays.\n• Plan Ahead: Access comprehensive timetable information to plan your journey effectively.",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    FypText(
                      text: "Key Features",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    SizedBox(height: 10),
                    FypText(
                      text:
                      "• Real-Time Bus Tracking: See the exact location of your bus and estimated arrival times.\n• Route Information: Get detailed information on all bus routes servicing the University of Gujrat.\n• Timetable: View the full timetable to plan your trips in advance.\n• Notifications: Stay informed with notifications about schedule changes, delays, and important updates.\n• User-Friendly Interface: Navigate through the app with ease, thanks to our intuitive design.",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    FypText(
                      text: "Our Team",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    SizedBox(height: 10),
                    FypText(
                      text:
                      "We are a passionate team of developers, designers, and transport enthusiasts committed to improving your commuting experience. Our goal is to leverage technology to provide a smarter and more efficient way to travel.",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    FypText(
                      text: "Why Choose UniBus Finder?",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    SizedBox(height: 10),
                    FypText(
                      text:
                      "• Convenience: No more waiting at the bus stop unsure when your bus will arrive.\n• Efficiency: Save time by knowing the best bus to catch and when.\n• Reliability: Trust in accurate and up-to-date bus information.\n• Support: We are here to help! Reach out to us for any support or feedback.",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    FypText(
                      text: "Contact Us",
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                    SizedBox(height: 10),
                    FypText(
                      text:
                      "We love to hear from our users! If you have any questions, suggestions, or need assistance, please do not hesitate to contact us at:",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 10),
                    FypText(
                      text: "• Email: support@unibusfinder.com\n• Phone: +92 123 456 7890",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    FypText(
                      text: "Follow us on social media for the latest updates:",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 10),
                    FypText(
                      text: "• Facebook: facebook.com/unibusfinder\n• Twitter: twitter.com/unibusfinder\n• Instagram: instagram.com/unibusfinder",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                    SizedBox(height: 20),
                    FypText(
                      text:
                      "Thank you for choosing UniBus Finder. We are here to make your university bus travel easier and more convenient. Happy commuting!",
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
