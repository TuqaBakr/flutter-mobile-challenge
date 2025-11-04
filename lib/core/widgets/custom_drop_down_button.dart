import 'package:flutter/material.dart';
import '../utils/theme/colors_manager.dart';
import '../utils/theme/style_manager.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    super.key,
    required this.items,
    required this.label,
    this.hintText,
    this.onChangedString,
    this.onChangedInt,
    this.initialValue
  });
  final Map<String, int> items;
  final String? hintText;
  final String label;
  final void Function(int)? onChangedInt;
  final void Function(String)? onChangedString;
  final dynamic initialValue;
  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? selectedValue;
  bool isFocused = false ;
  late FocusNode _focusNode ;

  @override
  void initState() {
    super.initState();
    _focusNode = FocusNode()..addListener((){
      setState(() {
        isFocused = _focusNode.hasFocus;
      });
    });
    selectedValue = widget.initialValue;
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant CustomDropDownButton oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.initialValue != oldWidget.initialValue) {
      setState(() {
        selectedValue = widget.initialValue;
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withValues (alpha: 0.5),
            spreadRadius: 1.5,
            blurRadius: 7,
            offset: const Offset(0, 5),)
        ],
        color: ColorsManager.white,
        borderRadius: BorderRadius.circular(22),
      ),
      margin: const EdgeInsets.symmetric(horizontal: 15),
      child: InputDecorator(
        decoration: InputDecoration(
          floatingLabelBehavior: FloatingLabelBehavior.always,
          border: InputBorder.none,
          enabledBorder: InputBorder.none,
          focusedBorder: StyleManager.buildCustomBorder(color:Theme.of(context).primaryColor),
          errorBorder: StyleManager.buildCustomBorder(color: Colors.red),
          focusedErrorBorder: StyleManager.buildCustomBorder(color: Colors.red),
          contentPadding: EdgeInsets.zero,
        ),
        isFocused: isFocused,
        child: DropdownButton<String>(
          focusNode:_focusNode,
          isExpanded: true,
          value: selectedValue,
          hint: widget.hintText != null
              ? Text(
                  widget.hintText!,
                  style: StyleManager.input
                      .copyWith(color: ColorsManager.lightGry),
                )
              : null,
          focusColor: Theme.of(context).primaryColor,
          style: StyleManager.input,
          onChanged: (String? newValue) {
            setState(() {
              selectedValue = newValue;
            });
            if (widget.onChangedInt != null) {
              widget.onChangedInt!(widget.items[newValue]!);
            } else {
              widget.onChangedString!(newValue!);
            }
          },
          padding:const EdgeInsets.symmetric(vertical: 7, horizontal:30 ) ,
          borderRadius: BorderRadius.circular(22),
          items: widget.items.keys.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      ),
    );
  }
}
