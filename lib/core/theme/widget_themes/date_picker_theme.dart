import 'package:flutter/material.dart';
import '../../constants/colors.dart';
import '../../constants/sizes.dart';

class CustomDatePickerTheme {
  CustomDatePickerTheme._();

  static DatePickerThemeData lightDatePickerTheme = DatePickerThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CustomSizes.cardRadiusSm),
    ),
    elevation: 0,
    confirmButtonStyle: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    cancelButtonStyle: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    backgroundColor: CustomColors.white,
    surfaceTintColor: Colors.transparent,
    headerForegroundColor: CustomColors.white,
    headerBackgroundColor: CustomColors.primary,
    dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.white;
    }),
    todayForegroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.white;
      }
      return CustomColors.primary;
    }),
    todayBackgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.white;
    }),
    yearBackgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.white;
    }),
  );

  /// Customizable Dark Text Theme
  static DatePickerThemeData darkDatePickerTheme = DatePickerThemeData(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(CustomSizes.cardRadiusSm),
    ),
    elevation: 0,
    confirmButtonStyle: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    cancelButtonStyle: ButtonStyle(
      textStyle: MaterialStateProperty.all(
        const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.normal,
        ),
      ),
    ),
    backgroundColor: CustomColors.black,
    surfaceTintColor: Colors.transparent,
    headerForegroundColor: CustomColors.black,
    headerBackgroundColor: CustomColors.primary,
    dayBackgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.black;
    }),
    todayForegroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.black;
      }
      return CustomColors.primary;
    }),
    todayBackgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.black;
    }),
    yearBackgroundColor: MaterialStateProperty.resolveWith((states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.primary;
      }
      return CustomColors.black;
    }),
  );
}
