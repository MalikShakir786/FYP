import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';

import 'fyp_text.dart';

class DropDownMenu extends StatefulWidget {
  DropDownMenu({
    Key? key,
    required this.title,
    required this.itemList,
    this.prefixIcon,
    this.labelColor = Colors.white
  }) : super(key: key);

  final String title;
  final List<String> itemList;
  final Icon? prefixIcon;
  final Color labelColor;

  @override
  State<DropDownMenu> createState() => _DropDownMenuState();
}

class _DropDownMenuState extends State<DropDownMenu> {
  String? selectedValue;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FypText(
          text: widget.title,
          fontWeight: FontWeight.w600,
          color: widget.labelColor,
        ),
        SizedBox(height: 10),
        Container(
          height: 40,
          padding: const EdgeInsets.symmetric(horizontal: 5),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
            border: Border.all(
              width: 1,
              color: primaryColor,
            ),
          ),
          child: Row(
            children: [
              if (widget.prefixIcon != null) ...[
                widget.prefixIcon!,
                SizedBox(width: 8),
              ],
              Expanded(
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    alignment: Alignment.bottomCenter,
                    dropdownColor: Colors.white,
                    isExpanded: true,
                    menuMaxHeight: 400,
                    value: selectedValue ?? widget.itemList.first,
                    items: widget.itemList.map<DropdownMenuItem<String>>((item) {
                      return DropdownMenuItem(
                        value: item,
                        child: FypText(
                          text: item,
                          fontSize: 14,
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    }).toList(),
                    onChanged: (value){
                      selectedValue = value;
                      setState(() {

                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
