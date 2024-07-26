import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/global/global_providers/feedback_provider.dart';
import 'package:fyp/global/global_providers/user_provider.dart';
import 'package:fyp/utils/constants.dart';

import 'confirmation_alert.dart';
import 'fyp_text.dart';
import 'package:provider/provider.dart';

class FeedBackContainer extends StatelessWidget {
 FeedBackContainer({super.key,
 required this.email,
   required this.title,
   required this.review,
   required this.time,
   required this.onDelTap,
 });

  final String email;
  final String title;
  final String review;
  final String time;
  final VoidCallback onDelTap;

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        children: [
          ClipOval(
            child: Image.asset(FypImages.userAvatar,width: 30,height: 30,),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Container(
              constraints: const BoxConstraints(minWidth: 200),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: FypText(
                          text: email,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: primaryColor,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: 10,),
                      FypText(
                        text: time,
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Container(
                          constraints: const BoxConstraints(minWidth: 200),
                          decoration: BoxDecoration(
                            color: primaryColor.withOpacity(0.1),
                            border: Border.all(
                              width: 1,
                              color: primaryColor
                            ),
                            borderRadius: const BorderRadius.only(
                              topRight: Radius.circular(18),
                              bottomRight: Radius.circular(18),
                              bottomLeft: Radius.circular(18),
                            ),
                          ),
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              FypText(text: title,fontSize: 12,color: Colors.black,),
                              FypText(
                                text: review,
                                fontSize: 12,
                                color: Theme.of(context).colorScheme.secondary,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: GestureDetector(
                            onTap: (){
                              showDialog(
                                  barrierDismissible: false,
                                  barrierColor: Colors.black26,
                                  context: context, builder: (BuildContext context){
                                return ConfirmationAlert(
                                    isLoading: context.watch<FeedBackProvider>().isDelLoading,
                                    title: "Delete?", subTitle: "Do you want to delete this feedback?",
                                    onTap: onDelTap
                                );
                              });
                            },
                            child: Icon(Icons.delete,color: primaryColor,size: 24,)),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
