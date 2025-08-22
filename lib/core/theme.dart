import 'package:flutter/material.dart';
import 'package:restau/core/constants.dart';

final ThemeData appTheme = ThemeData(
  //etape 1 demande dela couleur pricipas des elemnts et la couleur de fond
  primaryColor: KPrimaryColors,
  scaffoldBackgroundColor: Colors.white,

  //les styles de couleur apliquer à toutes l'application

  colorScheme: ColorScheme.fromSeed(
    seedColor: KPrimaryColors,
    primary: KPrimaryColors,
    secondary: KAccentColors,
    // ignore: deprecated_member_use
    background: KbackgroundColor,
  ),

  //style de coulur qui seras appliquer  aux texts 

  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),


    titleMedium: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),

    bodyMedium: TextStyle(
      fontSize: 20, 
      fontWeight: 
      FontWeight.normal),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: KPrimaryColors,
      foregroundColor: KbackgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: KSmallPadding,
        horizontal: KLargePadding,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(KDefaulteBorderRadius),
      ),
    ),
  ),
);
//style: Theme.of(context).textTheme.bodyMedium