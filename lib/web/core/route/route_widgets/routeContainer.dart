import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../../../global/global_widgets/fyp_text.dart';
import '../../../../utils/constants.dart';

class routeContainer extends StatelessWidget {
  final String rname;
  final String startlocation;
  final String endlocation;
  final String via;
  final String duration;
  final VoidCallback? onEditTap;
  final VoidCallback? onDelTap;

  const routeContainer({
    super.key,
    required this.rname,
    required this.startlocation,
    required this.endlocation,
    required this.via,
    required this.duration,
    this.onEditTap,
    this.onDelTap
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Center(
                  child: Container(
                    padding: EdgeInsets.all(15),
                    height: 50,
                    width: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: primaryColor,
                    ),
                    child: Center(
                      child: FypText(
                        text: rname,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onEditTap,
                  child: Icon(Icons.edit, color: primaryColor, size: 20),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: onDelTap,
                    child: Icon(Icons.delete, color: primaryColor, size: 20),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FypText(
                    text: "Source",
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: FypText(
                    text: startlocation,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FypText(
                    text: "Destination",
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: FypText(
                    text: endlocation,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FypText(
                    text: "Via : ",
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: FypText(
                    text: via,
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: FypText(
                    text: "Duration : ",
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: FypText(
                    text: duration.toString(),
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
