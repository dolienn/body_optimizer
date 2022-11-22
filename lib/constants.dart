import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class PublicVariables {
  var mainColor = const Color(0xFF5650DE);
  var mainColor2 = const Color(0xFFF869D5);
  var all10 = const EdgeInsets.all(10);
  var all5 = const EdgeInsets.all(5);
  var symmetricHorizontal = const EdgeInsets.symmetric(horizontal: 7.5);
  var symmetricVertical = const EdgeInsets.symmetric(vertical: 12.5);
  var normalText = GoogleFonts.lato(color: Colors.black, fontSize: 16);
  var normalItalizedText = GoogleFonts.lato(
      color: Colors.black, fontSize: 16, fontStyle: FontStyle.italic);
  var normalWhiteText = GoogleFonts.lato(color: Colors.white, fontSize: 16);
  var normalGreyText = GoogleFonts.lato(color: Colors.grey, fontSize: 14);
  var normalMainColorText =
      GoogleFonts.lato(color: const Color(0xFF5650DE), fontSize: 18);
  var normalMainColorTextSmall =
      GoogleFonts.lato(color: const Color(0xFF5650DE), fontSize: 16);
  var boldText = GoogleFonts.lato(
      fontSize: 18, color: Colors.black, fontWeight: FontWeight.w700);
  var dropdownText = GoogleFonts.lato(
      fontSize: 16, fontWeight: FontWeight.w700, color: Colors.black);
  var setsText = GoogleFonts.lato(
      fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black54);
  var subheaderText = GoogleFonts.lato(color: Colors.black, fontSize: 20);
  var headerText = GoogleFonts.lato(color: Colors.black, fontSize: 24);
  var headerWhiteText = GoogleFonts.lato(color: Colors.white, fontSize: 24);
  var bannerText = GoogleFonts.lato(
      color: const Color(0xFF5650DE),
      fontSize: 32,
      fontWeight: FontWeight.w900);
  var pageNameText = GoogleFonts.lato(color: Colors.black, fontSize: 32);
  var titleText = GoogleFonts.lato(color: Colors.black, fontSize: 38);
  var borderCircular20 = BorderRadius.circular(20);
  var borderCircular10 = BorderRadius.circular(10);
  var shadow = const BoxShadow(
      color: Colors.grey, blurRadius: 2.5, offset: Offset(1, 1));
  DateTime today = DateTime.now();
}
