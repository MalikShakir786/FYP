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
        child: Stack(
          children: [
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 0,horizontal: 30),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 5,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: ListTile(
                title: FypText(
                  text: "GRT - 1021",
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: primaryColor,
                ),
                subtitle: FypText(
                  text: "GRT - 1021 has entered the . . .",
                  color: Colors.grey.shade700,
                  fontSize: 13,
                ),
               ),
            ),
            Positioned(
              top: 5,
              bottom: 5,
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(
                    color: primaryColor,
                    width: 5,
                  ),
                ),
                child: Center(
                  child: FypText(
                    text: "21",
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 20,
              top: 20,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(
                    color: primaryColor,
                    width: 5,
                  ),
                ),
                child: Center(
                  child: Icon(
                    Icons.star_rounded,
                    color: primaryColor,
                    size: 20,
                  ),
                ),
              ),
            ),
          ],
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
                height: 300,
                padding: EdgeInsets.all(30),
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(30),
                ),
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
                    SizedBox(height: 10),
                    FypText(
                      text: "GRT - 1021 has entered the university at 10:21 pm. Use this contact number to contact the driver: 0302-8742345",
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
                          text: "Ok",
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
