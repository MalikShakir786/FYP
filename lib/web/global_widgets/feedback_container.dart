import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fyp/utils/constants.dart';

import '../../../mobile/global_widgets/fyp_text.dart';

class FeedBackContainer extends StatelessWidget {
  const FeedBackContainer({super.key});

  @override
  Widget build(BuildContext context) {

    final currentWidth = MediaQuery.of(context).size.width;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipOval(
            child: Image.asset(FypImages.userAvatar,width: 30,height: 30,),
            // child: CachedNetworkImage(
            //   imageUrl: "",
            //   placeholder: (context, url) {
            //     return Image.asset(
            //       FypImages.userAvatar,
            //       fit: BoxFit.cover,
            //       height: 32,
            //     );
            //   },
            //   errorWidget: (context, url, error) {
            //     return Image.asset(
            //       FypImages.userAvatar,
            //       fit: BoxFit.cover,
            //       height: 32,
            //     );
            //   },
            //   fit: BoxFit.cover,
            //   height: 32,
            //   width: 32,
            // ),
          ),
          const SizedBox(width: 15),
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
                          text: "20011556-048@uog.edu.pk",
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                          color: primaryColor,
                        ),
                      ),
                      SizedBox(width: 10,),
                      FypText(
                        text: "11 : 10",
                        fontSize: 10,
                        color: Colors.grey,
                      ),
                    ],
                  ),
                  SizedBox(height: 5,),
                  Container(
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
                    child: FypText(
                      text: "jfkldsf sdfhjks fbsdkjfsd dsbfshdf fbdsfhsd fkdsf;dshf sdfkdsfms fkdsjfds fkdsbkfjdf sdkfbjksdf dkfbjdsfsd fbdskjf sdf igfkjf sdbfsdf idsbfids fdsbfsdf fkbsifdsf dsnkfbidshfksd fm dbfksdf dsfbdfbsdkf sdkfbkjdsbfds fm dsfbdskf dsfbsdkjfsd fdsfhkdsjfkds fdsfdskjfhkdsfkjdsbf dsfkdsjfdfds fkdsfjdskjfdsf sdfbkjsdhfkjdsf ",
                      fontSize: 12,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
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
