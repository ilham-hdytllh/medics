import 'package:flutter/material.dart';
import '../../constants/colors.dart';

class CustomSwitchheme {
  CustomSwitchheme._();

  static SwitchThemeData lightSwitchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.primary;
      }
      if (states.contains(MaterialState.disabled)) {
        return CustomColors.darkGrey;
      }
      return CustomColors.darkGrey;
    }),
    trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.orangeAccent.withOpacity(0.2);
      }
      if (states.contains(MaterialState.disabled)) {
        return CustomColors.grey;
      }
      return CustomColors.grey;
    }),
    trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
  );

  static SwitchThemeData darkSwitchTheme = SwitchThemeData(
    thumbColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return CustomColors.primary;
      }
      if (states.contains(MaterialState.disabled)) {
        return CustomColors.lightGrey;
      }
      return CustomColors.lightGrey;
    }),
    trackColor: MaterialStateProperty.resolveWith((Set<MaterialState> states) {
      if (states.contains(MaterialState.selected)) {
        return Colors.orangeAccent.withOpacity(0.2);
      }
      if (states.contains(MaterialState.disabled)) {
        return CustomColors.grey;
      }
      return CustomColors.grey;
    }),
    trackOutlineColor: const MaterialStatePropertyAll(Colors.transparent),
  );
}
