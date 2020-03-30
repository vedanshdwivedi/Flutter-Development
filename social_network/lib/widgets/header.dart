import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar header(context, {bool isAppTitle = false, String titleText}) {
  return AppBar(
    title: Text(
      isAppTitle ? "Cucekified" : titleText,
      style: isAppTitle
          ? GoogleFonts.mcLaren(textStyle: headerStyle())
          : GoogleFonts.lato(textStyle: profileStyle()),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}

TextStyle headerStyle() {
  return TextStyle(
    color: Colors.white, 
    fontSize: 50.0
  );
}

TextStyle profileStyle() {
  return TextStyle(
    color: Colors.white, 
    fontSize: 22.0,
  );
}
