import 'package:flutter/material.dart';
import '../constants/colors.dart';

class TAppTheme {
  TAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    dataTableTheme: TDataTableTheme.lightDataTableTheme,
    switchTheme: TSwitchheme.lightSwitchTheme,
    disabledColor: TColors.grey,
    brightness: Brightness.light,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.lightTextTheme,
    chipTheme: TChipTheme.lightChipTheme,
    scaffoldBackgroundColor: TColors.white,
    appBarTheme: TAppBarTheme.lightAppBarTheme,
    checkboxTheme: TCheckboxTheme.lightCheckboxTheme,
    datePickerTheme: TDatePickerTheme.lightDatePickerTheme,
    timePickerTheme: TTimePickerTheme.lightTimePickerTheme,
    bottomSheetTheme: TBottomSheetTheme.lightBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.lightElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.lightOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.lightInputDecorationTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: TColors.primary),
    ),
    iconTheme: const IconThemeData(
      size: TSizes.iconMd,
      color: TColors.black,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Roboto',
    dataTableTheme: TDataTableTheme.darkDataTableTheme,
    switchTheme: TSwitchheme.darkSwitchTheme,
    disabledColor: TColors.grey,
    brightness: Brightness.dark,
    primaryColor: TColors.primary,
    textTheme: TTextTheme.darkTextTheme,
    chipTheme: TChipTheme.darkChipTheme,
    scaffoldBackgroundColor: TColors.black,
    appBarTheme: TAppBarTheme.darkAppBarTheme,
    checkboxTheme: TCheckboxTheme.darkCheckboxTheme,
    datePickerTheme: TDatePickerTheme.darkDatePickerTheme,
    timePickerTheme: TTimePickerTheme.darkTimePickerTheme,
    bottomSheetTheme: TBottomSheetTheme.darkBottomSheetTheme,
    elevatedButtonTheme: TElevatedButtonTheme.darkElevatedButtonTheme,
    outlinedButtonTheme: TOutlinedButtonTheme.darkOutlinedButtonTheme,
    inputDecorationTheme: TTextFormFieldTheme.darkInputDecorationTheme,
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(foregroundColor: TColors.primary),
    ),
    iconTheme: const IconThemeData(
      size: TSizes.iconMd,
      color: TColors.white,
    ),
  );
}
