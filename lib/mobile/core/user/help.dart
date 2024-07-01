import 'package:flutter/material.dart';
import 'package:fyp/mobile/core/user/users_widgets/custom_expansion_tile.dart';
import '../../../global/global_widgets/fyp_navbar.dart';

class Help extends StatefulWidget {
  const Help({super.key});

  @override
  State<Help> createState() => _HelpState();
}

class _HelpState extends State<Help> {
  int? expandedIndex; // Track the currently expanded tile index

  void _handleExpansion(int index) {
    setState(() {
      if (expandedIndex == index) {
        expandedIndex = null;
      } else {
        expandedIndex = index;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final questionsAndAnswers = [
      {
        "question": "What are the operating hours of the university buses?",
        "answer": "The university buses operate from 7:00 AM to 9:00 PM on weekdays and from 8:00 AM to 6:00 PM on weekends."
      },
      {
        "question": "How can I find the bus schedule?",
        "answer": "You can find the bus schedule on the university's transport office website or the university mobile app under the 'Transport' section."
      },
      {
        "question": "What should I do if I lost something on the bus?",
        "answer": "If you lost something on the bus, please contact the transport office at 123-456-7890 or visit us at Room 101 in the Administration Building."
      },
      {
        "question": "Are there any specific rules for riding the university buses?",
        "answer": "Yes, students must carry their university ID cards, maintain decorum, and follow the instructions of the bus staff at all times."
      },
      {
        "question": "Can I bring my bicycle on the bus?",
        "answer": "Bicycles are not allowed on the bus. However, you can park them at designated bicycle racks on campus."
      },
      {
        "question": "How can I report a problem with the bus service?",
        "answer": "You can report any issues or concerns regarding the bus service by emailing transport@university.edu or calling 123-456-7890."
      },
      {
        "question": "What do I do if the bus is late?",
        "answer": "If the bus is late, please wait at the designated bus stop. You can check real-time bus updates on the university mobile app."
      },
      {
        "question": "Are there any fees for using the university bus service?",
        "answer": "The university bus service is free for all students and staff members with a valid university ID card."
      },
      {
        "question": "Can visitors use the university bus service?",
        "answer": "Visitors are not allowed to use the university bus service. It is exclusively for students and staff members."
      },
      {
        "question": "How can I give feedback about the bus service?",
        "answer": "You can provide feedback by filling out the feedback form available on the university's transport office website or by emailing transport@university.edu."
      }
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            FypNavBar(title: "Help"),
            Expanded(
              child: ListView.builder(
                itemCount: questionsAndAnswers.length,
                itemBuilder: (context, index) {
                  return CustomExpansionTile(
                    index: index,
                    question: questionsAndAnswers[index]["question"]!,
                    answer: questionsAndAnswers[index]["answer"]!,
                    isExpanded: expandedIndex == index,
                    onExpansionChanged: _handleExpansion,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}