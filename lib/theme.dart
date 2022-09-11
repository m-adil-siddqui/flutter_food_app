import 'package:flutter/material.dart';

ThemeData theme(){
  return ThemeData(
    scaffoldBackgroundColor: Colors.white, // this is background color for entire screen
    // fontFamily: "Muli",
    appBarTheme: appBarTheme(),
    textTheme: textTheme(),
    inputDecorationTheme: inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity
  );
}


AppBarTheme appBarTheme(){
  return const AppBarTheme(
    color: Colors.white, //background color of app bar
    elevation: 0,
    iconTheme: IconThemeData(color: Colors.black), //color of app bar theme
  );
}


TextTheme textTheme() => const TextTheme(
  headline6: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
  
);

InputDecorationTheme inputDecorationTheme() {
  OutlineInputBorder outlineInputBorder = OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: Colors.grey),
                gapPadding: 10,
              );
              
  return InputDecorationTheme(
    floatingLabelBehavior: FloatingLabelBehavior.always,
              contentPadding: const EdgeInsets.symmetric(horizontal: 42, vertical: 20),
              enabledBorder: outlineInputBorder,
              focusedBorder: outlineInputBorder,
              errorBorder : OutlineInputBorder(
                borderRadius: BorderRadius.circular(28),
                borderSide: const BorderSide(color: Colors.red),
                gapPadding: 10,
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderSide: const BorderSide(color:Colors.red),
                borderRadius: BorderRadius.circular(28),
                gapPadding: 10,
              )
  );
}