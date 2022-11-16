import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class PublicVariables {
  var mainColor = const Color(0xFF5650DE);
  var accentColor = const Color(0xFFF869D5);
  var paddingAll = const EdgeInsets.all(7.5);
  var marginSymmetricVertical = const EdgeInsets.symmetric(vertical: 12.5);
  var normalText = GoogleFonts.lato(color: Colors.black, fontSize: 14);
  var normalItalizedText = GoogleFonts.lato(
      color: Colors.black, fontSize: 16, fontStyle: FontStyle.italic);
  var normalWhiteText = GoogleFonts.lato(color: Colors.white, fontSize: 14);
  var normalGreyText = GoogleFonts.lato(color: Colors.grey, fontSize: 14);
  var normalMainColorText =
      GoogleFonts.lato(color: const Color(0xFF5650DE), fontSize: 16);
  var subheaderText = GoogleFonts.lato(color: Colors.black, fontSize: 20);
  var headerText = GoogleFonts.lato(color: Colors.black, fontSize: 26);
  var bannerText = GoogleFonts.lato(
      color: const Color(0xFF5650DE),
      fontSize: 34,
      fontWeight: FontWeight.w900);
  var titleText = GoogleFonts.lato(color: Colors.black, fontSize: 42);
}
