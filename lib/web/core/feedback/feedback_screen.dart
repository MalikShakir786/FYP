import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../global/global_providers/feedback_provider.dart';
import '../../../global/global_widgets/feedback_container.dart';
import '../../../global/global_widgets/fyp_text.dart';
import '../../../global/global_widgets/fyp_textfield.dart';
import '../../../utils/constants.dart';
import 'package:provider/provider.dart';

class FeedBackScreen extends StatefulWidget {
  const FeedBackScreen({super.key});

  @override
  State<FeedBackScreen> createState() => _FeedBackScreenState();
}

class _FeedBackScreenState extends State<FeedBackScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<FeedBackProvider>().getFeedback(context);
    });
  }

  void search(){
    setState(() {
      Future.delayed(Duration(milliseconds: 1000),(){
        context.read<FeedBackProvider>().searchFeedback(context);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentWidth = MediaQuery.of(context).size.width;
    final provider = context.watch<FeedBackProvider>();

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
          padding: EdgeInsets.symmetric(horizontal: currentWidth * 0.03, vertical: 20),
          child: Column(
            children: [
              FypText(
                text: "Feedback",
                color: primaryColor,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
              SizedBox(height: 10),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (constraints.maxWidth > 420) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Row(
                            children: [
                              Expanded(
                                flex:3,
                                child: FypTextField(
                                  onChange: (value){
                                    search();
                                  },
                                  controller: context.read<FeedBackProvider>().fEmailSearchController,
                                  labelText: "Email",
                                  hintText: "Email",
                                  labelColor: Colors.black,
                                  prefixIcon: Icon(Icons.email,color: primaryColor,),
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                flex:3,
                                child: FypTextField(
                                  onChange: (value){
                                    search();
                                  },
                                  controller: context.read<FeedBackProvider>().fTitleSearchController,
                                  labelText: "Title",
                                  hintText: "Title",
                                  labelColor: Colors.black,
                                  prefixIcon: Icon(Icons.title,color: primaryColor,),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    );
                  } else {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FypTextField(
                          onChange: (value){
                            search();
                          },
                          controller: context.read<FeedBackProvider>().fEmailSearchController,
                          labelText: "Email",
                          hintText: "Email",
                          labelColor: Colors.black,
                          prefixIcon: Icon(Icons.email,color: primaryColor,),
                        ),
                        SizedBox(height: 20),
                        FypTextField(
                          onChange: (value){
                            search();
                          },
                          controller: context.read<FeedBackProvider>().fTitleSearchController,
                          labelText: "Title",
                          hintText: "Title",
                          labelColor: Colors.black,
                          prefixIcon: Icon(Icons.title,color: primaryColor,),
                        ),
                      ],
                    );
                  }
                },
              ),
              SizedBox(height: 10,),
              Expanded(
                child: provider.isLoading
                    ? Center(
                  child: CircularProgressIndicator(color: primaryColor),
                )
                    : provider.feedbackList.isEmpty
                    ? Center(
                  child: FypText(
                    text: "No Feedbacks",
                    color: Colors.black,
                    fontSize: 15,
                  ),
                )
                    : SingleChildScrollView(
                  child: Column(
                    children: provider.feedbackList.map((feedback) {
                      return FeedBackContainer(
                        email: feedback.userEmail,
                        title: feedback.title,
                        review: feedback.review,
                        time: feedback.getFormattedDateTime(),
                        onDelTap: ()async{
                          await context.read<FeedBackProvider>().deleteFeedback(context, feedback.id);
                          Navigator.pop(context);
                        },
                      );
                    }).toList(),
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
