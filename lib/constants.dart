import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class PublicVariables {
  var mainColor = const Color(0xFF5650DE);
  var mainColor2 = const Color(0xFFF869D5);
  var darkenColor = const Color(0xFF1c177f);
  var activeColor = const Color(0xFF5650DE);
  var lightenColor = const Color(0xFFaaa7ee);
  var all10 = const EdgeInsets.all(10);
  var all5 = const EdgeInsets.all(5);
  var symmetricHorizontal = const EdgeInsets.symmetric(horizontal: 7.5);
  var symmetricVertical = const EdgeInsets.symmetric(vertical: 12.5);
  var normalText = GoogleFonts.lato(color: Colors.black, fontSize: 14);
  var normalItalizedText = GoogleFonts.lato(
      color: Colors.black, fontSize: 16, fontStyle: FontStyle.italic);
  var normalWhiteText = GoogleFonts.lato(color: Colors.white, fontSize: 16);
  var normalGreyText = GoogleFonts.lato(color: Colors.grey, fontSize: 14);
  var normalMainColorText =
      GoogleFonts.lato(color: const Color(0xFF5650DE), fontSize: 18);
  var normalMainColorTextSmall =
      GoogleFonts.lato(color: const Color(0xFF5650DE), fontSize: 16);
  var subheaderText = GoogleFonts.lato(color: Colors.black, fontSize: 20);
  var headerText = GoogleFonts.lato(color: Colors.black, fontSize: 26);
  var bannerText = GoogleFonts.lato(
      color: const Color(0xFF5650DE),
      fontSize: 34,
      fontWeight: FontWeight.w900);
  var titleText = GoogleFonts.lato(color: Colors.black, fontSize: 42);
  var borderCircular20 = BorderRadius.circular(20);
  var borderCircular10 = BorderRadius.circular(10);
  var shadow = const BoxShadow(
      color: Colors.grey, blurRadius: 2.5, offset: Offset(1, 1));
}
