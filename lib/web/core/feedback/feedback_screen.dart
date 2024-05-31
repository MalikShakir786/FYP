import 'package:flutter/material.dart';
import '../../../mobile/global_widgets/fyp_text.dart';
import '../../../utils/constants.dart';
import '../../global_widgets/feedback_container.dart';

class FeedBackScreen extends StatelessWidget {
  const FeedBackScreen({super.key});

  @override
  Widget build(BuildContext context) {

    final currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: primaryColor,
              width: 2,
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: currentWidth*0.03,vertical: 20),
          child: Column(
            children: [
              FypText(text: "Feedback",color: primaryColor,fontSize: 17,fontWeight: FontWeight.bold,),
              SizedBox(height: 10,),
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(10, (index){
                      return FeedBackContainer();
                    }),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
