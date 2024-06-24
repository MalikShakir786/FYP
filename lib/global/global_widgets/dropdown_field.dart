import 'package:flutter/material.dart';
import 'package:fyp/utils/constants.dart';
import 'fyp_text.dart';
import 'package:searchfield/searchfield.dart';

class DropDownField extends StatefulWidget {
  DropDownField({
    Key? key,
    required this.itemList,
    this.labelText,
    required this.controller,
    this.errorText,
    this.suffixIcon,
    this.prefixIcon,
    this.hintText = "",
    this.fillColor = Colors.white,
    this.labelColor = Colors.white,
    this.initialValue,
    this.fieldHeight = 40,
    this.onChange,
  }) : super(key: key);

  final List<String> itemList;
  final String? labelText;
  final TextEditingController controller;
  final String? errorText;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final String hintText;
  final Color fillColor;
  final Color labelColor;
  final String? initialValue;
  final double fieldHeight;
  final Function(String)? onChange; // Updated the type of onChange to accept a String argument

  @override
  _DropDownFieldState createState() => _DropDownFieldState();
}

class _DropDownFieldState extends State<DropDownField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.labelText != null)
          FypText(
            text: widget.labelText ?? "",
            fontWeight: FontWeight.w600,
            color: widget.labelColor,
          ),
        SizedBox(height: 10),
        SizedBox(
          height: widget.errorText != null ? widget.fieldHeight + 25 : widget.fieldHeight,
          child: SearchField(
            onTapOutside: (value) {
              FocusScope.of(context).unfocus();
            },
            initialValue: widget.initialValue != null
                ? SearchFieldListItem(
              widget.initialValue!,
              item: widget.initialValue!,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: FypText(
                  text: widget.initialValue!,
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
                : null,
            autofocus: false,
            suggestionsDecoration: SuggestionDecoration(
              color: primaryColor.withOpacity(0.2),
            ),
            searchStyle: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w700,
            ),
            controller: widget.controller,
            itemHeight: 40,
            searchInputDecoration: InputDecoration(
              errorText: widget.errorText,
              errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.red, width: 2)),
              hintText: widget.hintText,
              hintStyle: TextStyle(color: Colors.black26, fontSize: 13),
              suffixIcon: Icon(
                Icons.arrow_drop_down_outlined,
                color: primaryColor,
              ),
              prefixIcon: widget.prefixIcon,
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: primaryColor)),
              contentPadding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              fillColor: widget.fillColor,
              filled: true,
            ),
            onSuggestionTap: (SearchFieldListItem<String> x) {
              FocusScope.of(context).unfocus();
              widget.controller.text = x.item!;
              if (widget.onChange != null) {
                widget.onChange!(x.item!);
              }
            },
            suggestions: widget.itemList
                .map(
                  (e) => SearchFieldListItem(
                e,
                item: e,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: FypText(
                    text: e,
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
                .toList(),
          ),
        ),
      ],
    );
  }
}
