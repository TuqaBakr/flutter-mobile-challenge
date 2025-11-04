import 'package:flutter/material.dart';
import 'colors_manager.dart';

class StyleManager {

  //radius
  static const double _cornerRadius = 22.0;



  ///borders
  static OutlineInputBorder rightRoundedBorder({Color color = ColorsManager.grey }){
    return OutlineInputBorder(gapPadding:5,
      borderRadius: const BorderRadius.all(Radius.circular(_cornerRadius),
      ),
      borderSide: BorderSide(width: 1,color: color),
    );
  }
  static InputBorder buildCustomBorder({Color color = ColorsManager.lightGry}) => OutlineInputBorder(
    borderRadius: BorderRadius.only(
      bottomLeft: Radius.circular(22),
      bottomRight: Radius.circular(22),
      topLeft: Radius.circular(22),
      topRight: Radius.circular(22),
    ),
    borderSide: BorderSide(
      color: color,
      width: 1,
    ),
  );

  static const RoundedRectangleBorder rounded50 = RoundedRectangleBorder(
    borderRadius: BorderRadius.only(
      topRight: Radius.circular(50),
      bottomRight: Radius.circular(50),
    ),
  );
  static InputBorder borderRound40 = OutlineInputBorder(
    borderRadius: BorderRadius.circular(40),
    borderSide: BorderSide(
      color: Colors.grey.shade300,
    ),
  );


  static TextStyle label = TextStyle(
    fontSize:25,
    fontWeight: FontWeight.w600,
    color: ColorsManager.grey,
    fontFamily: 'Poppins',
  ) ;
  static TextStyle hint = TextStyle(
    fontSize: 12,
    color: ColorsManager.grey,
  ) ;
  static const TextStyle input = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: ColorsManager.black,
  );
  static TextStyle fontExtraBold14Black = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 14,
    color: ColorsManager.black
  );
  static TextStyle fontExtraBold18Black = TextStyle(
    fontWeight: FontWeight.w800,
    fontSize: 18,
    color:  ColorsManager.black

  );
}
