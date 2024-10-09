import 'package:flutter/material.dart';
import 'package:in_pos_multimerchant/utils/constants/colors.dart';

class CustomVerticalDivider extends StatelessWidget {
  const CustomVerticalDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return const VerticalDivider(
      width: 1,
      thickness: 2,
      color: TColors.grey,
    );
  }
}
