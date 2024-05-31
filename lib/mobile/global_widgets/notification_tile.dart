import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'fyp_text.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        showAlertDialog(context);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: ListTile(
            contentPadding: EdgeInsets.symmetric(horizontal: 10,),
            leading:  Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: FypText(
                  text: "21",
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
            title: FypText(text: "GRT - 1021",
            fontWeight: FontWeight.bold,
              fontSize: 16,
              color: primaryColor,
            ),
            subtitle: FypText(
              text: "GRT - 1021 has entered the . . .",
              color: Colors.grey.shade700,
              fontSize: 13,
            ),
            trailing: Icon(Icons.star_rounded,color: primaryColor,size: 30,),
          ),
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context){
  showDialog(context: context, builder: (BuildContext context){
    return Center(
      child: Material(
        type: MaterialType.transparency,
        child: Container(
          color: Colors.black.withOpacity(0.3),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Container(
                height: 320,
                padding: EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.white, borderRadius: BorderRadius.circular(30)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      FypIcons.infoIcon,
                      height: 70,
                      width: 70,
                    ),
                    FypText(
                      text: "GRT - 1021",
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: primaryColor,
                    ),
                    const SizedBox(height: 10),
                    FypText(text: "GRT - 1021 has entered the university at 10:21 pm, Use this contact number to contact the driver : 0302-8742345",
                    color: Colors.black,
                    ),
                    Spacer(),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Container(
                        height: 44,
                        width: 150,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.black,
                            width: 2,
                          ),
                          borderRadius: BorderRadius.circular(22),
                        ),
                        child: FypText(
                          text:"Ok",
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  });
}
